import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/storage/cached.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import '../../domain/studio_repositories.dart';

enum LoadStatus { loading, ready, failure }

class MyDesignsState extends Equatable {
  const MyDesignsState({this.status = LoadStatus.loading, this.items = const [], this.error, this.busyIds = const {}});

  final LoadStatus status;
  final List<DesignListItem> items;
  final Object? error;
  final Set<String> busyIds;

  @override
  List<Object?> get props => [status, items, error, busyIds];
}

/// "My designs": open, duplicate, share, delete.
class MyDesignsCubit extends Cubit<MyDesignsState> {
  MyDesignsCubit(this._designs) : super(const MyDesignsState());

  final StudioDesignRepository _designs;

  Future<void> load() async {
    if (state.items.isEmpty) emit(const MyDesignsState());
    try {
      final items = await _designs.list();
      if (!isClosed) emit(MyDesignsState(status: LoadStatus.ready, items: items));
    } on ApiException catch (e) {
      if (!isClosed) emit(state.items.isEmpty ? MyDesignsState(status: LoadStatus.failure, error: e) : MyDesignsState(status: LoadStatus.ready, items: state.items, error: e));
    }
  }

  Future<ApiException?> _busy(String id, Future<void> Function() action) async {
    if (state.busyIds.contains(id)) return null;
    emit(MyDesignsState(status: state.status, items: state.items, busyIds: {...state.busyIds, id}));
    try {
      await action();
      return null;
    } on ApiException catch (e) {
      return e;
    } finally {
      if (!isClosed) emit(MyDesignsState(status: state.status, items: state.items, busyIds: {...state.busyIds}..remove(id)));
    }
  }

  Future<ApiException?> delete(DesignListItem item) async {
    final e = await _busy(item.id, () => _designs.delete(item.id));
    if (e == null || e.isNotFound) {
      emit(MyDesignsState(status: LoadStatus.ready, items: state.items.where((d) => d.id != item.id).toList()));
      return null;
    }
    return e;
  }

  Future<ApiException?> duplicate(DesignListItem item) async {
    final e = await _busy(item.id, () => _designs.duplicate(item.id));
    if (e == null) await load();
    return e;
  }

  /// The public share URL, or the failure.
  Future<({String? url, ApiException? error})> share(DesignListItem item) async {
    String? url;
    final e = await _busy(item.id, () async => url = await _designs.share(item.id));
    return (url: url, error: e);
  }

  Future<ApiException?> resubmit(DesignListItem item) async {
    final e = await _busy(item.id, () => _designs.resubmit(item.id));
    if (e == null) await load();
    return e;
  }
}

class StudioHomeState extends Equatable {
  const StudioHomeState({this.status = LoadStatus.loading, this.config, this.stale = false, this.drafts = const [], this.error});

  final LoadStatus status;
  final StudioConfig? config;
  final bool stale;

  /// Editable designs, newest first — "Continue where you left off".
  final List<DesignListItem> drafts;
  final Object? error;

  @override
  List<Object?> get props => [status, config, stale, drafts, error];
}

class StudioHomeCubit extends Cubit<StudioHomeState> {
  StudioHomeCubit(this._config, this._designs) : super(const StudioHomeState());

  final StudioConfigRepository _config;
  final StudioDesignRepository _designs;

  Future<void> load() async {
    if (state.config == null) emit(const StudioHomeState());
    try {
      final Cached<StudioConfig> cfg = await _config.config();
      emit(StudioHomeState(status: LoadStatus.ready, config: cfg.data, stale: cfg.stale, drafts: state.drafts));
    } on ApiException catch (e) {
      if (!isClosed) emit(state.config == null ? StudioHomeState(status: LoadStatus.failure, error: e) : state);
      return;
    }
    try {
      final items = await _designs.list();
      final drafts = items.where((d) => d.editable).toList()..sort((a, b) => (b.updatedAt ?? DateTime(0)).compareTo(a.updatedAt ?? DateTime(0)));
      if (!isClosed) emit(StudioHomeState(status: LoadStatus.ready, config: state.config, stale: state.stale, drafts: drafts));
    } on ApiException {
      // drafts are a convenience; the product cards still work
    }
  }
}

class SharedDesignState extends Equatable {
  const SharedDesignState({this.status = LoadStatus.loading, this.design, this.config, this.error});

  final LoadStatus status;
  final StudioDesign? design;
  final StudioConfig? config;
  final Object? error;

  StudioBase? get base => design == null ? null : config?.base(design!.spec.baseCode);

  @override
  List<Object?> get props => [status, design, config, error];
}

/// A design someone shared by link: read-only 3D view (no editing, no prices of someone else's account needed).
class SharedDesignCubit extends Cubit<SharedDesignState> {
  SharedDesignCubit(this._designs, this._config, this.token) : super(const SharedDesignState());

  final StudioDesignRepository _designs;
  final StudioConfigRepository _config;
  final String token;

  Future<void> load() async {
    emit(const SharedDesignState());
    try {
      final results = await Future.wait<Object?>([_designs.shared(token), _config.config().then<Object?>((c) => c.data)]);
      if (!isClosed) emit(SharedDesignState(status: LoadStatus.ready, design: results[0]! as StudioDesign, config: results[1]! as StudioConfig));
    } on ApiException catch (e) {
      if (!isClosed) emit(SharedDesignState(status: LoadStatus.failure, error: e));
    }
  }
}
