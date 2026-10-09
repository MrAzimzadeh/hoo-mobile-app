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
import '../../../../shared/widgets/product_rail.dart';
import '../../domain/catalog_models.dart';
import '../../domain/catalog_repositories.dart';
import '../pdp/pdp_widgets.dart';
import '../pdp/product_cubit.dart';

/// Product detail: gallery per color (+ optional 3D), price, swatches, sizes with stock, recommended size, size guide,
/// delivery promise, details, reviews, alerts, recommendations and a sticky "Add to bag".
@RoutePage()
class ProductPage extends StatelessWidget {
  const ProductPage({super.key, @PathParam('slug') required this.slug, this.preview, this.heroTagPrefix = 'product'});

  final String slug;

  /// Card data for an instant first frame while the detail loads.
  final ProductCard? preview;
  final String heroTagPrefix;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductCubit>()..load(slug),
      child: _ProductView(slug: slug, preview: preview, heroTag: ProductCardTile.heroTag(heroTagPrefix, slug)),
    );
  }
}

class _ProductView extends StatefulWidget {
  const _ProductView({required this.slug, required this.preview, required this.heroTag});

  final String slug;
  final ProductCard? preview;
  final String heroTag;

  @override
  State<_ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<_ProductView> {
  bool _show3d = false;

  WishlistService? get _wishlist => sl.isRegistered<WishlistService>() ? sl<WishlistService>() : null;

  Future<void> _addToBag() async {
    final cubit = context.read<ProductCubit>();
    final r = await cubit.addToBag();
    if (!mounted) return;
    if (r.added) {
      await sl<BagService>().showAddedSheet(context);
    } else if (r.error != null) {
      HooToast.error(context, r.error!);
    }
  }

  Future<void> _alert(StockAlertType type) async {
    final l = context.l10n;
    final s = context.read<ProductCubit>().state;
    final d = s.detail;
    if (d == null) return;
    if (!await sl<AuthGate>().requireSignIn(context, reason: l.catalogAlertSignIn)) return;
    try {
      await sl<ProductAlertRepository>().subscribe(productId: d.id, type: type, size: s.size, colorId: s.colorId);
      if (mounted) HooToast.success(context, type == StockAlertType.backInStock ? l.catalogNotifyDone : l.catalogPriceAlertDone);
    } catch (e) {
      if (mounted) HooToast.error(context, e);
    }
  }

  void _share(ProductDetail d) {
    final url = sl<DeepLinkService>().webUrl('/products/${d.slug}');
    SharePlus.instance.share(ShareParams(uri: Uri.parse(url), subject: d.name));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, s) {
        final d = s.detail;
        if (d == null && s.error != null) {
          return Scaffold(appBar: const HooAppBar(), body: HooErrorState(error: s.error!, onRetry: () => context.read<ProductCubit>().load(widget.slug)));
        }
        final images = s.color?.images ?? const <String>[];
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: HooAppBar(
            backgroundColor: Colors.transparent,
            actions: [
              if (d != null) HooIconButton(icon: HooIcons.share, semanticLabel: l.commonShare, onPressed: () => _share(d)),
              if (d != null && _wishlist != null)
                StreamBuilder<Set<String>>(
                  stream: _wishlist!.ids,
                  initialData: _wishlist!.currentIds,
                  builder: (context, ids) => WishlistHeart(active: ids.data?.contains(d.id) ?? false, onImage: false, onTap: () => _wishlist!.toggle(context, d.id)),
                ),
            ],
          ),
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              ProductGallery(
                images: _show3d ? const [] : images,
                heroTag: widget.heroTag,
                fallbackUrl: widget.preview?.imageUrl,
                overlay: _show3d && d?.model3D != null && sl.isRegistered<GarmentViewerFactory>()
                    ? sl<GarmentViewerFactory>().productModel(
                        modelUrl: d!.model3D!.modelUrl,
                        heightCm: d.model3D!.heightCm,
                        tintable: d.model3D!.tintable,
                        colorHex: s.color?.color.hex ?? '#121212',
                      )
                    : null,
              ),
              if (d?.model3D != null && sl.isRegistered<GarmentViewerFactory>())
                Padding(
                  padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.sm, HooSpacing.screen, 0),
                  child: Row(children: [
                    OptionChip(label: l.catalogPhotos, selected: !_show3d, onTap: () => setState(() => _show3d = false)),
                    const SizedBox(width: HooSpacing.xs),
                    OptionChip(label: l.catalog3dView, selected: _show3d, leading: Icon(HooIcons.cube, size: 14, color: _show3d ? context.hoo.colors.onPrimaryAction : context.hoo.colors.textPrimary), onTap: () => setState(() => _show3d = true)),
                  ]),
                ),
              Padding(
                padding: const EdgeInsets.all(HooSpacing.screen),
                child: d == null ? _PreviewInfo(preview: widget.preview) : _Info(state: s, onAlert: _alert),
              ),
              if (d != null) ...[
                if (s.recommendations?.completeTheLook.isNotEmpty ?? false) ...[
                  SectionHeader(title: l.cartCompleteTheLook),
                  const SizedBox(height: HooSpacing.md),
                  ProductRail(products: s.recommendations!.completeTheLook, heroPrefix: 'pdp-look-${d.slug}', wishlist: _wishlist, onOpen: _open),
                  const SizedBox(height: HooSpacing.section),
                ],
                if (s.recommendations?.youMayAlsoLike.isNotEmpty ?? false) ...[
                  SectionHeader(title: l.catalogYouMayAlsoLike),
                  const SizedBox(height: HooSpacing.md),
                  ProductRail(products: s.recommendations!.youMayAlsoLike, heroPrefix: 'pdp-like-${d.slug}', wishlist: _wishlist, onOpen: _open),
                ],
                const SizedBox(height: HooSpacing.xxl),
              ],
            ],
          ),
          bottomNavigationBar: d == null ? null : _AddToBagBar(state: s, onAdd: _addToBag, onNotify: () => _alert(StockAlertType.backInStock)),
        );
      },
    );
  }

  void _open(ProductCard p, String prefix) => context.router.push(ProductRoute(slug: p.slug, preview: p, heroTagPrefix: prefix));
}

class _PreviewInfo extends StatelessWidget {
  const _PreviewInfo({this.preview});
  final ProductCard? preview;

  @override
  Widget build(BuildContext context) {
    final p = preview;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (p != null) ...[
          Text(p.name, style: context.hoo.text.h1),
          const SizedBox(height: HooSpacing.xs),
          PriceText(price: p.price, compareAtPrice: p.compareAtPrice, discountPercent: p.discountPercent),
        ] else ...[
          const HooSkeleton(width: 220, height: 28),
          const SizedBox(height: HooSpacing.sm),
          const HooSkeleton(width: 80),
        ],
        const SizedBox(height: HooSpacing.xl),
        const HooSkeleton(height: 48),
        const SizedBox(height: HooSpacing.md),
        const HooSkeleton(height: 48),
      ],
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({required this.state, required this.onAlert});

  final ProductState state;
  final void Function(StockAlertType) onAlert;

  String? _deliveryLine(BuildContext context, DeliveryPromise p) {
    final l = context.l10n;
    final today = DateUtils.dateOnly(DateTime.now());
    final days = DateUtils.dateOnly(p.deliveryDate).difference(today).inDays;
    final when = days <= 0 ? l.catalogToday : days == 1 ? l.catalogTomorrow : HooFormat.weekdayDayMonth(context, p.deliveryDate);
    if (p.orderWithinMinutes <= 0) return l.catalogDeliveredOn(when);
    return l.catalogDeliveryPromise(p.orderWithinMinutes ~/ 60, p.orderWithinMinutes % 60, when);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.hoo.colors;
    final d = state.detail!;
    final cubit = context.read<ProductCubit>();
    final color = state.color;
    final variant = state.variant;
    final recommended = d.recommendedSize?.size;
    final sizes = color?.variants ?? const <ProductVariant>[];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.stale) const Padding(padding: EdgeInsets.only(bottom: HooSpacing.md), child: OfflineBanner()),
        if (d.badgeList.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: HooSpacing.sm),
            child: Wrap(spacing: HooSpacing.xs, children: [for (final b in d.badgeList) HooBadge.product(context, b)]),
          ),
        HooTextReveal(child: Text(d.name, style: context.hoo.text.h1)),
        const SizedBox(height: HooSpacing.xs),
        PriceText(
          price: state.price ?? d.price,
          compareAtPrice: d.compareAtPrice,
          discountPercent: d.discountPercent,
          style: context.hoo.text.h3,
        ),
        if (d.rating != null && d.reviewCount > 0)
          HooPressable(
            onTap: () => context.router.push(ReviewsRoute(slug: d.slug, productName: d.name)),
            child: Padding(
              padding: const EdgeInsets.only(top: HooSpacing.xs),
              child: Row(children: [
                RatingStars(rating: d.rating!, count: d.reviewCount),
                const SizedBox(width: HooSpacing.xs),
                Text(l.catalogReadReviews, style: context.hoo.text.caption.copyWith(decoration: TextDecoration.underline)),
              ]),
            ),
          ),
        const SizedBox(height: HooSpacing.lg),
        if (d.colors.length > 1 || color != null) ...[
          Text('${l.catalogColor.toUpperCase()} · ${color?.color.name ?? ''}', style: context.hoo.text.labelSecondary),
          const SizedBox(height: HooSpacing.xs),
          Wrap(children: [
            for (final pc in d.colors)
              HooColorSwatch(hex: pc.color.hex, name: pc.color.name, selected: pc.color.id == color?.color.id, available: pc.purchasable, onTap: () => cubit.selectColor(pc.color.id)),
          ]),
          const SizedBox(height: HooSpacing.md),
        ],
        Row(
          children: [
            Text(l.catalogSize.toUpperCase(), style: context.hoo.text.labelSecondary.copyWith(color: state.sizeError ? c.error : null)),
            const Spacer(),
            if (d.sizeChart.isNotEmpty)
              HooTextButton(label: l.catalogSizeGuide, style: HooType.caption.copyWith(fontWeight: FontWeight.w600), onPressed: () => showSizeGuide(context, d.sizeChart, sizeAndFit: d.sizeAndFit)),
          ],
        ),
        Wrap(
          spacing: HooSpacing.xs,
          runSpacing: HooSpacing.xs,
          children: [
            for (final v in sizes)
              OptionChip(
                label: v.size.label,
                selected: state.size == v.size,
                unavailable: !v.purchasable,
                trailing: v.preorder && !v.inStock ? l.catalogPreorderShort : null,
                onTap: () => cubit.selectSize(v.size),
              ),
          ],
        ),
        const SizedBox(height: HooSpacing.xs),
        if (state.sizeError) Text(l.catalogChooseSize, style: context.hoo.text.caption.copyWith(color: c.error)),
        if (recommended != null) Text(l.catalogRecommendedSize(recommended.label), style: context.hoo.text.caption.copyWith(color: c.accent)),
        if (variant?.lowStockLeft != null && variant!.inStock) Text(l.catalogOnlyLeftIn(variant.lowStockLeft!, variant.size.label), style: context.hoo.text.caption.copyWith(color: c.accent)),
        if (variant != null && !variant.inStock && variant.preorder) Text(l.stockStatePreorder, style: context.hoo.text.caption),
        if (d.deliveryPromise != null) ...[
          const SizedBox(height: HooSpacing.md),
          Row(children: [
            Icon(HooIcons.truck, size: 18, color: c.textPrimary),
            const SizedBox(width: HooSpacing.xs),
            Expanded(child: Text(_deliveryLine(context, d.deliveryPromise!) ?? '', style: context.hoo.text.captionPrimary)),
          ]),
        ],
        if (d.availableInStudio) ...[
          const SizedBox(height: HooSpacing.lg),
          SecondaryButton(label: l.catalogCustomizeThis, icon: HooIcons.studio, onPressed: () => context.router.push(StudioRoute(productSlug: d.slug))),
        ],
        const SizedBox(height: HooSpacing.lg),
        if (d.description.isNotEmpty) HooAccordion(title: l.catalogDescription, initiallyExpanded: true, child: Text(d.description, style: context.hoo.text.bodySecondary)),
        if (d.sizeAndFit?.isNotEmpty ?? false) HooAccordion(title: l.catalogSizeAndFit, child: Text(d.sizeAndFit!, style: context.hoo.text.bodySecondary)),
        if ((d.fabricAndCare?.isNotEmpty ?? false) || d.fabric != null)
          HooAccordion(title: l.catalogFabricAndCare, child: Text([?d.fabric, ?d.fabricAndCare].join('\n\n'), style: context.hoo.text.bodySecondary)),
        HooAccordion(
          title: l.catalogReviewsCount(d.reviewCount),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (d.rating != null) RatingStars(rating: d.rating!, size: 18),
              const SizedBox(height: HooSpacing.sm),
              Wrap(spacing: HooSpacing.sm, children: [
                if (d.reviewCount > 0) HooTextButton(label: l.catalogReadReviews, onPressed: () => context.router.push(ReviewsRoute(slug: d.slug, productName: d.name))),
                HooTextButton(label: l.catalogWriteReview, onPressed: () => context.router.push(WriteReviewRoute(slug: d.slug, productName: d.name))),
              ]),
            ],
          ),
        ),
        const SizedBox(height: HooSpacing.sm),
        HooTextButton(label: l.catalogPriceDropAlert, onPressed: () => onAlert(StockAlertType.priceDrop), style: HooType.caption.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _AddToBagBar extends StatelessWidget {
  const _AddToBagBar({required this.state, required this.onAdd, required this.onNotify});

  final ProductState state;
  final VoidCallback onAdd;
  final VoidCallback onNotify;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final v = state.variant;
    final soldOut = v != null && !v.purchasable;
    return Container(
      decoration: BoxDecoration(color: context.hoo.colors.background, border: Border(top: BorderSide(color: context.hoo.colors.border))),
      padding: EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.sm, HooSpacing.screen, HooSpacing.sm + MediaQuery.paddingOf(context).bottom),
      child: soldOut
          ? SecondaryButton(label: l.wishlistNotifyMe, icon: HooIcons.bell, onPressed: onNotify)
          : PrimaryButton.accent(
              label: v == null ? l.catalogSelectSize : l.catalogAddToBag,
              loading: state.adding,
              onPressed: v == null || state.stale ? null : onAdd,
            ),
    );
  }
}
