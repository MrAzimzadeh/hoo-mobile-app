import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../cubit/wishlist_cubits.dart';
import '../widgets/wishlist_grid.dart';

/// A wishlist shared by link (`/wishlist/shared/:token`). Public: no sign-in needed to look.
@RoutePage()
class SharedWishlistPage extends StatelessWidget {
  const SharedWishlistPage({super.key, @PathParam('token') required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider(
      create: (_) => sl<SharedWishlistCubit>(param1: token)..load(),
      child: BlocBuilder<SharedWishlistCubit, SharedWishlistState>(
        builder: (context, state) {
          final owner = state.list?.ownerFirstName ?? '';
          return Scaffold(
            backgroundColor: context.hoo.colors.background,
            appBar: HooAppBar(title: owner.isEmpty ? l.wishlistTitle : l.wishlistSharedTitle(owner)),
            body: switch (state.status) {
              ListStatus.loading => const Center(child: HooLoading()),
              ListStatus.failure => HooErrorState(error: state.error!, onRetry: context.read<SharedWishlistCubit>().load),
              ListStatus.success when state.list!.items.isEmpty => HooEmptyState(
                title: l.wishlistSharedEmpty,
                icon: HooIcons.heart,
                actionLabel: l.wishlistEmptyCta,
                onAction: () => context.router.navigate(const ShopRoute()),
              ),
              ListStatus.success => HooConstrained(
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.md)),
                    WishlistGrid(items: state.list!.items, heroPrefix: 'shared'),
                    const SliverToBoxAdapter(child: SizedBox(height: HooSpacing.xl)),
                  ],
                ),
              ),
            },
          );
        },
      ),
    );
  }
}
