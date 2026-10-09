import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../data/studio_repository.dart';
import '../../domain/models/design.dart';

/// Saved Studio designs: status, last edit; edit, duplicate, share, delete, resubmit after "Changes requested".
@RoutePage()
class MyDesignsPage extends StatelessWidget {
  const MyDesignsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final repo = sl<StudioRepository>();
    return BlocProvider(
      create: (_) => LoadCubit<List<DesignListItem>>(repo.designs)..load(),
      child: BlocBuilder<LoadCubit<List<DesignListItem>>, LoadState<List<DesignListItem>>>(
        builder: (context, s) {
          final cubit = context.read<LoadCubit<List<DesignListItem>>>();
          final items = s.data;
          return Scaffold(
            appBar: HooAppBar(title: l.profileMyDesigns, actions: [HooIconButton(icon: HooIcons.plus, semanticLabel: l.studioStart, onPressed: () => context.router.push(StudioRoute()))]),
            body: items == null
                ? (s.error != null ? HooErrorState(error: s.error!, onRetry: cubit.load) : const HooLoading())
                : items.isEmpty
                    ? HooEmptyState(icon: HooIcons.studio, title: l.studioNoDesigns, message: l.studioNoDesignsBody, actionLabel: l.studioStart, onAction: () => context.router.push(StudioRoute()))
                    : RefreshIndicator(
                        onRefresh: cubit.refresh,
                        child: GridView.builder(
                          padding: const EdgeInsets.all(HooSpacing.screen),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: productGridColumns(context), crossAxisSpacing: HooSpacing.md, mainAxisSpacing: HooSpacing.lg, childAspectRatio: 0.56),
                          itemCount: items.length,
                          itemBuilder: (context, i) => HooReveal(index: i % 4, child: _DesignTile(item: items[i], onChanged: cubit.refresh)),
                        ),
                      ),
          );
        },
      ),
    );
  }
}

class _DesignTile extends StatelessWidget {
  const _DesignTile({required this.item, required this.onChanged});
  final DesignListItem item;
  final Future<void> Function() onChanged;

  Future<void> _menu(BuildContext context) async {
    final l = context.l10n;
    final repo = sl<StudioRepository>();
    final action = await showHooSheet<String>(
      context,
      title: item.name.isEmpty ? l.studioUntitled : item.name,
      builder: (ctx) => Column(mainAxisSize: MainAxisSize.min, children: [
        if (item.editable) HooListTile(icon: HooIcons.edit, title: l.commonEdit, onTap: () => Navigator.of(ctx).pop('edit')),
        if (item.status == DesignStatus.changesRequested) HooListTile(icon: HooIcons.refresh, title: l.studioResubmit, onTap: () => Navigator.of(ctx).pop('resubmit')),
        HooListTile(icon: HooIcons.copy, title: l.studioDuplicate, onTap: () => Navigator.of(ctx).pop('duplicate')),
        HooListTile(icon: HooIcons.share, title: l.commonShare, onTap: () => Navigator.of(ctx).pop('share')),
        HooListTile(icon: HooIcons.trash, title: l.commonDelete, destructive: true, onTap: () => Navigator.of(ctx).pop('delete')),
      ]),
    );
    if (action == null || !context.mounted) return;
    try {
      switch (action) {
        case 'edit':
          await context.router.push(StudioRoute(designId: item.id));
        case 'resubmit':
          await repo.resubmit(item.id);
          if (context.mounted) HooToast.success(context, l.studioResubmitted);
        case 'duplicate':
          await repo.duplicate(item.id);
        case 'share':
          final url = await repo.share(item.id);
          await SharePlus.instance.share(ShareParams(uri: Uri.parse(url)));
        case 'delete':
          if (!await showHooConfirm(context, title: l.studioDeleteConfirm, confirmLabel: l.commonDelete, destructive: true)) return;
          await repo.delete(item.id);
      }
      await onChanged();
    } catch (e) {
      if (context.mounted) HooToast.error(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.hoo.colors;
    return HooPressable(
      onTap: () => item.editable ? context.router.push(StudioRoute(designId: item.id)) : _menu(context),
      onLongPress: () => _menu(context),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AspectRatio(
          aspectRatio: HooSize.productImageAspect,
          child: Stack(fit: StackFit.expand, children: [
            HooNetworkImage(url: item.mockupUrl, borderRadius: HooRadius.cardAll, cacheWidth: 320),
            Positioned(right: 0, top: 0, child: HooIconButton(icon: HooIcons.filter, semanticLabel: l.commonEdit, onPressed: () => _menu(context))),
          ]),
        ),
        const SizedBox(height: HooSpacing.xs),
        Text(item.name.isEmpty ? l.studioUntitled : item.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.hoo.text.bodyStrong),
        Container(
          margin: const EdgeInsets.only(top: HooSpacing.xxs),
          padding: const EdgeInsets.symmetric(horizontal: HooSpacing.xs, vertical: 2),
          decoration: BoxDecoration(color: item.status == DesignStatus.changesRequested ? c.error.withValues(alpha: 0.1) : c.accentTint, borderRadius: HooRadius.pillAll),
          child: Text(item.status.label(l).toUpperCase(), style: HooType.label.copyWith(fontSize: 10, color: item.status == DesignStatus.changesRequested ? c.error : c.accent)),
        ),
        if (item.updatedAt != null) Text(HooFormat.relative(context, item.updatedAt!), style: context.hoo.text.caption),
        if (item.total != null) Text(HooFormat.money(context, item.total!), style: context.hoo.text.captionPrimary),
      ]),
    );
  }
}
