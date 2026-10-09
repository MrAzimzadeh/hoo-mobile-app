import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/storage/preferences.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../data/studio_repository.dart';
import '../../domain/models/design.dart';

/// Studio tab: editorial intro, how it works, start / continue, recent designs.
@RoutePage()
class StudioHomePage extends StatefulWidget {
  const StudioHomePage({super.key});

  @override
  State<StudioHomePage> createState() => _StudioHomePageState();
}

class _StudioHomePageState extends State<StudioHomePage> {
  List<DesignListItem> _recent = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final items = await sl<StudioRepository>().designs();
      if (mounted) setState(() => _recent = items.take(6).toList());
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final progress = sl<Preferences>().studioProgress;
    final draftId = progress?['designId'] as String?;
    final steps = [(l.studioHowPick, HooIcons.tShirt), (l.studioHowDesign, HooIcons.brush), (l.studioHowOrder, HooIcons.bag)];
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _load,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.58,
              child: Stack(fit: StackFit.expand, children: [
                const HooImageReveal(child: Image(image: AssetImage('assets/images/cat-design.jpg'), fit: BoxFit.cover)),
                ColoredBox(color: HooPalette.green.withValues(alpha: 0.55)),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(HooSpacing.screen),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const HooLogo(variant: HooLogoVariant.onGreen, size: 24),
                      const Spacer(),
                      Text(l.navStudio.toUpperCase(), style: HooType.label.copyWith(color: HooPalette.white.withValues(alpha: 0.8))),
                      const SizedBox(height: HooSpacing.xs),
                      HooTextReveal(child: Text(l.homeStudioTitle, style: HooType.hero.copyWith(color: HooPalette.white))),
                      const SizedBox(height: HooSpacing.sm),
                      HooReveal(index: 2, child: Text(l.studioIntro, style: HooType.body.copyWith(color: HooPalette.white.withValues(alpha: 0.85)))),
                      const SizedBox(height: HooSpacing.lg),
                      HooReveal(
                        index: 3,
                        child: Theme(
                          data: HooThemeData.dark(),
                          child: PrimaryButton(label: l.studioStart, onPressed: () => context.router.push(StudioRoute())),
                        ),
                      ),
                    ]),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(HooSpacing.screen),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                if (draftId != null) ...[
                  HooCard(
                    onTap: () => context.router.push(StudioRoute(designId: draftId)),
                    child: Row(children: [
                      const Icon(HooIcons.edit),
                      const SizedBox(width: HooSpacing.md),
                      Expanded(child: Text(l.studioContinueDraft, style: context.hoo.text.bodyStrong)),
                      const Icon(HooIcons.chevronRight, size: 18),
                    ]),
                  ),
                  const SizedBox(height: HooSpacing.section),
                ],
                Text(l.studioHowItWorks, style: context.hoo.text.h2),
                const SizedBox(height: HooSpacing.md),
                for (final (i, (text, icon)) in steps.indexed)
                  HooReveal(
                    index: i,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: HooSpacing.md),
                      child: Row(children: [
                        Text('0${i + 1}', style: context.hoo.text.labelSecondary),
                        const SizedBox(width: HooSpacing.md),
                        Icon(icon),
                        const SizedBox(width: HooSpacing.md),
                        Expanded(child: Text(text, style: context.hoo.text.body)),
                      ]),
                    ),
                  ),
                if (_recent.isNotEmpty) ...[
                  const SizedBox(height: HooSpacing.section),
                  SectionHeader(title: l.profileMyDesigns, padding: EdgeInsets.zero, onSeeAll: () => context.router.push(const MyDesignsRoute())),
                  const SizedBox(height: HooSpacing.md),
                  SizedBox(
                    height: 210,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _recent.length,
                      separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.md),
                      itemBuilder: (context, i) {
                        final d = _recent[i];
                        return HooPressable(
                          onTap: () => context.router.push(StudioRoute(designId: d.id)),
                          child: SizedBox(
                            width: 140,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              AspectRatio(aspectRatio: HooSize.productImageAspect, child: HooNetworkImage(url: d.mockupUrl, borderRadius: HooRadius.cardAll, cacheWidth: 140)),
                              const SizedBox(height: HooSpacing.xs),
                              Text(d.name.isEmpty ? l.studioUntitled : d.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.hoo.text.captionPrimary),
                              Text([d.status.label(l), if (d.updatedAt != null) HooFormat.relative(context, d.updatedAt!)].join(' · '), style: context.hoo.text.caption.copyWith(fontSize: 11)),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
