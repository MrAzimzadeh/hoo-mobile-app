import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/layer_math.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_responses.dart';
import '../../domain/studio_repositories.dart';

class PricingState extends Equatable {
  const PricingState({this.quote, this.loading = false, this.error});

  /// The last quote the server calculated — the only source of prices on screen.
  final StudioQuote? quote;
  final bool loading;
  final ApiException? error;

  @override
  List<Object?> get props => [quote, loading, error];
}

/// Live price: every change re-quotes on the server (debounced, the previous request cancelled). The client never
/// adds up money — [state.quote] is rendered as is, and the previous quote stays visible (dimmed) while a new one
/// is in flight.
class PricingCubit extends Cubit<PricingState> {
  PricingCubit(this._repo, {Duration debounce = HooDurations.priceDebounce}) : _debounce = debounce, super(const PricingState());

  final StudioPricingRepository _repo;
  final Duration _debounce;
  Timer? _timer;
  CancelToken? _token;
  int _generation = 0;

  /// Schedules a quote for [spec] + [layers] (the layers are sanitized exactly like the save payload).
  void request({required DesignSpec spec, required List<DesignLayer> layers, required List<String> fonts, String? pricingVersionId, bool immediate = false}) {
    _timer?.cancel();
    _token?.cancel();
    final generation = ++_generation;
    if (!isClosed) emit(PricingState(quote: state.quote, loading: true));
    Future<void> run() async {
      final token = _token = CancelToken();
      try {
        final quote = await _repo.quote(spec: spec, layers: LayerMath.toApiLayers(layers, fonts), pricingVersionId: pricingVersionId, cancelToken: token);
        if (!isClosed && generation == _generation) emit(PricingState(quote: quote));
      } on ApiException catch (e) {
        if (isClosed || generation != _generation || e.isCancelled) return;
        emit(PricingState(quote: state.quote, error: e));
      }
    }

    if (immediate) {
      unawaited(run());
    } else {
      _timer = Timer(_debounce, run);
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _token?.cancel();
    return super.close();
  }
}
