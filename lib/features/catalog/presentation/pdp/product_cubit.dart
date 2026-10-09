import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/analytics/analytics.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/catalog_models.dart';
import '../../domain/catalog_repositories.dart';

class ProductState extends Equatable {
  const ProductState({
    this.detail,
    this.recommendations,
    this.loading = true,
    this.error,
    this.stale = false,
    this.colorId,
    this.size,
    this.sizeError = false,
    this.adding = false,
  });

  final ProductDetail? detail;
  final Recommendations? recommendations;
  final bool loading;
  final Object? error;
  final bool stale;
  final String? colorId;
  final Size? size;

  /// "Choose a size" nudge after tapping Add to bag without one.
  final bool sizeError;
  final bool adding;

  ProductColor? get color => detail?.colorById(colorId) ?? detail?.colors.firstOrNull;
  ProductVariant? get variant => size == null ? null : color?.variantFor(size!);

  /// Price of the selected variant (sizes may differ), else the product's from-price.
  double? get price => variant?.price ?? detail?.price;

  ProductState copyWith({
    ProductDetail? detail,
    Recommendations? recommendations,
    bool? loading,
    Object? Function()? error,
    bool? stale,
    String? colorId,
    Size? Function()? size,
    bool? sizeError,
    bool? adding,
  }) =>
      ProductState(
        detail: detail ?? this.detail,
        recommendations: recommendations ?? this.recommendations,
        loading: loading ?? this.loading,
        error: error == null ? this.error : error(),
        stale: stale ?? this.stale,
        colorId: colorId ?? this.colorId,
        size: size == null ? this.size : size(),
        sizeError: sizeError ?? this.sizeError,
        adding: adding ?? this.adding,
      );

  @override
  List<Object?> get props => [detail, recommendations, loading, error, stale, colorId, size, sizeError, adding];
}

/// Product detail: data, color/size selection (recommended size preselected) and add-to-bag.
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._products, this._bag, this._recent, this._analytics) : super(const ProductState());

  final ProductRepository _products;
  final BagService _bag;
  final RecentlyViewedService _recent;
  final Analytics _analytics;

  Future<void> load(String slug) async {
    emit(state.copyWith(loading: true, error: () => null));
    try {
      final r = await _products.product(slug);
      final d = r.data;
      final color = state.colorId != null && d.colorById(state.colorId) != null
          ? d.colorById(state.colorId)!
          : (d.colors.where((c) => c.purchasable).firstOrNull ?? d.colors.firstOrNull);
      final recommended = d.recommendedSize?.size;
      final preselect = state.size ?? (recommended != null && (color?.variantFor(recommended)?.purchasable ?? false) ? recommended : null);
      emit(state.copyWith(detail: d, stale: r.stale, loading: false, colorId: color?.color.id, size: () => preselect));
      if (!r.stale) {
        _analytics.productView(d.id);
        unawaited(_recent.record(d.id));
      }
      unawaited(_loadRecommendations(slug));
    } catch (e) {
      emit(state.copyWith(loading: false, error: () => e));
    }
  }

  Future<void> _loadRecommendations(String slug) async {
    try {
      final r = await _products.recommendations(slug);
      if (!isClosed) emit(state.copyWith(recommendations: r.data));
    } catch (_) {
      // recommendations are optional
    }
  }

  void selectColor(String colorId) {
    final next = state.detail?.colorById(colorId);
    if (next == null) return;
    // keep the size if this color has it
    final keep = state.size != null && next.variantFor(state.size!) != null;
    emit(state.copyWith(colorId: colorId, size: keep ? null : () => null, sizeError: false));
  }

  void selectSize(Size size) => emit(state.copyWith(size: () => size, sizeError: false));

  /// Adds the selected variant. `added` false + no error → a size must be chosen first.
  Future<({bool added, ApiException? error})> addToBag() async {
    final v = state.variant;
    if (v == null) {
      emit(state.copyWith(sizeError: true));
      return (added: false, error: null);
    }
    if (state.adding) return (added: false, error: null);
    emit(state.copyWith(adding: true));
    try {
      await _bag.addVariant(v.id);
      emit(state.copyWith(adding: false));
      return (added: true, error: null);
    } on ApiException catch (e) {
      emit(state.copyWith(adding: false));
      if (e.code == 'catalog.out_of_stock' && state.detail != null) await load(state.detail!.slug);
      return (added: false, error: e);
    }
  }
}
