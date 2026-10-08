import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/analytics/analytics.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/catalog_models.dart';
import '../../domain/catalog_repository.dart';

enum ProductStatus { loading, success, failure }

class ProductState extends Equatable {
  const ProductState({
    required this.slug,
    this.status = ProductStatus.loading,
    this.product,
    this.error,
    this.stale = false,
    this.colorId,
    this.size,
    this.recommendations,
    this.adding = false,
  });

  final String slug;
  final ProductStatus status;
  final ProductDetail? product;
  final Object? error;
  final bool stale;

  /// Selected color id (always set once the product is loaded and has colors).
  final String? colorId;

  /// Selected size — `null` until the customer picks one (Add to bag stays disabled).
  final Size? size;
  final Recommendations? recommendations;
  final bool adding;

  ProductColor? get selectedColor {
    final colors = product?.colors ?? const <ProductColor>[];
    if (colors.isEmpty) return null;
    return colors.where((c) => c.color.id == colorId).firstOrNull ?? colors.first;
  }

  List<Variant> get variants => selectedColor?.variants ?? const [];

  Variant? variantFor(Size s) => variants.where((v) => v.size == s).firstOrNull;

  Variant? get selectedVariant {
    final s = size;
    if (s == null) return null;
    final v = variantFor(s);
    return v != null && v.purchasable ? v : null;
  }

  /// Images of the selected color (falls back to the first color that has any).
  List<String> get images {
    final own = selectedColor?.images ?? const <String>[];
    if (own.isNotEmpty) return own;
    return product?.colors.map((c) => c.images).firstWhere((i) => i.isNotEmpty, orElse: () => const []) ?? const [];
  }

  bool get canAddToBag => selectedVariant != null && !adding && !stale;

  /// Every size of the selected color is sold out and none can be preordered.
  bool get colorSoldOut => variants.isNotEmpty && variants.every((v) => !v.purchasable);

  ProductState copyWith({
    ProductStatus? status,
    Object? product = _keep,
    Object? error = _keep,
    bool? stale,
    Object? colorId = _keep,
    Object? size = _keep,
    Object? recommendations = _keep,
    bool? adding,
  }) => ProductState(
    slug: slug,
    status: status ?? this.status,
    product: identical(product, _keep) ? this.product : product as ProductDetail?,
    error: identical(error, _keep) ? this.error : error,
    stale: stale ?? this.stale,
    colorId: identical(colorId, _keep) ? this.colorId : colorId as String?,
    size: identical(size, _keep) ? this.size : size as Size?,
    recommendations: identical(recommendations, _keep) ? this.recommendations : recommendations as Recommendations?,
    adding: adding ?? this.adding,
  );

  @override
  List<Object?> get props => [slug, status, product, error, stale, colorId, size, recommendations, adding];
}

const _keep = Object();

/// Product detail page: loads the product, owns color/size selection and add-to-bag.
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._repo, this._bag, this._recentlyViewed, this._analytics, {required String slug, this.preferredColorId}) : super(ProductState(slug: slug));

  final ProductRepository _repo;
  final BagService _bag;
  final RecentlyViewedService _recentlyViewed;
  final Analytics _analytics;

  /// The color the customer saw on the card (`ProductCard.defaultColor`), preselected when available.
  final String? preferredColorId;
  bool _recorded = false;

  Future<void> load() async {
    emit(state.copyWith(status: state.product == null ? ProductStatus.loading : state.status, error: null));
    try {
      final r = await _repo.product(state.slug);
      if (isClosed) return;
      final p = r.data;
      final keepSelection = state.product?.id == p.id;
      final colorId = keepSelection && p.colors.any((c) => c.color.id == state.colorId) ? state.colorId : _initialColor(p);
      emit(state.copyWith(status: ProductStatus.success, product: p, stale: r.stale, colorId: colorId, error: null));
      final size = keepSelection ? state.size : _initialSize(p);
      emit(state.copyWith(size: size != null && (state.variantFor(size)?.purchasable ?? false) ? size : null));
      if (!r.stale) _recordView(p.id);
      unawaited(_loadRecommendations());
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(status: state.product == null ? ProductStatus.failure : ProductStatus.success, error: e));
    }
  }

  String? _initialColor(ProductDetail p) {
    if (p.colors.isEmpty) return null;
    final preferred = p.colors.where((c) => c.color.id == preferredColorId && c.available).firstOrNull;
    return (preferred ?? p.colors.where((c) => c.available).firstOrNull ?? p.colors.first).color.id;
  }

  /// The style-profile recommendation, or the only size when the garment comes in one size.
  Size? _initialSize(ProductDetail p) {
    final rec = p.recommendedSize?.size;
    if (rec != null && rec != Size.unknown) return rec;
    final variants = state.variants;
    return variants.length == 1 ? variants.first.size : null;
  }

  void selectColor(String colorId) {
    if (colorId == state.colorId) return;
    final next = state.copyWith(colorId: colorId);
    final keep = state.size != null && (next.variantFor(state.size!)?.purchasable ?? false);
    emit(next.copyWith(size: keep ? state.size : null));
  }

  /// Selects a purchasable size. Returns `false` for a sold-out size (the page offers "Notify me" instead).
  bool selectSize(Size size) {
    final v = state.variantFor(size);
    if (v == null || !v.purchasable) return false;
    if (state.size != size) emit(state.copyWith(size: size));
    return true;
  }

  /// Adds the selected variant. Returns `null` on success, otherwise the error to show. On `catalog.out_of_stock`
  /// the product is reloaded so the size chips reflect the new stock.
  Future<ApiException?> addToBag() async {
    final v = state.selectedVariant;
    if (v == null || state.adding) return null;
    emit(state.copyWith(adding: true));
    try {
      await _bag.addVariant(v.id);
      _analytics.addToCart(productId: state.product?.id);
      if (!isClosed) emit(state.copyWith(adding: false));
      return null;
    } on ApiException catch (e) {
      if (isClosed) return e;
      emit(state.copyWith(adding: false));
      if (e.code == ErrorCodes.outOfStock || e.isConflict) unawaited(load());
      return e;
    }
  }

  /// `POST /alerts`: back in stock for [size] (or the selected size) in the selected color, or a price drop.
  Future<ApiException?> createAlert(StockAlertType type, {Size? size}) async {
    final p = state.product;
    if (p == null) return null;
    try {
      await _repo.createAlert(
        productId: p.id,
        type: type,
        size: type == StockAlertType.backInStock ? (size ?? state.size) : null,
        colorId: type == StockAlertType.backInStock ? state.selectedColor?.color.id : null,
      );
      return null;
    } on ApiException catch (e) {
      return e;
    }
  }

  Future<void> _loadRecommendations() async {
    try {
      final r = await _repo.recommendations(state.slug);
      if (!isClosed) emit(state.copyWith(recommendations: r));
    } on ApiException {
      // Recommendations are optional; the section simply stays hidden.
    }
  }

  void _recordView(String productId) {
    if (_recorded) return;
    _recorded = true;
    _analytics.productView(productId);
    unawaited(_recentlyViewed.record(productId).catchError((Object _) {}));
  }
}
