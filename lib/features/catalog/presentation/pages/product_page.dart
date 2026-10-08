import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/deeplinks/deep_link_service.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/catalog_models.dart';
import '../cubit/product_cubit.dart';
import '../widgets/product_gallery.dart';
import '../widgets/product_tiles.dart';
import '../widgets/size_guide_sheet.dart';

/// Product detail: gallery (+3D), color / size selection, recommended size, delivery promise, details, reviews,
/// alerts, recommendations, and the sticky add-to-bag bar.
@RoutePage()
class ProductPage extends StatelessWidget {
  const ProductPage({super.key, @PathParam('slug') required this.slug, this.preview, this.heroTagPrefix = 'product'});

  final String slug;
  final ProductCard? preview;
  final String heroTagPrefix;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductCubit>(param1: slug, param2: preview?.defaultColor?.id)..load(),
      child: _ProductView(slug: slug, preview: preview, heroTagPrefix: heroTagPrefix),
    );
  }
}

class _ProductView extends StatelessWidget {
  const _ProductView({required this.slug, required this.preview, required this.heroTagPrefix});

  final String slug;
  final ProductCard? preview;
  final String heroTagPrefix;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final p = state.product;
        return Scaffold(
          backgroundColor: c.background,
          appBar: HooAppBar(
            actions: [
              if (p != null) ...[
                HooIconButton(icon: HooIcons.share, semanticLabel: context.l10n.commonShare, onPressed: () => _share(context, p)),
                _HeartButton(productId: p.id),
              ],
            ],
          ),
          body: switch (state.status) {
            ProductStatus.failure => HooErrorState(error: state.error!, onRetry: context.read<ProductCubit>().load),
            _ =>
              p == null
                  ? _Loading(preview: preview, heroTag: ProductCardTile.heroTag(heroTagPrefix, slug))
                  : _Content(state: state, heroTag: ProductCardTile.heroTag(heroTagPrefix, slug)),
          },
          bottomNavigationBar: p == null || state.status == ProductStatus.failure ? null : _AddBar(state: state),
        );
      },
    );
  }

  void _share(BuildContext context, ProductDetail p) {
    final url = sl<DeepLinkService>().webUrl('/products/${p.slug}');
    SharePlus.instance.share(ShareParams(text: '${p.name}\n$url', subject: p.name));
  }
}

class _HeartButton extends StatelessWidget {
  const _HeartButton({required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return WishlistIdsBuilder(
      builder: (context, ids) {
        final on = ids.contains(productId);
        return HooIconButton(
          icon: on ? HooIcons.heartFilled : HooIcons.heart,
          color: on ? context.hoo.colors.accent : null,
          semanticLabel: on ? context.l10n.a11yRemoveFromWishlist : context.l10n.a11yAddToWishlist,
          onPressed: () => sl<WishlistService>().toggle(context, productId),
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({required this.preview, required this.heroTag});
  final ProductCard? preview;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: HooSize.productImageAspect,
            child: Hero(
              tag: heroTag,
              child: HooNetworkImage(url: preview?.imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(HooSpacing.screen),
            child: preview == null
                ? const HooSkeleton(width: 200, height: 28)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(preview!.name, style: context.hoo.text.h1),
                      const SizedBox(height: HooSpacing.xs),
                      PriceText(
                        price: preview!.price,
                        compareAtPrice: preview!.compareAtPrice,
                        discountPercent: preview!.discountPercent,
                        style: context.hoo.text.h3,
                      ),
                    ],
                  ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: HooSpacing.screen),
            child: HooSkeleton(height: 48),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.state, required this.heroTag});
  final ProductState state;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final p = state.product!;
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final cubit = context.read<ProductCubit>();
    final color = state.selectedColor;
    final recommended = p.recommendedSize;
    final selected = state.selectedVariant;
    final soldOutSizes = state.variants.where((v) => !v.purchasable).toList();
    return RefreshIndicator(
      onRefresh: cubit.load,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: HooConstrained(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OfflineBanner(visible: state.stale),
              ProductGallery(images: state.images, heroTag: heroTag, product: p, colorHex: color?.color.hex),
              Padding(
                padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.lg, HooSpacing.screen, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (p.badgeList.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: HooSpacing.xs),
                        child: Text(p.badgeList.map((b) => b.label(l)).join(' · ').toUpperCase(), style: t.label.copyWith(color: c.accent)),
                      ),
                    HooReveal(child: Text(p.name, style: t.h1)),
                    const SizedBox(height: HooSpacing.xs),
                    PriceText(price: p.price, compareAtPrice: p.compareAtPrice, discountPercent: p.discountPercent, style: t.h3),
                    if (p.rating != null && p.reviewCount > 0) ...[
                      const SizedBox(height: HooSpacing.sm),
                      InkWell(
                        onTap: () => context.router.push(ReviewsRoute(slug: p.slug, productName: p.name)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: HooSpacing.xxs),
                          child: Row(
                            children: [
                              RatingStars(rating: p.rating!, size: 16),
                              const SizedBox(width: HooSpacing.xs),
                              Text(l.catalogReviewsCount(p.reviewCount), style: t.caption.copyWith(color: c.textSecondary)),
                            ],
                          ),
                        ),
                      ),
                    ],
                    if (p.colors.length > 1 || color != null) ...[
                      const SizedBox(height: HooSpacing.lg),
                      Text('${l.catalogColor}: ${color?.color.name ?? ''}', style: t.bodyStrong),
                      const SizedBox(height: HooSpacing.sm),
                      Wrap(
                        spacing: HooSpacing.sm,
                        runSpacing: HooSpacing.sm,
                        children: [
                          for (final pc in p.colors)
                            HooColorSwatch(
                              hex: pc.color.hex,
                              name: pc.color.name,
                              selected: pc.color.id == color?.color.id,
                              available: pc.available,
                              onTap: () => cubit.selectColor(pc.color.id),
                            ),
                        ],
                      ),
                    ],
                    const SizedBox(height: HooSpacing.lg),
                    Row(
                      children: [
                        Expanded(child: Text(l.catalogSize, style: t.bodyStrong)),
                        if (p.sizeChart.isNotEmpty)
                          TextButton.icon(
                            onPressed: () => showSizeGuide(context, p.sizeChart),
                            icon: const Icon(HooIcons.ruler, size: HooSize.iconSmall),
                            label: Text(l.catalogSizeGuide),
                          ),
                      ],
                    ),
                    const SizedBox(height: HooSpacing.xs),
                    Wrap(
                      spacing: HooSpacing.sm,
                      runSpacing: HooSpacing.sm,
                      children: [
                        for (final v in state.variants)
                          OptionChip(
                            label: v.size.label,
                            selected: v.size == state.size,
                            unavailable: !v.purchasable,
                            onTap: () {
                              if (!cubit.selectSize(v.size)) HooToast.show(context, l.catalogSizeUnavailable, kind: HooAlertKind.warning);
                            },
                          ),
                      ],
                    ),
                    if (selected != null && selected.lowStockLeft != null && selected.inStock)
                      Padding(
                        padding: const EdgeInsets.only(top: HooSpacing.sm),
                        child: Text(l.catalogOnlyLeft(selected.lowStockLeft!, selected.size.label), style: t.caption.copyWith(color: c.error)),
                      ),
                    if (selected != null && selected.preorder && !selected.inStock)
                      Padding(
                        padding: const EdgeInsets.only(top: HooSpacing.sm),
                        child: Text(l.catalogPreorderNote, style: t.caption.copyWith(color: c.textSecondary)),
                      ),
                    if (recommended != null && recommended.size != Size.unknown)
                      Padding(
                        padding: const EdgeInsets.only(top: HooSpacing.sm),
                        child: Text(l.catalogRecommendedSize(recommended.size.label), style: t.caption.copyWith(color: c.accent)),
                      ),
                    if (state.colorSoldOut || (soldOutSizes.isNotEmpty && state.size == null)) ...[
                      const SizedBox(height: HooSpacing.md),
                      _AlertButtons(state: state),
                    ] else
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(onPressed: () => _alert(context, StockAlertType.priceDrop), child: Text(l.catalogPriceDropAlert)),
                      ),
                    if (p.deliveryPromise != null) ...[const SizedBox(height: HooSpacing.md), _DeliveryPromiseCard(promise: p.deliveryPromise!)],
                    if (p.availableInStudio) ...[
                      const SizedBox(height: HooSpacing.md),
                      SecondaryButton(
                        label: l.catalogCustomize,
                        icon: HooIcons.studio,
                        onPressed: () => context.router.push(StudioRoute(productSlug: p.slug)),
                      ),
                    ],
                    const SizedBox(height: HooSpacing.lg),
                    if (p.description.isNotEmpty)
                      HooAccordion(
                        title: l.catalogDescription,
                        initiallyExpanded: true,
                        child: Text(p.description, style: t.body),
                      ),
                    if (p.sizeAndFit != null && p.sizeAndFit!.isNotEmpty)
                      HooAccordion(
                        title: l.catalogSizeAndFit,
                        child: Text(p.sizeAndFit!, style: t.body),
                      ),
                    if (p.fabricAndCare != null && p.fabricAndCare!.isNotEmpty)
                      HooAccordion(
                        title: l.catalogFabricAndCare,
                        child: Text(p.fabricAndCare!, style: t.body),
                      ),
                    const SizedBox(height: HooSpacing.md),
                    Row(
                      children: [
                        Expanded(child: Text(l.catalogReviews, style: t.h3)),
                        TextButton(
                          onPressed: () => context.router.push(ReviewsRoute(slug: p.slug, productName: p.name)),
                          child: Text(l.commonSeeAll),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _Recommendations(recommendations: state.recommendations),
              const SizedBox(height: HooSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _alert(BuildContext context, StockAlertType type) async {
  final l = context.l10n;
  final cubit = context.read<ProductCubit>();
  final ok = await sl<AuthGate>().requireSignIn(context, reason: l.catalogAlertSignIn);
  if (!ok || !context.mounted) return;
  final error = await cubit.createAlert(type);
  if (!context.mounted) return;
  if (error == null) {
    HooToast.success(context, type == StockAlertType.priceDrop ? l.catalogPriceDropAlertSet : l.catalogBackInStockAlertSet);
  } else {
    HooToast.error(context, error);
  }
}

class _AlertButtons extends StatelessWidget {
  const _AlertButtons({required this.state});
  final ProductState state;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return InlineAlert(
      kind: HooAlertKind.warning,
      message: state.colorSoldOut ? l.catalogColorSoldOut : l.catalogSizeSoldOutHint,
      action: l.catalogNotifyMe,
      onAction: () => _alert(context, StockAlertType.backInStock),
    );
  }
}

class _DeliveryPromiseCard extends StatelessWidget {
  const _DeliveryPromiseCard({required this.promise});
  final DeliveryPromise promise;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final h = promise.orderWithinMinutes ~/ 60, m = promise.orderWithinMinutes % 60;
    return HooCard(
      child: Row(
        children: [
          Icon(HooIcons.truck, color: context.hoo.colors.accent),
          const SizedBox(width: HooSpacing.sm),
          Expanded(child: Text(l.catalogDeliveryPromise(h, m, HooFormat.weekdayDayMonth(context, promise.deliveryDate)), style: context.hoo.text.caption)),
        ],
      ),
    );
  }
}

class _Recommendations extends StatelessWidget {
  const _Recommendations({required this.recommendations});
  final Recommendations? recommendations;

  @override
  Widget build(BuildContext context) {
    final r = recommendations;
    if (r == null) return const SizedBox.shrink();
    final l = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (r.completeTheLook.isNotEmpty) ...[
          const SizedBox(height: HooSpacing.lg),
          SectionHeader(title: l.catalogCompleteTheLook),
          const SizedBox(height: HooSpacing.sm),
          ProductRail(items: r.completeTheLook, heroPrefix: 'pdp-look'),
        ],
        if (r.youMayAlsoLike.isNotEmpty) ...[
          const SizedBox(height: HooSpacing.lg),
          SectionHeader(title: l.catalogYouMayAlsoLike),
          const SizedBox(height: HooSpacing.sm),
          ProductRail(items: r.youMayAlsoLike, heroPrefix: 'pdp-like'),
        ],
      ],
    );
  }
}

class _AddBar extends StatelessWidget {
  const _AddBar({required this.state});
  final ProductState state;

  Future<void> _add(BuildContext context) async {
    final cubit = context.read<ProductCubit>();
    final bag = sl<BagService>();
    final error = await cubit.addToBag();
    if (!context.mounted) return;
    if (error == null) {
      unawaited(HooHaptics.light());
      await bag.showAddedSheet(context);
    } else {
      HooToast.show(context, errorMessage(context, error), kind: HooAlertKind.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final p = state.product!;
    final variant = state.selectedVariant;
    final label = state.colorSoldOut
        ? l.catalogSoldOut
        : state.size == null
        ? l.catalogSelectSize
        : (variant?.preorder ?? false) && !(variant?.inStock ?? true)
        ? l.catalogPreorder
        : l.catalogAddToBag;
    return Material(
      color: context.hoo.colors.background,
      child: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.sm, HooSpacing.screen, HooSpacing.sm),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: context.hoo.colors.border)),
          ),
          child: HooConstrained(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(HooFormat.money(context, variant?.price ?? p.price), style: context.hoo.text.h3)],
                  ),
                ),
                const SizedBox(width: HooSpacing.md),
                Expanded(
                  flex: 2,
                  child: PrimaryButton.accent(label: label, loading: state.adding, onPressed: state.canAddToBag ? () => _add(context) : null),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
