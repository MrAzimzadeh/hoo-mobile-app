import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/widgets/product_rail.dart';
import '../../domain/wishlist_models.dart';
import '../../domain/wishlist_repository.dart';

/// Someone's shared wishlist (`/wishlist/shared/{token}`), read-only.
@RoutePage()
class SharedWishlistPage extends StatelessWidget {
  const SharedWishlistPage({super.key, @PathParam('token') required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider(
      create: (_) => LoadCubit<SharedWishlist>(() => sl<WishlistRepository>().shared(token))..load(),
      child: BlocBuilder<LoadCubit<SharedWishlist>, LoadState<SharedWishlist>>(
        builder: (context, s) {
          final data = s.data;
          return Scaffold(
            appBar: HooAppBar(title: data == null || data.ownerFirstName.isEmpty ? l.wishlistTitle : l.wishlistSharedTitle(data.ownerFirstName)),
            body: data == null
                ? (s.error != null ? HooErrorState(error: s.error!, onRetry: context.read<LoadCubit<SharedWishlist>>().load) : const HooLoading())
                : data.items.isEmpty
                    ? HooEmptyState(icon: HooIcons.heart, title: l.wishlistEmptyTitle)
                    : CustomScrollView(
                        slivers: [
                          const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.md)),
                          ProductSliverGrid(
                            products: data.items,
                            heroPrefix: 'shared-wishlist',
                            wishlist: sl<WishlistService>(),
                            onOpen: (p, prefix) => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: prefix)),
                          ),
                          const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.xl)),
                        ],
                      ),
          );
        },
      ),
    );
  }
}
