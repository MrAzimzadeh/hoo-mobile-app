import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../cubit/wishlist_cubits.dart';
import '../widgets/size_picker_sheet.dart';
import '../widgets/wishlist_grid.dart';

/// The signed-in customer's wishlist: remove (with undo), move to bag, share.
@RoutePage()
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<WishlistCubit>()..load(), child: const _WishlistView());
}

class _WishlistView extends StatelessWidget {
  const _WishlistView();

  Future<void> _share(BuildContext context) async {
    final cubit = context.read<WishlistCubit>();
    try {
      final share = await cubit.share();
      await SharePlus.instance.share(ShareParams(text: share.url));
    } on ApiException catch (e) {
      if (context.mounted) HooToast.error(context, e);
    }
  }

  Future<void> _remove(BuildContext context, ProductCard p) async {
    final cubit = context.read<WishlistCubit>();
    final l = context.l10n;
    final removed = await cubit.remove(p);
    if (removed == null || !context.mounted) return;
    HooToast.show(context, l.wishlistRemoved, action: l.wishlistUndo, onAction: () => unawaited(cubit.undoRemove(removed)));
  }

  Future<void> _moveToBag(BuildContext context, ProductCard p) async {
    final cubit = context.read<WishlistCubit>();
    final l = context.l10n;
    final bag = sl<BagService>();
    final variantId = await showSizePicker(context, load: () => cubit.picker(p.slug));
    if (variantId == null || !context.mounted) return;
    try {
      await cubit.moveToBag(p, variantId);
      if (context.mounted) await bag.showAddedSheet(context);
    } on ApiException catch (e) {
      if (context.mounted) HooToast.show(context, errorMessage(context, e), kind: HooAlertKind.error);
    }
    if (context.mounted) HooToast.success(context, l.wishlistMovedToBag);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: context.hoo.colors.background,
      appBar: HooAppBar(
        title: l.wishlistTitle,
        actions: [
          BlocBuilder<WishlistCubit, WishlistState>(
            builder: (context, state) => state.items.isEmpty
                ? const SizedBox.shrink()
                : HooIconButton(icon: HooIcons.share, semanticLabel: l.commonShare, onPressed: () => _share(context)),
          ),
        ],
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          final cubit = context.read<WishlistCubit>();
          return switch (state.status) {
            ListStatus.loading => const Center(child: HooLoading()),
            ListStatus.failure => HooErrorState(error: state.error!, onRetry: cubit.load),
            ListStatus.success when state.items.isEmpty => HooEmptyState(
              title: l.wishlistEmptyTitle,
              message: l.wishlistEmptyMessage,
              icon: HooIcons.heart,
              actionLabel: l.wishlistEmptyCta,
              onAction: () => context.router.navigate(const ShopRoute()),
            ),
            ListStatus.success => RefreshIndicator(
              onRefresh: cubit.load,
              child: HooConstrained(
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.md)),
                    WishlistGrid(
                      items: state.items,
                      heroPrefix: 'wishlist',
                      footerHeight: 56,
                      onHeart: (p) => _remove(context, p),
                      footer: (context, p) => Padding(
                        padding: const EdgeInsets.only(top: HooSpacing.xs),
                        child: SecondaryButton(
                          label: p.inStock ? l.wishlistMoveToBag : l.wishlistSoldOut,
                          onPressed: p.inStock ? () => _moveToBag(context, p) : null,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.xl)),
                  ],
                ),
              ),
            ),
          };
        },
      ),
    );
  }
}
