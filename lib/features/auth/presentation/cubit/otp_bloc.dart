import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../shared/domain/enums.dart';
import '../../application/auth_session.dart';
import '../../domain/auth_models.dart';
import '../../domain/auth_repository.dart';

sealed class OtpEvent {
  const OtpEvent();
}

/// Phone step submitted (national digits) with the consents a first-time customer gives up front — the backend
/// consumes the code before it checks the terms, so they can't be asked afterwards.
class OtpPhoneSubmitted extends OtpEvent {
  const OtpPhoneSubmitted({required this.phone, this.fullName, required this.acceptTerms, required this.marketingConsent, this.channel = OtpChannel.sms});
  final String phone;
  final String? fullName;
  final bool acceptTerms;
  final bool marketingConsent;
  final OtpChannel channel;
}

class OtpResendRequested extends OtpEvent {
  const OtpResendRequested(this.channel);
  final OtpChannel channel;
}

class OtpCodeSubmitted extends OtpEvent {
  const OtpCodeSubmitted(this.code);
  final String code;
}

class OtpEditPhone extends OtpEvent {
  const OtpEditPhone();
}

enum OtpStep { phone, code, done }

class OtpState extends Equatable {
  const OtpState({
    this.step = OtpStep.phone,
    this.phone = '',
    this.fullName,
    this.acceptTerms = false,
    this.marketingConsent = false,
    this.channel = OtpChannel.sms,
    this.maskedPhone = '',
    this.resendAt,
    this.busy = false,
    this.error,
    this.result,
  });

  final OtpStep step;

  /// Wire format (+994…).
  final String phone;
  final String? fullName;
  final bool acceptTerms;
  final bool marketingConsent;
  final OtpChannel channel;
  final String maskedPhone;

  /// Resend (and 429 retry) allowed from this moment.
  final DateTime? resendAt;
  final bool busy;
  final Object? error;
  final AuthResult? result;

  ApiException? get apiError => error is ApiException ? error as ApiException : null;

  OtpState copyWith({
    OtpStep? step,
    String? phone,
    String? Function()? fullName,
    bool? acceptTerms,
    bool? marketingConsent,
    OtpChannel? channel,
    String? maskedPhone,
    DateTime? Function()? resendAt,
    bool? busy,
    Object? Function()? error,
    AuthResult? result,
  }) =>
      OtpState(
        step: step ?? this.step,
        phone: phone ?? this.phone,
        fullName: fullName == null ? this.fullName : fullName(),
        acceptTerms: acceptTerms ?? this.acceptTerms,
        marketingConsent: marketingConsent ?? this.marketingConsent,
        channel: channel ?? this.channel,
        maskedPhone: maskedPhone ?? this.maskedPhone,
        resendAt: resendAt == null ? this.resendAt : resendAt(),
        busy: busy ?? this.busy,
        error: error == null ? this.error : error(),
        result: result ?? this.result,
      );

  @override
  List<Object?> get props => [step, phone, fullName, acceptTerms, marketingConsent, channel, maskedPhone, resendAt, busy, error, result];
}

/// Phone sign-in: send code (SMS or WhatsApp) → verify → session. Handles resend timers and 429 throttling.
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc(this._repo, this._session, {String? initialPhone}) : super(OtpState(phone: initialPhone ?? '')) {
    on<OtpPhoneSubmitted>(_onPhone);
    on<OtpResendRequested>(_onResend);
    on<OtpCodeSubmitted>(_onCode);
    on<OtpEditPhone>((e, emit) => emit(state.copyWith(step: OtpStep.phone, error: () => null)));
  }

  final AuthRepository _repo;
  final AuthSession _session;

  Future<void> _onPhone(OtpPhoneSubmitted e, Emitter<OtpState> emit) async {
    final phone = HooFormat.phoneWire(e.phone);
    emit(state.copyWith(
      phone: phone,
      fullName: () => e.fullName,
      acceptTerms: e.acceptTerms,
      marketingConsent: e.marketingConsent,
      channel: e.channel,
      busy: true,
      error: () => null,
    ));
    await _send(emit, e.channel);
  }

  Future<void> _onResend(OtpResendRequested e, Emitter<OtpState> emit) async {
    if (state.busy) return;
    final at = state.resendAt;
    if (at != null && at.isAfter(DateTime.now())) return;
    emit(state.copyWith(busy: true, channel: e.channel, error: () => null));
    await _send(emit, e.channel);
  }

  Future<void> _send(Emitter<OtpState> emit, OtpChannel channel) async {
    try {
      final sent = await _repo.sendOtp(phone: state.phone, channel: channel);
      emit(state.copyWith(
        step: OtpStep.code,
        busy: false,
        maskedPhone: sent.maskedPhone.isEmpty ? HooFormat.phone(state.phone) : sent.maskedPhone,
        resendAt: () => DateTime.now().add(Duration(seconds: sent.resendAfterSeconds)),
      ));
    } on ApiException catch (e) {
      emit(state.copyWith(
        busy: false,
        error: () => e,
        resendAt: e.isTooManyRequests ? () => DateTime.now().add(e.retryAfter ?? const Duration(seconds: 60)) : null,
      ));
    }
  }

  Future<void> _onCode(OtpCodeSubmitted e, Emitter<OtpState> emit) async {
    if (state.busy) return;
    emit(state.copyWith(busy: true, error: () => null));
    try {
      final result = await _repo.verifyOtp(
        phone: state.phone,
        code: e.code,
        fullName: state.fullName,
        acceptTerms: state.acceptTerms,
        marketingConsent: state.marketingConsent,
      );
      _session.signedIn(result);
      emit(state.copyWith(step: OtpStep.done, busy: false, result: result));
    } on ApiException catch (err) {
      // auth.terms_required: a first-time number without consent → back to the phone step with the consent visible
      final backToPhone = err.code == 'auth.terms_required';
      emit(state.copyWith(
        busy: false,
        error: () => err,
        step: backToPhone ? OtpStep.phone : null,
        resendAt: err.isTooManyRequests ? () => DateTime.now().add(err.retryAfter ?? const Duration(seconds: 60)) : null,
      ));
    }
  }
}
