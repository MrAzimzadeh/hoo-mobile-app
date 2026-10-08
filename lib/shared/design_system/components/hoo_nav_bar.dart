import 'package:flutter/material.dart';

import '../motion/hoo_motion.dart';
import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';
import 'hoo_buttons.dart';

class HooNavItem {
  const HooNavItem({required this.icon, required this.label, this.badge = 0, this.highlighted = false, this.semanticLabel});

  final IconData icon;
  final String label;
  final int badge;

  /// The centered Studio tab: drawn as a filled green pill.
  final bool highlighted;
  final String? semanticLabel;
}

/// 5-tab bottom navigation: white background, 1px top border, active icon+label in black with a small green
/// dot; the Studio tab is centered and highlighted; Bag shows a count badge.
class HooBottomNav extends StatelessWidget {
  const HooBottomNav({super.key, required this.items, required this.currentIndex, required this.onTap});

  final List<HooNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Container(
      decoration: BoxDecoration(color: c.background, border: Border(top: BorderSide(color: c.border))),
      padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      child: SizedBox(
        height: HooSize.bottomBar,
        child: Row(
          children: [
            for (var i = 0; i < items.length; i++)
              Expanded(child: _NavButton(item: items[i], active: i == currentIndex, onTap: () => onTap(i))),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.item, required this.active, required this.onTap});

  final HooNavItem item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final fg = active ? c.textPrimary : c.textTertiary;
    final Widget icon = item.highlighted
        ? AnimatedContainer(
            duration: context.hoo.motion(HooDurations.normal),
            curve: HooCurves.standard,
            padding: const EdgeInsets.symmetric(horizontal: HooSpacing.md, vertical: 6),
            decoration: BoxDecoration(color: c.accent, borderRadius: HooRadius.pillAll),
            child: Icon(item.icon, size: 22, color: c.onAccent),
          )
        : Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(item.icon, size: HooSize.icon, color: fg),
              if (item.badge > 0) Positioned(top: -4, right: -10, child: CountBadge(count: item.badge)),
            ],
          );
    return Semantics(
      button: true,
      selected: active,
      label: item.semanticLabel ?? item.label,
      excludeSemantics: true,
      child: HooPressable(
        onTap: () {
          if (!active) HooHaptics.selection();
          onTap();
        },
        scale: 0.94,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 4),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaler: MediaQuery.textScalerOf(context).clamp(maxScaleFactor: 1.1),
              style: HooType.label.copyWith(fontSize: 10, letterSpacing: 0.3, color: item.highlighted ? c.accent : fg),
            ),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: context.hoo.motion(HooDurations.normal),
              curve: HooCurves.standard,
              width: active && !item.highlighted ? 4 : 0,
              height: 4,
              decoration: BoxDecoration(color: c.accent, shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
