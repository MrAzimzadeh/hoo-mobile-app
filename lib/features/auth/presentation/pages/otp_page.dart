import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../auth_flow.dart';
import '../bloc/otp_bloc.dart';
import '../widgets/auth_widgets.dart';

/// Phone sign-in with a one-time code (SMS or WhatsApp). Also the phone step of password reset.
@RoutePage()
class OtpPage extends StatelessWidget {
  const OtpPage({super.key, this.phone, this.purpose = OtpPurpose.login, this.onResult});

  final String? phone;
  final OtpPurpose purpose;
  final void Function(bool success)? onResult;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OtpBloc>(param1: purpose),
      child: _OtpView(phone: phone, purpose: purpose, onResult: onResult),
    );
  }
}

class _OtpView extends StatefulWidget {
  const _OtpView({this.phone, required this.purpose, this.onResult});
  final String? phone;
  final OtpPurpose purpose;
  final void Function(bool success)? onResult;

  @override
  State<_OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<_OtpView> {
  late final _phone = TextEditingController(text: widget.phone);
  final _name = TextEditingController();
  bool _terms = false;
  bool _marketing = false;

  @override
  void dispose() {
    _phone.dispose();
    _name.dispose();
    super.dispose();
  }

  void _send(OtpChannel channel) =>
      context.read<OtpBloc>().add(OtpPhoneSubmitted(_phone.text, channel: channel, fullName: _name.text, acceptTerms: _terms, marketingConsent: _marketing));

  void _onState(BuildContext context, OtpState state) {
    if (state.step != OtpStep.done) return;
    if (widget.purpose == OtpPurpose.resetPassword) {
      context.router.replace(ResetPasswordRoute(identifier: state.phone, token: state.verifiedCode));
    } else {
      AuthFlow.finish(context, onResult: widget.onResult, offerStyleProfile: state.isNewUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocConsumer<OtpBloc, OtpState>(
      listener: _onState,
      builder: (context, state) {
        final isCode = state.step == OtpStep.code;
        return AuthScaffold(
          title: isCode ? l.authOtpCodeTitle : l.authOtpPhoneTitle,
          subtitle: isCode ? l.authOtpCodeBody(state.maskedPhone) : l.authOtpPhoneBody,
          children: [
            FormErrorBanner(error: state.error),
            if (!isCode) ..._phoneStep(context, state) else ..._codeStep(context, state),
          ],
        );
      },
    );
  }

  List<Widget> _phoneStep(BuildContext context, OtpState state) {
    final l = context.l10n;
    final throttled = state.throttleLeft > Duration.zero;
    return [
      HooPhoneField(
        controller: _phone,
        label: l.authPhoneLabel,
        autofocus: true,
        errorText: issueText(context, state.phoneError),
        onSubmitted: (_) => _send(OtpChannel.sms),
      ),
      if (state.needsProfile) ...[
        const SizedBox(height: HooSpacing.md),
        InlineAlert(message: l.authOtpNewAccount),
        const SizedBox(height: HooSpacing.md),
        HooTextField(controller: _name, label: l.authFullNameLabel, textCapitalization: TextCapitalization.words, textInputAction: TextInputAction.done),
        const SizedBox(height: HooSpacing.sm),
        HooCheckboxTile(
          value: _terms,
          label: Text(l.authAcceptTerms, style: context.hoo.text.body),
          errorText: issueText(context, state.termsError),
          onChanged: (v) => setState(() => _terms = v),
        ),
        HooCheckboxTile(
          value: _marketing,
          label: Text(l.authMarketingConsent, style: context.hoo.text.body),
          onChanged: (v) => setState(() => _marketing = v),
        ),
      ],
      const SizedBox(height: HooSpacing.lg),
      if (throttled)
        RetryCountdown(
          until: state.throttledUntil!,
          builder: (context, r) => PrimaryButton(label: l.errorTooManyRequests(r.inSeconds + 1)),
        )
      else ...[
        PrimaryButton(
          label: l.authOtpSendSms,
          loading: state.sending && state.channel == OtpChannel.sms,
          onPressed: state.canSend ? () => _send(OtpChannel.sms) : null,
        ),
        const SizedBox(height: HooSpacing.sm),
        SecondaryButton(
          label: l.authOtpSendWhatsapp,
          loading: state.sending && state.channel == OtpChannel.whatsApp,
          onPressed: state.canSend ? () => _send(OtpChannel.whatsApp) : null,
        ),
      ],
    ];
  }

  List<Widget> _codeStep(BuildContext context, OtpState state) {
    final l = context.l10n;
    final bloc = context.read<OtpBloc>();
    final wait = state.resendIn;
    return [
      HooOtpField(
        enabled: !state.verifying,
        errorText: issueText(context, state.codeError),
        onChanged: (_) => bloc.add(const OtpCodeEdited()),
        onCompleted: (code) => bloc.add(OtpCodeSubmitted(code)),
      ),
      const SizedBox(height: HooSpacing.md),
      if (state.verifying) const Center(child: HooLoading()),
      if (state.resent)
        Text(
          l.authOtpResent,
          textAlign: TextAlign.center,
          style: context.hoo.text.caption.copyWith(color: context.hoo.colors.textSecondary),
        ),
      const SizedBox(height: HooSpacing.md),
      if (!state.canResend)
        Center(
          child: Text(l.authOtpResendIn(wait.inSeconds + 1), style: context.hoo.text.caption.copyWith(color: context.hoo.colors.textSecondary)),
        )
      else
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () => bloc.add(const OtpResendRequested(OtpChannel.sms)), child: Text(l.authOtpResendSms)),
            TextButton(onPressed: () => bloc.add(const OtpResendRequested(OtpChannel.whatsApp)), child: Text(l.authOtpResendWhatsapp)),
          ],
        ),
      Center(
        child: TextButton(onPressed: () => bloc.add(const OtpChangePhoneRequested()), child: Text(l.authOtpChangePhone)),
      ),
    ];
  }
}
