import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../application/wishlist_store.dart';
import '../../domain/wishlist_repository.dart';

/// Saved products. Choosing a size happens on the product page ("Add to bag" opens it).
@RoutePage()
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = sl<WishlistRepository>();
    return BlocProvider(
      create: (_) => LoadCubit<List<ProductCard>>(repo.wishlist)..load(),
      child: const _WishlistView(),
    );
  }
}

class _WishlistView extends StatelessWidget {
  const _WishlistView();

  Future<void> _share(BuildContext context) async {
    try {
      final url = await sl<WishlistRepository>().share();
      await SharePlus.instance.share(ShareParams(uri: Uri.parse(url), subject: context.mounted ? context.l10n.wishlistShareSubject : null));
    } catch (e) {
      if (context.mounted) HooToast.error(context, e);
    }
  }

  Future<void> _remove(BuildContext context, ProductCard p) async {
    final cubit = context.read<LoadCubit<List<ProductCard>>>();
    final before = cubit.state.data ?? const [];
    cubit.replace(before.where((x) => x.id != p.id).toList());
    try {
      await sl<WishlistRepository>().remove(p.id);
      sl<WishlistStore>().forget(p.id);
    } catch (e) {
      cubit.replace(before);
      if (context.mounted) HooToast.error(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<LoadCubit<List<ProductCard>>, LoadState<List<ProductCard>>>(
      builder: (context, s) {
        final items = s.data;
        return Scaffold(
          appBar: HooAppBar(
            title: l.wishlistTitle,
            actions: [if (items != null && items.isNotEmpty) HooIconButton(icon: HooIcons.share, semanticLabel: l.commonShare, onPressed: () => _share(context))],
          ),
          body: () {
            if (items == null) {
              if (s.error != null) return HooErrorState(error: s.error!, onRetry: context.read<LoadCubit<List<ProductCard>>>().load);
              return const _GridSkeleton();
            }
            if (items.isEmpty) {
              return HooEmptyState(
                icon: HooIcons.heart,
                title: l.wishlistEmptyTitle,
                message: l.wishlistEmptyBody,
                actionLabel: l.cartEmptyAction,
                onAction: () => context.router.navigate(const MainShellRoute(children: [ShopRoute()])),
              );
            }
            return RefreshIndicator(
              onRefresh: context.read<LoadCubit<List<ProductCard>>>().refresh,
              child: GridView.builder(
                padding: const EdgeInsets.all(HooSpacing.screen),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: productGridColumns(context),
                  crossAxisSpacing: HooSpacing.md,
                  mainAxisSpacing: HooSpacing.lg,
                  childAspectRatio: 0.44,
                ),
                itemCount: items.length,
                itemBuilder: (context, i) {
                  final p = items[i];
                  return HooReveal(
                    index: i % 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ProductCardTile(
                          product: p,
                          heroTagPrefix: 'wishlist',
                          isWishlisted: true,
                          onWishlistTap: () => _remove(context, p),
                          onTap: () => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: 'wishlist')),
                        ),
                        const SizedBox(height: HooSpacing.xs),
                        SecondaryButton(
                          label: p.inStock ? l.wishlistChooseSize : l.wishlistNotifyMe,
                          onPressed: () => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: 'wishlist-btn')),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }(),
        );
      },
    );
  }
}

class _GridSkeleton extends StatelessWidget {
  const _GridSkeleton();

  @override
  Widget build(BuildContext context) => GridView.count(
        padding: const EdgeInsets.all(HooSpacing.screen),
        crossAxisCount: productGridColumns(context),
        crossAxisSpacing: HooSpacing.md,
        mainAxisSpacing: HooSpacing.lg,
        childAspectRatio: 0.52,
        children: List.generate(4, (_) => const ProductCardSkeleton()),
      );
}

