import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/profile_models.dart';
import '../../domain/profile_repositories.dart';

/// Body measurements, usual size, fit, favourite colours (≤3) and styles — used for size recommendations,
/// pre-selection on the PDP and in the Studio, and sorting. Every field is optional.
@RoutePage()
class StyleProfilePage extends StatefulWidget {
  const StyleProfilePage({super.key, this.onboarding = false});

  /// Shown right after sign-up (skippable).
  final bool onboarding;

  @override
  State<StyleProfilePage> createState() => _StyleProfilePageState();
}

class _StyleProfilePageState extends State<StyleProfilePage> {
  StyleProfile _p = const StyleProfile();
  bool _loading = true;
  bool _saving = false;
  ApiException? _error;

  @override
  void initState() {
    super.initState();
    sl<StyleProfileRepository>().load().then((p) {
      if (mounted) setState(() => _p = p ?? const StyleProfile());
    }).catchError((Object _) {}).whenComplete(() {
      if (mounted) setState(() => _loading = false);
    });
  }

  void _done() {
    if (widget.onboarding) {
      context.router.replaceAll([const MainShellRoute()]);
    } else {
      context.router.maybePop();
    }
  }

  Future<void> _save() async {
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await sl<StyleProfileRepository>().save(_p);
      await sl<AuthGate>().refreshUser();
      if (!mounted) return;
      HooToast.success(context, context.l10n.commonSaved);
      _done();
    } on ApiException catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Widget _measure(String label, int? value, ({int min, int max}) range, int fallback, String unit, ValueChanged<int?> onChanged) {
    final v = value;
    return Padding(
      padding: const EdgeInsets.only(bottom: HooSpacing.sm),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(label, style: context.hoo.text.body)),
          Text(v == null ? '—' : '$v $unit', style: context.hoo.text.bodyStrong),
          if (v != null) HooIconButton(icon: HooIcons.close, size: 16, semanticLabel: context.l10n.commonClear, onPressed: () => onChanged(null)),
        ]),
        Slider(
          min: range.min.toDouble(),
          max: range.max.toDouble(),
          divisions: range.max - range.min,
          value: (v ?? fallback).toDouble(),
          onChanged: (x) => onChanged(x.round()),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    Widget label(String t) => Padding(padding: const EdgeInsets.only(top: HooSpacing.lg, bottom: HooSpacing.xs), child: Text(t.toUpperCase(), style: context.hoo.text.labelSecondary));
    return Scaffold(
      appBar: HooAppBar(
        title: l.profileStyleProfile,
        showBack: !widget.onboarding,
        actions: [if (widget.onboarding) HooTextButton(label: l.launchSkip, onPressed: _done)],
      ),
      body: _loading
          ? const HooLoading()
          : ListView(
              padding: const EdgeInsets.all(HooSpacing.screen),
              children: [
                Text(l.profileStyleIntro, style: context.hoo.text.bodySecondary),
                label(l.profileMeasurements),
                _measure(l.profileHeight, _p.heightCm, StyleProfile.heightRange, 175, 'cm', (v) => setState(() => _p = _p.copyWith(heightCm: v))),
                _measure(l.profileWeight, _p.weightKg, StyleProfile.weightRange, 70, 'kg', (v) => setState(() => _p = _p.copyWith(weightKg: v))),
                _measure(l.catalogChestCol, _p.chestCm, StyleProfile.chestRange, 96, 'cm', (v) => setState(() => _p = _p.copyWith(chestCm: v))),
                _measure(l.profileWaist, _p.waistCm, StyleProfile.waistRange, 82, 'cm', (v) => setState(() => _p = _p.copyWith(waistCm: v))),
                label(l.profileUsualSize),
                Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
                  for (final s in Size.customerSizes) OptionChip(label: s.label, selected: _p.usualSize == s, onTap: () => setState(() => _p = _p.copyWith(usualSize: _p.usualSize == s ? null : s))),
                ]),
                label(l.profilePreferredFit),
                Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
                  for (final f in Fit.values.where((f) => f != Fit.unknown))
                    OptionChip(label: f.label(l), uppercase: false, style: OptionChipStyle.tint, selected: _p.preferredFit == f, onTap: () => setState(() => _p = _p.copyWith(preferredFit: _p.preferredFit == f ? null : f))),
                ]),
                label(l.profileFavoriteColors),
                Wrap(children: [
                  for (final c in ColorFamily.values.where((c) => c != ColorFamily.unknown))
                    HooColorSwatch(
                      hex: '#${c.swatch.toRadixString(16).substring(2)}',
                      name: c.label(l),
                      selected: _p.favoriteColors.contains(c),
                      available: _p.favoriteColors.contains(c) || _p.favoriteColors.length < StyleProfile.maxFavoriteColors,
                      onTap: () => setState(() {
                        final list = [..._p.favoriteColors];
                        if (list.contains(c)) {
                          list.remove(c);
                        } else if (list.length < StyleProfile.maxFavoriteColors) {
                          list.add(c);
                        }
                        _p = _p.copyWith(favoriteColors: list);
                      }),
                    ),
                ]),
                Text(l.profileUpToThree, style: context.hoo.text.caption),
                label(l.profileStyles),
                Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
                  for (final t in StyleTag.values.where((t) => t != StyleTag.unknown))
                    OptionChip(
                      label: t.label(l),
                      uppercase: false,
                      style: OptionChipStyle.tint,
                      selected: _p.styles.contains(t),
                      onTap: () => setState(() => _p = _p.copyWith(styles: _p.styles.contains(t) ? (_p.styles.where((x) => x != t).toList()) : [..._p.styles, t])),
                    ),
                ]),
                if (_error != null) ...[const SizedBox(height: HooSpacing.md), InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, _error!))],
                const SizedBox(height: HooSpacing.xl),
                PrimaryButton(label: l.commonSave, loading: _saving, onPressed: _save),
              ],
            ),
    );
  }
}
