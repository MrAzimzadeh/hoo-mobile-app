import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../cubit/track_and_gift_cubits.dart';

/// Gift receipt: the recipient enters the code and their phone, sees the (price-less) gift and may exchange a size.
@RoutePage()
class GiftReceiptPage extends StatelessWidget {
  const GiftReceiptPage({super.key, @PathParam('code') this.code});

  final String? code;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<GiftReceiptCubit>(param1: code),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final _code = TextEditingController(text: context.read<GiftReceiptCubit>().state.code);
  final _phone = TextEditingController();

  @override
  void dispose() {
    _code.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return BlocBuilder<GiftReceiptCubit, GiftReceiptState>(
      builder: (context, state) {
        final cubit = context.read<GiftReceiptCubit>();
        Widget body;
        if (state.exchange != null) {
          body = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HooSuccessCheck(),
              const SizedBox(height: HooSpacing.lg),
              Text(l.ordersReturnSent, style: t.h2, textAlign: TextAlign.center),
              const SizedBox(height: HooSpacing.xl),
              PrimaryButton(label: l.commonDone, onPressed: () => context.router.maybePop()),
            ],
          );
        } else if (state.step == GiftReceiptStep.ready && state.receipt != null) {
          final r = state.receipt!;
          body = ListView(
            children: [
              Text(l.ordersGiftFor(r.recipientName), style: t.h2),
              if (r.fromName != null) Text(l.ordersGiftFrom(r.fromName!), style: t.body.copyWith(color: c.textSecondary)),
              const SizedBox(height: HooSpacing.md),
              if (state.submitError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: HooSpacing.md),
                  child: InlineAlert(message: errorMessage(context, state.submitError!), kind: HooAlertKind.error),
                ),
              for (final line in r.lines) ...[
                HooCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(line.name, style: t.bodyStrong),
                      Text(
                        [?line.color, if (line.size != null && line.size != Size.unknown) line.size!.label, '×${line.quantity}'].join(' · '),
                        style: t.caption.copyWith(color: c.textSecondary),
                      ),
                      if (r.exchangeAllowed && line.exchangeable && line.availableSizes.isNotEmpty) ...[
                        const SizedBox(height: HooSpacing.sm),
                        Text(l.ordersReturnNewSize, style: t.caption),
                        const SizedBox(height: HooSpacing.xxs),
                        Wrap(
                          spacing: HooSpacing.xs,
                          children: [
                            for (final s in line.availableSizes)
                              OptionChip(
                                label: s.label,
                                minWidth: 44,
                                selected: state.sizes[line.lineId] == s,
                                onTap: () => cubit.selectSize(line.lineId, state.sizes[line.lineId] == s ? null : s),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: HooSpacing.sm),
              ],
              if (!r.exchangeAllowed)
                InlineAlert(message: l.ordersGiftExchangeClosed, kind: HooAlertKind.warning)
              else if (r.exchangeDeadline != null)
                Text(l.ordersGiftExchangeUntil(HooFormat.date(context, r.exchangeDeadline!)), style: t.caption.copyWith(color: c.textSecondary)),
              const SizedBox(height: HooSpacing.lg),
              if (r.exchangeAllowed)
                PrimaryButton(label: l.ordersGiftExchange, loading: state.submitting, onPressed: state.canExchange ? () => cubit.exchange() : null),
            ],
          );
        } else {
          body = ListView(
            children: [
              Text(l.ordersGiftSubtitle, style: t.body.copyWith(color: c.textSecondary)),
              const SizedBox(height: HooSpacing.lg),
              if (state.error != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: HooSpacing.md),
                  child: InlineAlert(message: errorMessage(context, state.error!), kind: HooAlertKind.error),
                ),
              HooTextField(
                controller: _code,
                label: l.ordersGiftCode,
                textCapitalization: TextCapitalization.characters,
                textInputAction: TextInputAction.next,
                errorText: state.codeMissing ? l.fieldRequired : null,
              ),
              const SizedBox(height: HooSpacing.md),
              HooPhoneField(
                controller: _phone,
                label: l.checkoutPhone,
                errorText: state.phoneInvalid ? l.fieldInvalidPhone : null,
                onSubmitted: (_) => cubit.open(code: _code.text, phoneInput: _phone.text),
              ),
              const SizedBox(height: HooSpacing.lg),
              PrimaryButton(
                label: l.ordersGiftOpen,
                loading: state.step == GiftReceiptStep.loading,
                onPressed: state.step == GiftReceiptStep.loading ? null : () => cubit.open(code: _code.text, phoneInput: _phone.text),
              ),
            ],
          );
        }
        return Scaffold(
          backgroundColor: c.background,
          appBar: HooAppBar(title: l.checkoutGiftReceipt),
          body: SafeArea(
            child: HooConstrained(
              child: Padding(padding: const EdgeInsets.all(HooSpacing.screen), child: body),
            ),
          ),
        );
      },
    );
  }
}
