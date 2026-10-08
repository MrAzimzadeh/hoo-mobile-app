import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/auth_models.dart';
import '../../domain/auth_repository.dart';
import '../../domain/auth_validation.dart';
import 'auth_errors.dart';

sealed class OtpEvent {
  const OtpEvent();
}

/// Phone step submitted. [fullName]/[acceptTerms] are only used when the phone has no account yet.
final class OtpPhoneSubmitted extends OtpEvent {
  const OtpPhoneSubmitted(this.phone, {this.channel = OtpChannel.sms, this.fullName = '', this.acceptTerms = false, this.marketingConsent = false});
  final String phone;
  final OtpChannel channel;
  final String fullName;
  final bool acceptTerms;
  final bool marketingConsent;
}

final class OtpResendRequested extends OtpEvent {
  const OtpResendRequested(this.channel);
  final OtpChannel channel;
}

final class OtpCodeSubmitted extends OtpEvent {
  const OtpCodeSubmitted(this.code);
  final String code;
}

/// Back to the phone step ("Use a different number").
final class OtpChangePhoneRequested extends OtpEvent {
  const OtpChangePhoneRequested();
}

final class OtpCodeEdited extends OtpEvent {
  const OtpCodeEdited();
}

final class _OtpTicked extends OtpEvent {
  const _OtpTicked();
}

enum OtpStep { phone, code, done }

class OtpState extends Equatable {
  const OtpState({
    required this.purpose,
    this.step = OtpStep.phone,
    this.phone = '',
    this.maskedPhone = '',
    this.channel = OtpChannel.sms,
    this.fullName = '',
    this.acceptTerms = false,
    this.marketingConsent = false,
    this.sending = false,
    this.verifying = false,
    this.resendAt,
    this.throttledUntil,
    this.now,
    this.phoneError,
    this.codeError,
    this.termsError,
    this.error,
    this.resent = false,
    this.needsProfile = false,
    this.isNewUser = false,
    this.verifiedCode,
  });

  final OtpPurpose purpose;
  final OtpStep step;

  /// Wire format `+994…`.
  final String phone;
  final String maskedPhone;
  final OtpChannel channel;
  final String fullName;
  final bool acceptTerms;
  final bool marketingConsent;
  final bool sending;
  final bool verifying;

  /// When resending becomes possible (server's `resendAfterSeconds`).
  final DateTime? resendAt;

  /// 429: no new request until then (send button and resend links count down).
  final DateTime? throttledUntil;

  /// Last tick — drives the countdowns without reading the clock in widgets.
  final DateTime? now;
  final FieldIssue? phoneError;
  final FieldIssue? codeError;

  /// New account (after `auth.terms_required`): the terms checkbox must be ticked.
  final FieldIssue? termsError;
  final ApiException? error;

  /// A code was re-sent (shows a short confirmation for the chosen channel).
  final bool resent;

  /// The phone has no account and the server asked for a name + terms (`auth.terms_required`).
  final bool needsProfile;
  final bool isNewUser;

  /// [OtpPurpose.resetPassword]: the code to hand to the reset-password step.
  final String? verifiedCode;

  Duration _left(DateTime? until) {
    if (until == null || now == null) return Duration.zero;
    final d = until.difference(now!);
    return d.isNegative ? Duration.zero : d;
  }

  Duration get resendIn {
    final a = _left(resendAt), b = _left(throttledUntil);
    return a > b ? a : b;
  }

  Duration get throttleLeft => _left(throttledUntil);
  bool get canResend => step == OtpStep.code && !sending && !verifying && resendIn == Duration.zero;
  bool get canSend => !sending && throttleLeft == Duration.zero;

  OtpState copyWith({
    OtpStep? step,
    String? phone,
    String? maskedPhone,
    OtpChannel? channel,
    String? fullName,
    bool? acceptTerms,
    bool? marketingConsent,
    bool? sending,
    bool? verifying,
    DateTime? Function()? resendAt,
    DateTime? Function()? throttledUntil,
    DateTime? now,
    FieldIssue? Function()? phoneError,
    FieldIssue? Function()? codeError,
    FieldIssue? Function()? termsError,
    ApiException? Function()? error,
    bool? resent,
    bool? needsProfile,
    bool? isNewUser,
    String? Function()? verifiedCode,
  }) => OtpState(
    purpose: purpose,
    step: step ?? this.step,
    phone: phone ?? this.phone,
    maskedPhone: maskedPhone ?? this.maskedPhone,
    channel: channel ?? this.channel,
    fullName: fullName ?? this.fullName,
    acceptTerms: acceptTerms ?? this.acceptTerms,
    marketingConsent: marketingConsent ?? this.marketingConsent,
    sending: sending ?? this.sending,
    verifying: verifying ?? this.verifying,
    resendAt: resendAt != null ? resendAt() : this.resendAt,
    throttledUntil: throttledUntil != null ? throttledUntil() : this.throttledUntil,
    now: now ?? this.now,
    phoneError: phoneError != null ? phoneError() : this.phoneError,
    codeError: codeError != null ? codeError() : this.codeError,
    termsError: termsError != null ? termsError() : this.termsError,
    error: error != null ? error() : this.error,
    resent: resent ?? this.resent,
    needsProfile: needsProfile ?? this.needsProfile,
    isNewUser: isNewUser ?? this.isNewUser,
    verifiedCode: verifiedCode != null ? verifiedCode() : this.verifiedCode,
  );

  @override
  List<Object?> get props => [
    purpose,
    step,
    phone,
    maskedPhone,
    channel,
    fullName,
    acceptTerms,
    marketingConsent,
    sending,
    verifying,
    resendAt,
    throttledUntil,
    now,
    phoneError,
    codeError,
    termsError,
    error,
    resent,
    needsProfile,
    isNewUser,
    verifiedCode,
  ];
}

/// Phone + one-time code: send (SMS / WhatsApp), resend timer, 429 countdown, verify (signs in, or creates the
/// account with name + terms). For [OtpPurpose.resetPassword] the code is handed to the reset step instead.
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc(this._repository, {OtpPurpose purpose = OtpPurpose.login, DateTime Function()? now, Duration tick = const Duration(seconds: 1)})
    : _clock = now ?? DateTime.now,
      _tick = tick,
      super(OtpState(purpose: purpose)) {
    on<OtpPhoneSubmitted>(_onPhone);
    on<OtpResendRequested>(_onResend);
    on<OtpCodeSubmitted>(_onCode);
    on<OtpChangePhoneRequested>((_, emit) => emit(state.copyWith(step: OtpStep.phone, codeError: () => null, error: () => null, resent: false)));
    on<OtpCodeEdited>((_, emit) {
      if (state.codeError != null || state.error != null) emit(state.copyWith(codeError: () => null, error: () => null));
    });
    on<_OtpTicked>(_onTick);
  }

  final AuthRepository _repository;
  final DateTime Function() _clock;
  final Duration _tick;
  Timer? _timer;
  String? _lastCode;

  static const codeLength = 6;

  Future<void> _onPhone(OtpPhoneSubmitted event, Emitter<OtpState> emit) async {
    if (!state.canSend) return;
    if (event.phone.trim().isEmpty) {
      emit(state.copyWith(phoneError: () => const FieldIssue.local(AuthFieldError.required)));
      return;
    }
    if (!AuthValidation.isAzPhone(event.phone)) {
      emit(state.copyWith(phoneError: () => const FieldIssue.local(AuthFieldError.invalidPhone)));
      return;
    }
    if (state.needsProfile && !event.acceptTerms) {
      emit(state.copyWith(phoneError: () => null, termsError: () => const FieldIssue.local(AuthFieldError.termsRequired)));
      return;
    }
    final phone = HooFormat.phoneWire(event.phone);
    emit(
      state.copyWith(
        termsError: () => null,
        phone: phone,
        channel: event.channel,
        fullName: event.fullName.trim(),
        acceptTerms: event.acceptTerms,
        marketingConsent: event.marketingConsent,
        phoneError: () => null,
        error: () => null,
      ),
    );
    await _send(emit, resend: false);
  }

  Future<void> _onResend(OtpResendRequested event, Emitter<OtpState> emit) async {
    if (!state.canResend) return;
    emit(state.copyWith(channel: event.channel));
    await _send(emit, resend: true);
  }

  Future<void> _send(Emitter<OtpState> emit, {required bool resend}) async {
    emit(state.copyWith(sending: true, error: () => null, codeError: () => null, resent: false, now: _clock()));
    try {
      final OtpSent sent;
      if (state.purpose == OtpPurpose.resetPassword) {
        // the forgot-password endpoint sends the SMS code and never reveals whether the account exists
        await _repository.forgotPassword(state.phone);
        sent = OtpSent(maskedPhone: HooFormat.phone(state.phone));
      } else {
        sent = await _repository.sendOtp(phone: state.phone, purpose: state.purpose, channel: state.channel);
      }
      final now = _clock();
      _lastCode = null;
      emit(
        state.copyWith(
          step: OtpStep.code,
          sending: false,
          maskedPhone: sent.maskedPhone.isEmpty ? HooFormat.phone(state.phone) : sent.maskedPhone,
          resendAt: () => now.add(Duration(seconds: sent.resendAfterSeconds)),
          throttledUntil: () => null,
          now: now,
          resent: resend,
        ),
      );
      _startTicker();
    } on ApiException catch (e) {
      final now = _clock();
      if (e.isTooManyRequests) {
        final until = now.add(throttleOf(e));
        // "resend too soon" means a code is already on its way — go (or stay) on the code step
        final toCode = e.code == ErrorCodes.otpResendTooSoon;
        emit(
          state.copyWith(
            sending: false,
            step: toCode ? OtpStep.code : state.step,
            maskedPhone: state.maskedPhone.isEmpty ? HooFormat.phone(state.phone) : state.maskedPhone,
            throttledUntil: () => until,
            now: now,
            error: () => toCode && !resend ? null : e,
          ),
        );
        _startTicker();
        return;
      }
      final phoneIssue = serverFieldIssues(e, const ['phone'])['phone'];
      emit(state.copyWith(sending: false, now: now, phoneError: () => phoneIssue, error: () => phoneIssue != null ? null : e));
    }
  }

  Future<void> _onCode(OtpCodeSubmitted event, Emitter<OtpState> emit) async {
    final code = event.code.trim();
    if (state.verifying || state.step != OtpStep.code) return;
    if (code.length != codeLength || int.tryParse(code) == null) {
      emit(state.copyWith(codeError: () => const FieldIssue.local(AuthFieldError.invalidCode)));
      return;
    }
    // the same code is not re-submitted after a failure (SMS autofill fires twice on some devices)
    if (code == _lastCode && state.codeError != null) return;
    _lastCode = code;

    if (state.purpose == OtpPurpose.resetPassword) {
      emit(state.copyWith(step: OtpStep.done, verifiedCode: () => code));
      return;
    }
    if (state.purpose == OtpPurpose.verifyPhone) {
      // TODO(backend): there is no endpoint that confirms a VerifyPhone code for a signed-in user
      // (`/auth/otp/verify` only checks the Login purpose and would sign in as the phone's owner).
      emit(state.copyWith(error: () => const ApiException(statusCode: 501, code: ErrorCodes.unknown)));
      return;
    }

    emit(state.copyWith(verifying: true, codeError: () => null, error: () => null));
    try {
      final r = await _repository.verifyOtp(
        VerifyOtpRequest(
          phone: state.phone,
          code: code,
          fullName: state.fullName.isEmpty ? null : state.fullName,
          acceptTerms: state.acceptTerms,
          marketingConsent: state.marketingConsent,
        ),
      );
      _timer?.cancel();
      emit(state.copyWith(verifying: false, step: OtpStep.done, isNewUser: r.isNewUser));
    } on ApiException catch (e) {
      switch (e.code) {
        case ErrorCodes.termsRequired:
          // TODO(backend): VerifyOtpAsync consumes the code before checking AcceptTerms, so after this error the
          // customer has to request a new code. Ideally terms are checked first (or the code stays valid).
          emit(state.copyWith(verifying: false, step: OtpStep.phone, needsProfile: true, error: () => e, resendAt: () => null));
        case ErrorCodes.otpInvalid:
          emit(state.copyWith(verifying: false, codeError: () => FieldIssue.server(e.title ?? '')));
        case ErrorCodes.otpExpired || AuthErrorCodes.otpTooManyAttempts:
          // the code is gone — let them resend right away
          emit(state.copyWith(verifying: false, error: () => e, resendAt: () => null));
        default:
          emit(state.copyWith(verifying: false, error: () => e));
      }
    }
  }

  void _onTick(_OtpTicked event, Emitter<OtpState> emit) {
    final next = state.copyWith(now: _clock());
    emit(next);
    if (next.resendIn == Duration.zero) _timer?.cancel();
  }

  void _startTicker() {
    _timer?.cancel();
    _timer = Timer.periodic(_tick, (_) {
      if (!isClosed) add(const _OtpTicked());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
