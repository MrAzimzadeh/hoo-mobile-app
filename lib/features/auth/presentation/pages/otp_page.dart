import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../application/auth_session.dart';
import '../../domain/auth_repository.dart';
import '../cubit/otp_bloc.dart';
import '../widgets/auth_widgets.dart';

/// Phone sign-in / sign-up with a 6-digit code (SMS, or WhatsApp as a fallback).
@RoutePage()
class OtpPage extends StatefulWidget {
  const OtpPage({super.key, this.phone, this.purpose = OtpPurpose.login, this.onResult});

  final String? phone;
  final OtpPurpose purpose;
  final void Function(bool success)? onResult;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> with AuthResultReporter {
  late final _bloc = OtpBloc(sl<AuthRepository>(), sl<AuthSession>(), initialPhone: widget.phone);
  late final _phone = TextEditingController(text: widget.phone == null ? '' : HooFormat.phone(widget.phone!).replaceFirst('+994 ', ''));
  final _name = TextEditingController();
  final _otpKey = GlobalKey<HooOtpFieldState>();
  bool _terms = false;
  bool _marketing = false;
  bool _termsMissing = false;

  @override
  void Function(bool success)? get onResult => widget.onResult;

  @override
  void dispose() {
    _bloc.close();
    _phone.dispose();
    _name.dispose();
    super.dispose();
  }

  void _sendCode([OtpChannel channel = OtpChannel.sms]) {
    if (!_terms) {
      setState(() => _termsMissing = true);
      return;
    }
    FocusScope.of(context).unfocus();
    _bloc.add(OtpPhoneSubmitted(phone: _phone.text, fullName: _name.text, acceptTerms: _terms, marketingConsent: _marketing, channel: channel));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<OtpBloc, OtpState>(
        listenWhen: (a, b) => a.step != b.step || a.error != b.error,
        listener: (context, s) {
          if (s.step == OtpStep.done && s.result != null) completeAuth(s.result!);
          if (s.step == OtpStep.code && s.error != null) _otpKey.currentState?.clear();
        },
        builder: (context, s) => Scaffold(
          appBar: HooAppBar(
            leading: s.step == OtpStep.code
                ? HooIconButton(icon: HooIcons.back, semanticLabel: l.a11yBack, onPressed: () => _bloc.add(const OtpEditPhone()))
                : null,
          ),
          body: SafeArea(
            child: AnimatedSwitcher(
              duration: context.hoo.motion(HooDurations.normal),
              switchInCurve: HooCurves.enter,
              child: s.step == OtpStep.phone ? _phoneStep(context, s) : _codeStep(context, s),
            ),
          ),
        ),
      ),
    );
  }

  Widget _phoneStep(BuildContext context, OtpState s) {
    final l = context.l10n;
    final api = s.apiError;
    final throttled = s.resendAt != null && s.resendAt!.isAfter(DateTime.now()) && (api?.isTooManyRequests ?? false);
    return ListView(
      key: const ValueKey('phone'),
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        AuthHeader(title: l.authOtpPhoneTitle, subtitle: l.authOtpPhoneSubtitle),
        const SizedBox(height: HooSpacing.xl),
        HooPhoneField(
          controller: _phone,
          label: l.authPhoneLabel,
          autofocus: widget.phone == null,
          errorText: api?.fieldError('phone'),
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: HooSpacing.md),
        HooTextField(
          controller: _name,
          label: '${l.authFullNameLabel} (${l.authOtpNameHint})',
          textCapitalization: TextCapitalization.words,
          autofillHints: const [AutofillHints.name],
        ),
        const SizedBox(height: HooSpacing.sm),
        HooCheckboxTile(value: _marketing, onChanged: (v) => setState(() => _marketing = v), label: Text(l.authMarketingConsent)),
        HooCheckboxTile(
          value: _terms,
          onChanged: (v) => setState(() {
            _terms = v;
            _termsMissing = false;
          }),
          label: Text(l.authAcceptTerms),
          errorText: _termsMissing || api?.code == 'auth.terms_required' ? l.authTermsRequired : null,
        ),
        if (api != null && api.fieldError('phone') == null && api.code != 'auth.terms_required')
          Padding(
            padding: const EdgeInsets.only(top: HooSpacing.md),
            child: throttled
                ? RetryCountdown(
                    until: s.resendAt!,
                    builder: (context, left) => InlineAlert(kind: HooAlertKind.warning, message: l.errorTooManyRequests(left.inSeconds)),
                  )
                : InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, api)),
          ),
        const SizedBox(height: HooSpacing.lg),
        ListenableBuilder(
          listenable: _phone,
          builder: (context, _) => PrimaryButton(
            label: l.authSendCode,
            loading: s.busy,
            onPressed: HooPhoneField.isComplete(_phone.text) && !throttled ? _sendCode : null,
          ),
        ),
      ],
    );
  }

  Widget _codeStep(BuildContext context, OtpState s) {
    final l = context.l10n;
    final api = s.apiError;
    return ListView(
      key: const ValueKey('code'),
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        AuthHeader(title: l.authOtpCodeTitle, subtitle: l.authOtpCodeSubtitle(s.maskedPhone)),
        const SizedBox(height: HooSpacing.xl),
        HooOtpField(
          key: _otpKey,
          enabled: !s.busy,
          errorText: api == null ? null : (api.isTooManyRequests ? l.errorTooManyRequests(api.retryAfter?.inSeconds ?? 60) : errorMessage(context, api)),
          onCompleted: (code) => _bloc.add(OtpCodeSubmitted(code)),
        ),
        const SizedBox(height: HooSpacing.lg),
        if (s.busy) const Center(child: HooLoading()),
        if (s.resendAt != null)
          RetryCountdown(
            until: s.resendAt!,
            builder: (context, left) => left > Duration.zero
                ? Text(l.authResendIn(HooFormat.countdown(left)), style: context.hoo.text.caption, textAlign: TextAlign.center)
                : Column(
                    children: [
                      HooTextButton(label: l.authResendSms, onPressed: () => _bloc.add(const OtpResendRequested(OtpChannel.sms))),
                      HooTextButton(label: l.authResendWhatsApp, onPressed: () => _bloc.add(const OtpResendRequested(OtpChannel.whatsApp))),
                    ],
                  ),
          ),
      ],
    );
  }
}
