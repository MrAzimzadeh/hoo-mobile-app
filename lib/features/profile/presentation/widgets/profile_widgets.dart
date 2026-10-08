import 'package:flutter/material.dart';

import '../../../../shared/design_system/design_system.dart';

/// Uppercase group label above a block of list rows ("ACCOUNT", "SUPPORT").
class ProfileGroupLabel extends StatelessWidget {
  const ProfileGroupLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Semantics(
    header: true,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.lg, HooSpacing.screen, HooSpacing.xs),
      child: Text(text.toUpperCase(), style: context.hoo.text.labelSecondary),
    ),
  );
}

/// Skeleton rows for list sections while loading.
class ProfileListSkeleton extends StatelessWidget {
  const ProfileListSkeleton({super.key, this.rows = 3, this.rowHeight = 72});

  final int rows;
  final double rowHeight;

  @override
  Widget build(BuildContext context) => ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(HooSpacing.screen),
    itemCount: rows,
    separatorBuilder: (_, _) => const SizedBox(height: HooSpacing.sm),
    itemBuilder: (_, _) => HooSkeleton(height: rowHeight),
  );
}

/// Small pill tag ("Default", "This device").
class ProfileTag extends StatelessWidget {
  const ProfileTag(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: HooSpacing.xs, vertical: HooSpacing.xxs / 2),
      decoration: BoxDecoration(color: c.accentTint, borderRadius: HooRadius.pillAll),
      child: Text(text.toUpperCase(), style: context.hoo.text.label),
    );
  }
}

/// Sticky bottom action area (one primary button), respecting the safe area and keyboard.
class ProfileBottomAction extends StatelessWidget {
  const ProfileBottomAction({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.background,
        border: Border(
          top: BorderSide(color: c.border, width: HooSize.borderWidth),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.sm, HooSpacing.screen, HooSpacing.sm),
          child: HooConstrained(child: child),
        ),
      ),
    );
  }
}

/// Small spinner used inside rows while a row mutation is in flight.
class ProfileRowSpinner extends StatelessWidget {
  const ProfileRowSpinner({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.square(dimension: HooSize.iconSmall, child: CircularProgressIndicator(strokeWidth: 1.5));
}
