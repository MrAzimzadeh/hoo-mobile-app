import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../l10n/l10n.dart';
import '../../shared/application/contracts.dart';
import '../../shared/design_system/design_system.dart';
import '../router/app_router.dart';

/// Main shell: five tabs with nested navigation (each tab keeps its own state). Studio sits in the middle and is
/// highlighted; the Bag tab shows the server bag count.
@RoutePage()
class MainShellPage extends StatelessWidget {
  const MainShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bag = GetIt.I<BagService>();
    final l = context.l10n;
    final tablet = context.hoo.isTablet;
    return AutoTabsRouter(
      routes: const [HomeRoute(), ShopRoute(), StudioHomeRoute(), BagRoute(), ProfileRoute()],
      transitionBuilder: (context, child, animation) => FadeTransition(opacity: CurvedAnimation(parent: animation, curve: HooCurves.standard), child: child),
      duration: HooDurations.normal,
      builder: (context, child) {
        final tabs = AutoTabsRouter.of(context);
        return StreamBuilder<int>(
          stream: bag.count,
          initialData: bag.currentCount,
          builder: (context, snap) {
            final count = snap.data ?? 0;
            final items = [
              HooNavItem(icon: HooIcons.home, label: l.navHome),
              HooNavItem(icon: HooIcons.shop, label: l.navShop),
              HooNavItem(icon: HooIcons.studio, label: l.navStudio, highlighted: true),
              HooNavItem(icon: HooIcons.bag, label: l.navBag, badge: count, semanticLabel: l.a11yBag(count)),
              HooNavItem(icon: HooIcons.profile, label: l.navProfile),
            ];
            void onTap(int i) {
              if (i == tabs.activeIndex) {
                // re-tapping the active tab pops it to its root
                tabs.stackRouterOfIndex(i)?.popUntilRoot();
              } else {
                tabs.setActiveIndex(i);
              }
            }

            if (tablet) {
              return Scaffold(
                body: Row(
                  children: [
                    _SideRail(items: items, index: tabs.activeIndex, onTap: onTap),
                    VerticalDivider(width: 1, color: context.hoo.colors.border),
                    Expanded(child: child),
                  ],
                ),
              );
            }
            return Scaffold(
              body: child,
              bottomNavigationBar: HooBottomNav(items: items, currentIndex: tabs.activeIndex, onTap: onTap),
            );
          },
        );
      },
    );
  }
}

/// Tablet navigation rail (same items as the bottom nav).
class _SideRail extends StatelessWidget {
  const _SideRail({required this.items, required this.index, required this.onTap});

  final List<HooNavItem> items;
  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return SafeArea(
      child: SizedBox(
        width: 96,
        child: Column(
          children: [
            const SizedBox(height: HooSpacing.lg),
            const HooLogo(size: 22),
            const SizedBox(height: HooSpacing.xl),
            for (var i = 0; i < items.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: HooSpacing.xs),
                child: HooPressable(
                  onTap: () => onTap(i),
                  semanticLabel: items[i].semanticLabel ?? items[i].label,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: HooSpacing.md, vertical: HooSpacing.xs),
                        decoration: BoxDecoration(
                          color: items[i].highlighted ? c.accent : (i == index ? c.accentTint : null),
                          borderRadius: HooRadius.pillAll,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Icon(items[i].icon, color: items[i].highlighted ? c.onAccent : (i == index ? c.textPrimary : c.textTertiary)),
                            if (items[i].badge > 0) Positioned(top: -6, right: -10, child: CountBadge(count: items[i].badge)),
                          ],
                        ),
                      ),
                      const SizedBox(height: HooSpacing.xxs),
                      Text(items[i].label, style: HooType.label.copyWith(fontSize: 10, color: i == index ? c.textPrimary : c.textTertiary)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
