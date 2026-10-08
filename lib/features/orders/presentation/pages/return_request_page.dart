import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/models/order_models.dart';
import '../../domain/return_form.dart';
import '../cubit/return_request_cubit.dart';

/// Request a return or an exchange: pick lines + quantities, a new size for exchanges, a reason (and the phone
/// for guests).
@RoutePage()
class ReturnRequestPage extends StatelessWidget {
  const ReturnRequestPage({super.key, @PathParam('number') required this.number, this.phone});

  final String number;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    final access = phone == null ? OrderAccess.account(number) : OrderAccess.guest(number, phone!);
    return BlocProvider(create: (_) => sl<ReturnRequestCubit>()..load(access), child: const _View());
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  final _reason = TextEditingController();
  final _phone = TextEditingController();

  @override
  void dispose() {
    _reason.dispose();
    _phone.dispose();
    super.dispose();
  }

  String _issue(AppLocalizations l, ReturnFormIssue i) => switch (i) {
    ReturnFormIssue.noItems => l.ordersReturnNoItems,
    ReturnFormIssue.exchangeSizeMissing => l.ordersReturnSizeMissing,
    ReturnFormIssue.exchangeSameSize => l.ordersReturnSameSize,
    ReturnFormIssue.reasonTooLong => l.ordersReturnReasonLong,
    ReturnFormIssue.phoneInvalid => l.fieldInvalidPhone,
  };

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return BlocBuilder<ReturnRequestCubit, ReturnRequestState>(
      builder: (context, state) {
        final cubit = context.read<ReturnRequestCubit>();
        final form = state.form;
        Widget body;
        if (state.status == ReturnRequestStatus.loading) {
          body = const Center(child: HooLoading());
        } else if (state.status == ReturnRequestStatus.failure) {
          body = HooErrorState(error: state.error!, onRetry: () => cubit.load(state.access));
        } else if (state.status == ReturnRequestStatus.notReturnable || form == null) {
          body = HooEmptyState(title: l.ordersReturnNotAvailable, message: l.ordersReturnNotAvailableHint, icon: HooIcons.package);
        } else if (state.result != null) {
          body = Padding(
            padding: const EdgeInsets.all(HooSpacing.screen),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HooSuccessCheck(),
                const SizedBox(height: HooSpacing.lg),
                Text(l.ordersReturnSent, style: t.h2, textAlign: TextAlign.center),
                const SizedBox(height: HooSpacing.xs),
                Text(
                  l.ordersReturnSentBody,
                  style: t.body.copyWith(color: c.textSecondary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: HooSpacing.xl),
                PrimaryButton(label: l.commonDone, onPressed: () => context.router.maybePop()),
              ],
            ),
          );
        } else {
          final issues = state.visibleIssues;
          body = ListView(
            padding: const EdgeInsets.all(HooSpacing.screen),
            children: [
              if (state.submitError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: HooSpacing.md),
                  child: InlineAlert(message: errorMessage(context, state.submitError!), kind: HooAlertKind.error),
                ),
              Row(
                children: [
                  OptionChip(
                    label: l.ordersReturnKindReturn,
                    uppercase: false,
                    selected: form.kind == ReturnKind.returnItem,
                    onTap: () => cubit.setKind(ReturnKind.returnItem),
                  ),
                  const SizedBox(width: HooSpacing.xs),
                  OptionChip(
                    label: l.ordersReturnKindExchange,
                    uppercase: false,
                    selected: form.kind == ReturnKind.exchange,
                    onTap: () => cubit.setKind(ReturnKind.exchange),
                  ),
                ],
              ),
              const SizedBox(height: HooSpacing.md),
              Text(l.ordersReturnPick, style: t.h3),
              const SizedBox(height: HooSpacing.sm),
              for (final line in form.lines) ...[
                SelectableCard(
                  selected: form.isSelected(line.id),
                  onTap: () => cubit.toggleLine(line.id),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 48,
                            height: 60,
                            child: HooNetworkImage(url: line.previewUrl, borderRadius: HooRadius.cardAll, cacheWidth: 140),
                          ),
                          const SizedBox(width: HooSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(line.name, style: t.bodyStrong, maxLines: 2, overflow: TextOverflow.ellipsis),
                                Text([?line.color, if (line.size != null) line.size!.label].join(' · '), style: t.caption.copyWith(color: c.textSecondary)),
                              ],
                            ),
                          ),
                          if (form.isSelected(line.id) && line.quantity > 1)
                            QuantityStepper(value: form.quantityOf(line.id), min: 1, max: line.quantity, onChanged: (q) => cubit.setQuantity(line.id, q)),
                        ],
                      ),
                      if (form.kind == ReturnKind.exchange && form.isSelected(line.id)) ...[
                        const SizedBox(height: HooSpacing.sm),
                        Text(l.ordersReturnNewSize, style: t.caption),
                        const SizedBox(height: HooSpacing.xxs),
                        Wrap(
                          spacing: HooSpacing.xs,
                          children: [
                            for (final s in Size.customerSizes)
                              OptionChip(
                                label: s.label,
                                minWidth: 44,
                                selected: form.exchangeSizes[line.id] == s,
                                onTap: () => cubit.setExchangeSize(line.id, s),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: HooSpacing.sm),
              ],
              for (final i in issues)
                Padding(
                  padding: const EdgeInsets.only(bottom: HooSpacing.xs),
                  child: Text(_issue(l, i), style: t.caption.copyWith(color: c.error)),
                ),
              const SizedBox(height: HooSpacing.md),
              HooTextField(
                controller: _reason,
                label: '${l.ordersReturnReason} (${l.commonOptional.toLowerCase()})',
                minLines: 3,
                maxLines: 5,
                maxLength: ReturnForm.reasonMaxLength,
                onChanged: cubit.setReason,
              ),
              if (form.needsPhone) ...[
                const SizedBox(height: HooSpacing.md),
                HooPhoneField(controller: _phone, label: l.checkoutPhone, onChanged: cubit.setPhone),
              ],
              const SizedBox(height: HooSpacing.lg),
              PrimaryButton(label: l.ordersReturnSubmit, loading: state.submitting, onPressed: state.submitting ? null : cubit.submit),
            ],
          );
        }
        return Scaffold(
          backgroundColor: c.background,
          appBar: HooAppBar(title: l.ordersRequestReturn),
          body: SafeArea(child: HooConstrained(child: body)),
        );
      },
    );
  }
}
