import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../cubit/track_and_gift_cubits.dart';

/// Track an order as a guest: order number + the phone it was placed with.
@RoutePage()
class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key, @QueryParam('number') this.number});

  final String? number;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<TrackOrderCubit>(),
    child: _TrackView(number: number),
  );
}

class _TrackView extends StatefulWidget {
  const _TrackView({this.number});
  final String? number;

  @override
  State<_TrackView> createState() => _TrackViewState();
}

class _TrackViewState extends State<_TrackView> {
  late final _number = TextEditingController(text: widget.number);
  final _phone = TextEditingController();

  @override
  void dispose() {
    _number.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _submit() => context.read<TrackOrderCubit>().submit(number: _number.text, phoneInput: _phone.text);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocConsumer<TrackOrderCubit, TrackOrderState>(
      listener: (context, state) {
        final found = state.found;
        if (found != null) {
          context.read<TrackOrderCubit>().consumed();
          context.router.push(OrderDetailRoute(number: found.number, phone: found.phone));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.hoo.colors.background,
          appBar: HooAppBar(title: l.ordersTrackTitle),
          body: SafeArea(
            child: HooConstrained(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(HooSpacing.screen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(l.ordersTrackSubtitle, style: context.hoo.text.body.copyWith(color: context.hoo.colors.textSecondary)),
                    const SizedBox(height: HooSpacing.lg),
                    if (state.error != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: HooSpacing.md),
                        child: InlineAlert(message: errorMessage(context, state.error!), kind: HooAlertKind.error),
                      ),
                    HooTextField(
                      controller: _number,
                      label: l.ordersOrderNumber,
                      textCapitalization: TextCapitalization.characters,
                      textInputAction: TextInputAction.next,
                      errorText: state.numberMissing ? l.fieldRequired : null,
                    ),
                    const SizedBox(height: HooSpacing.md),
                    HooPhoneField(
                      controller: _phone,
                      label: l.checkoutPhone,
                      errorText: state.phoneInvalid ? l.fieldInvalidPhone : null,
                      onSubmitted: (_) => _submit(),
                    ),
                    const SizedBox(height: HooSpacing.lg),
                    PrimaryButton(label: l.ordersTrackCta, loading: state.submitting, onPressed: state.submitting ? null : _submit),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
