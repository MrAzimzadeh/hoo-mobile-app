import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../cubit/list_section_cubit.dart';
import '../cubit/style_profile_cubit.dart';
import '../widgets/profile_widgets.dart';

/// Optional measurements and taste: used to pre-select sizes (PDP, Studio) and rank products. Skippable.
@RoutePage()
class StyleProfilePage extends StatelessWidget {
  const StyleProfilePage({super.key, this.onboarding = false});

  final bool onboarding;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<StyleProfileCubit>()..load(),
    child: _View(onboarding: onboarding),
  );
}

class _View extends StatefulWidget {
  const _View({required this.onboarding});
  final bool onboarding;

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  final _controllers = <Measurement, TextEditingController>{};
  bool _filled = false;

  TextEditingController _ctrl(Measurement m, int? value) => _controllers.putIfAbsent(m, () => TextEditingController(text: value?.toString() ?? ''));

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  String _label(AppLocalizations l, Measurement m) => switch (m) {
    Measurement.height => l.profileStyleHeight,
    Measurement.weight => l.profileStyleWeight,
    Measurement.chest => l.profileStyleChest,
    Measurement.waist => l.profileStyleWaist,
  };

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    return BlocConsumer<StyleProfileCubit, StyleProfileState>(
      listenWhen: (a, b) => (!a.saved && b.saved) || a.colorLimitHit != b.colorLimitHit,
      listener: (context, state) {
        if (state.saved) {
          HooToast.success(context, l.commonSaved);
          context.router.maybePop();
        } else {
          HooToast.show(context, l.profileStyleColorLimit(3), kind: HooAlertKind.warning);
        }
      },
      builder: (context, state) {
        final cubit = context.read<StyleProfileCubit>();
        Widget body;
        if (state.status == SectionStatus.loading) {
          body = const Center(child: HooLoading());
        } else if (state.status == SectionStatus.error) {
          body = HooErrorState(error: state.loadError!, onRetry: cubit.load);
        } else {
          if (!_filled) {
            _filled = true;
            for (final m in Measurement.values) {
              _ctrl(m, state.value(m));
            }
          }
          final p = state.profile;
          body = ListView(
            padding: const EdgeInsets.all(HooSpacing.screen),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Text(l.profileStyleIntro, style: t.body.copyWith(color: context.hoo.colors.textSecondary)),
              const SizedBox(height: HooSpacing.lg),
              if (state.saveError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: HooSpacing.md),
                  child: InlineAlert(message: errorMessage(context, state.saveError!), kind: HooAlertKind.error),
                ),
              Wrap(
                spacing: HooSpacing.md,
                runSpacing: HooSpacing.md,
                children: [
                  for (final m in Measurement.values)
                    SizedBox(
                      width: 150,
                      child: HooTextField(
                        controller: _ctrl(m, state.value(m)),
                        label: _label(l, m),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => cubit.setMeasurement(m, v),
                        errorText: state.rangeErrors.containsKey(m)
                            ? l.profileStyleRange(StyleProfileState.range(m).min, StyleProfileState.range(m).max)
                            : null,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: HooSpacing.lg),
              Text(l.profileStyleUsualSize, style: t.bodyStrong),
              const SizedBox(height: HooSpacing.xs),
              Wrap(
                spacing: HooSpacing.xs,
                runSpacing: HooSpacing.xs,
                children: [
                  for (final s in Size.customerSizes) OptionChip(label: s.label, minWidth: 48, selected: p.usualSize == s, onTap: () => cubit.setUsualSize(s)),
                ],
              ),
              const SizedBox(height: HooSpacing.lg),
              Text(l.profileStyleFit, style: t.bodyStrong),
              const SizedBox(height: HooSpacing.xs),
              Wrap(
                spacing: HooSpacing.xs,
                runSpacing: HooSpacing.xs,
                children: [
                  for (final f in Fit.values.where((f) => f != Fit.unknown))
                    OptionChip(label: f.label(l), uppercase: false, selected: p.preferredFit == f, onTap: () => cubit.setPreferredFit(f)),
                ],
              ),
              const SizedBox(height: HooSpacing.lg),
              Text(l.profileStyleColors, style: t.bodyStrong),
              const SizedBox(height: HooSpacing.xs),
              Wrap(
                spacing: HooSpacing.xs,
                runSpacing: HooSpacing.xs,
                children: [
                  for (final c in ColorFamily.values.where((c) => c != ColorFamily.unknown))
                    OptionChip(label: c.label(l), uppercase: false, selected: p.favoriteColors.contains(c), onTap: () => cubit.toggleColor(c)),
                ],
              ),
              const SizedBox(height: HooSpacing.lg),
              Text(l.profileStyleStyles, style: t.bodyStrong),
              const SizedBox(height: HooSpacing.xs),
              Wrap(
                spacing: HooSpacing.xs,
                runSpacing: HooSpacing.xs,
                children: [
                  for (final s in StyleTag.values.where((s) => s != StyleTag.unknown))
                    OptionChip(label: s.label(l), uppercase: false, selected: p.styles.contains(s), onTap: () => cubit.toggleStyle(s)),
                ],
              ),
            ],
          );
        }
        return Scaffold(
          backgroundColor: context.hoo.colors.background,
          appBar: HooAppBar(
            title: l.profileStyleProfile,
            showBack: !widget.onboarding,
            actions: [if (widget.onboarding) TextButton(onPressed: () => context.router.maybePop(), child: Text(l.profileStyleSkip))],
          ),
          body: HooConstrained(child: body),
          bottomNavigationBar: state.status == SectionStatus.ready
              ? ProfileBottomAction(
                  child: PrimaryButton(label: l.commonSave, loading: state.saving, onPressed: state.canSave && state.dirty ? cubit.save : null),
                )
              : null,
        );
      },
    );
  }
}
