import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../core/storage/preferences.dart';
import '../../data/studio_repository.dart';
import '../../domain/free_layers.dart';
import '../../domain/history.dart';
import '../../domain/layer_ops.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import '../../domain/spec_rules.dart';

/// Studio steps (Stepper "Step N of 5" covers product…editor; review is the final screen).
enum StudioStep { product, fabric, fit, color, editor, review }

sealed class StudioEvent {
  const StudioEvent();
}

class StudioOpened extends StudioEvent {
  const StudioOpened({this.productSlug, this.designId, this.preferredSize, this.preferredFit});
  final String? productSlug;
  final String? designId;
  final Size? preferredSize;
  final Fit? preferredFit;
}

class StudioStepChanged extends StudioEvent {
  const StudioStepChanged(this.step);
  final StudioStep step;
}

class BaseSelected extends StudioEvent {
  const BaseSelected(this.code);
  final String code;
}

class FabricSelected extends StudioEvent {
  const FabricSelected(this.code);
  final String code;
}

class FeatureToggled extends StudioEvent {
  const FeatureToggled(this.code);
  final String code;
}

class FitSelected extends StudioEvent {
  const FitSelected(this.fit);
  final Fit fit;
}

class SizeSelected extends StudioEvent {
  const SizeSelected(this.size);
  final Size size;
}

class MeasurementsSet extends StudioEvent {
  const MeasurementsSet(this.measurements);
  final CustomMeasurements? measurements;
}

class ColorSelected extends StudioEvent {
  const ColorSelected(this.colorId);
  final String colorId;
}

class QuantityChanged extends StudioEvent {
  const QuantityChanged(this.quantity);
  final int quantity;
}

class RushToggled extends StudioEvent {
  const RushToggled(this.rush);
  final bool rush;
}

class TextLayerAdded extends StudioEvent {
  const TextLayerAdded({required this.text, this.font, required this.colorHex, this.fontSizePt, this.align = 'center'});
  final String text;
  final String? font;
  final String colorHex;
  final double? fontSizePt;
  final String align;
}

class TextLayerEdited extends StudioEvent {
  const TextLayerEdited(this.id, {this.text, this.font, this.colorHex, this.fontSizePt, this.align});
  final String id;
  final String? text;
  final String? font;
  final String? colorHex;
  final double? fontSizePt;
  final String? align;
}

class ImageLayerAdded extends StudioEvent {
  const ImageLayerAdded(this.upload, this.localDataUrl);
  final DesignUpload upload;
  final String? localDataUrl;
}

class LayerSelected extends StudioEvent {
  const LayerSelected(this.id);
  final String? id;
}

class LayerGestureStarted extends StudioEvent {
  const LayerGestureStarted(this.id);
  final String id;
}

class LayerDragged extends StudioEvent {
  const LayerDragged(this.id, this.xCm, this.yCm);
  final String id;
  final double xCm;
  final double yCm;
}

class FreeLayerDragged extends StudioEvent {
  const FreeLayerDragged(this.id, this.anchor);
  final String id;
  final LayerAnchor anchor;
}

class LayerGestureEnded extends StudioEvent {
  const LayerGestureEnded(this.id);
  final String id;
}

class LayerScaled extends StudioEvent {
  const LayerScaled(this.id, this.factor, {this.live = false});
  final String id;

  /// Relative to the size at the start of the slider drag.
  final double factor;
  final bool live;
}

class LayerRotated extends StudioEvent {
  const LayerRotated(this.id, this.degrees);
  final String id;
  final double degrees;
}

class LayerCentered extends StudioEvent {
  const LayerCentered(this.id);
  final String id;
}

class LayerDeleted extends StudioEvent {
  const LayerDeleted(this.id);
  final String id;
}

class LayerDuplicated extends StudioEvent {
  const LayerDuplicated(this.id);
  final String id;
}

class LayerReordered extends StudioEvent {
  const LayerReordered(this.id, this.toIndex);
  final String id;
  final int toIndex;
}

class LayerVisibilityToggled extends StudioEvent {
  const LayerVisibilityToggled(this.id);
  final String id;
}

class PlacementActivated extends StudioEvent {
  const PlacementActivated(this.placement, {this.fromCamera = false});
  final String placement;

  /// The camera rotated onto it (no refocus needed).
  final bool fromCamera;
}

/// Tap on an empty spot of a zone: the next layer goes there.
class SpotPicked extends StudioEvent {
  const SpotPicked(this.placement, this.xCm, this.yCm);
  final String placement;
  final double xCm;
  final double yCm;
}

/// Tap on the bare model (uploaded templates): the next layer becomes a free layer there.
class SurfacePicked extends StudioEvent {
  const SurfacePicked(this.at);
  final LayerAnchor at;
}

class UndoRequested extends StudioEvent {
  const UndoRequested();
}

class RedoRequested extends StudioEvent {
  const RedoRequested();
}

class DesignRenamed extends StudioEvent {
  const DesignRenamed(this.name);
  final String name;
}

class ImageRightsConfirmed extends StudioEvent {
  const ImageRightsConfirmed(this.confirmed);
  final bool confirmed;
}

/// Autosave created the design on the server.
class DesignIdAssigned extends StudioEvent {
  const DesignIdAssigned(this.id);
  final String id;
}

enum StudioStatus { loading, ready, failure }

class StudioState extends Equatable {
  const StudioState({
    this.status = StudioStatus.loading,
    this.config,
    this.error,
    this.step = StudioStep.product,
    this.history,
    this.selectedId,
    this.activePlacement,
    this.hidden = const {},
    this.uploads = const {},
    this.localImages = const {},
    this.designId,
    this.editable = true,
    this.designStatus = DesignStatus.draft,
    this.changeRequestMessage,
    this.imageRightsConfirmed = false,
    this.spot,
    this.surfaceSpot,
    this.notice,
  });

  final StudioStatus status;
  final StudioConfig? config;
  final Object? error;
  final StudioStep step;
  final History<DesignDoc>? history;
  final String? selectedId;
  final String? activePlacement;

  /// Client-only visibility (hidden layers are still part of the design and the price).
  final Set<String> hidden;
  final Map<String, DesignUpload> uploads;

  /// uploadId → local data URL (instant preview before/without the network image).
  final Map<String, String> localImages;
  final String? designId;
  final bool editable;
  final DesignStatus designStatus;
  final String? changeRequestMessage;
  final bool imageRightsConfirmed;

  /// Where the next added layer goes (zone + cm).
  final ({String placement, double x, double y})? spot;
  final LayerAnchor? surfaceSpot;

  /// One-off message code for the UI (e.g. `studio.too_many_layers`).
  final String? notice;

  DesignDoc? get doc => history?.present;
  DesignSpec? get spec => doc?.spec;
  List<DesignLayer> get layers => doc?.layers ?? const [];
  StudioBase? get base => config?.base(spec?.baseCode);
  DesignLayer? get selected => layers.where((l) => l.id == selectedId).firstOrNull;
  bool get canUndo => history?.canUndo ?? false;
  bool get canRedo => history?.canRedo ?? false;
  int get maxLayers => config?.maxLayers ?? 10;

  /// Print area of a placement (zones of the base, or the layer's own box for free layers).
  PrintArea? areaOf(DesignLayer l) => isFreeLayer(l) ? freeArea(l) : base?.area(l.placement);

  StudioState copyWith({
    StudioStatus? status,
    StudioConfig? config,
    Object? Function()? error,
    StudioStep? step,
    History<DesignDoc>? history,
    String? Function()? selectedId,
    String? Function()? activePlacement,
    Set<String>? hidden,
    Map<String, DesignUpload>? uploads,
    Map<String, String>? localImages,
    String? Function()? designId,
    bool? editable,
    DesignStatus? designStatus,
    String? Function()? changeRequestMessage,
    bool? imageRightsConfirmed,
    ({String placement, double x, double y})? Function()? spot,
    LayerAnchor? Function()? surfaceSpot,
    String? Function()? notice,
  }) =>
      StudioState(
        status: status ?? this.status,
        config: config ?? this.config,
        error: error == null ? this.error : error(),
        step: step ?? this.step,
        history: history ?? this.history,
        selectedId: selectedId == null ? this.selectedId : selectedId(),
        activePlacement: activePlacement == null ? this.activePlacement : activePlacement(),
        hidden: hidden ?? this.hidden,
        uploads: uploads ?? this.uploads,
        localImages: localImages ?? this.localImages,
        designId: designId == null ? this.designId : designId(),
        editable: editable ?? this.editable,
        designStatus: designStatus ?? this.designStatus,
        changeRequestMessage: changeRequestMessage == null ? this.changeRequestMessage : changeRequestMessage(),
        imageRightsConfirmed: imageRightsConfirmed ?? this.imageRightsConfirmed,
        spot: spot == null ? this.spot : spot(),
        surfaceSpot: surfaceSpot == null ? this.surfaceSpot : surfaceSpot(),
        notice: notice == null ? this.notice : notice(),
      );

  @override
  List<Object?> get props => [
        status, config, error, step, history?.present, history?.past.length, history?.future.length, selectedId, activePlacement, hidden, uploads,
        localImages, designId, editable, designStatus, changeRequestMessage, imageRightsConfirmed, spot, surfaceSpot, notice,
      ];
}

/// The Studio editor: configuration steps and the layer editor. Flutter owns the design (spec + layers, with
/// undo/redo); the 3D engine renders it and reports gestures; pricing and autosave observe [StudioState.doc].
class StudioEditorBloc extends Bloc<StudioEvent, StudioState> {
  StudioEditorBloc(this._repo, this._prefs) : super(const StudioState()) {
    on<StudioOpened>(_onOpened);
    on<StudioStepChanged>(_onStep);
    on<BaseSelected>(_onBase);
    on<FabricSelected>((e, emit) => _spec(emit, (s) => s.copyWith(fabricCode: e.code), key: 'fabric'));
    on<FeatureToggled>((e, emit) => _spec(emit, (s) => s.copyWith(featureCodes: s.featureCodes.contains(e.code) ? (s.featureCodes.where((c) => c != e.code).toList()) : [...s.featureCodes, e.code])));
    on<FitSelected>((e, emit) => _spec(emit, (s) => s.copyWith(fit: e.fit), key: 'fit'));
    on<SizeSelected>((e, emit) => _spec(emit, (s) => s.copyWith(size: e.size, customMeasurements: null), key: 'size'));
    on<MeasurementsSet>((e, emit) => _spec(emit, (s) => s.copyWith(customMeasurements: e.measurements, size: e.measurements == null ? s.size : null), key: 'measure'));
    on<ColorSelected>(_onColor);
    on<QuantityChanged>((e, emit) => _spec(emit, (s) => s.copyWith(quantity: e.quantity.clamp(1, maxQuantityFor(state.base))), key: 'qty'));
    on<RushToggled>((e, emit) => _spec(emit, (s) => s.copyWith(rush: e.rush)));
    on<TextLayerAdded>(_onTextAdded);
    on<TextLayerEdited>(_onTextEdited);
    on<ImageLayerAdded>(_onImageAdded);
    on<LayerSelected>((e, emit) {
      final l = state.layers.where((x) => x.id == e.id).firstOrNull;
      emit(state.copyWith(selectedId: () => e.id, activePlacement: l == null || isFreeLayer(l) ? null : () => l.placement));
    });
    on<LayerGestureStarted>((e, emit) => emit(state.copyWith(history: state.history?.checkpoint())));
    on<LayerDragged>(_onDragged);
    on<FreeLayerDragged>((e, emit) => _layer(emit, e.id, (l) => l.copyWith(anchor: e.anchor), live: true));
    on<LayerGestureEnded>((e, emit) => emit(state.copyWith(history: state.history?.dropCheckpointIfUnchanged())));
    on<LayerScaled>(_onScaled);
    on<LayerRotated>((e, emit) => _layer(emit, e.id, (l) => l.copyWith(rotation: normalizeRotation(e.degrees)), key: 'rotate-${e.id}'));
    on<LayerCentered>((e, emit) => _layer(emit, e.id, (l) {
          final a = state.areaOf(l);
          return a == null ? l : centerLayer(l, a);
        }));
    on<LayerDeleted>((e, emit) {
      _commit(emit, state.doc!.copyWith(layers: state.layers.where((l) => l.id != e.id).toList()));
      emit(state.copyWith(selectedId: () => null, hidden: {...state.hidden}..remove(e.id)));
    });
    on<LayerDuplicated>(_onDuplicated);
    on<LayerReordered>((e, emit) => _commit(emit, state.doc!.copyWith(layers: reorderStack(state.layers, e.id, e.toIndex))));
    on<LayerVisibilityToggled>((e, emit) => emit(state.copyWith(hidden: state.hidden.contains(e.id) ? ({...state.hidden}..remove(e.id)) : {...state.hidden, e.id})));
    on<PlacementActivated>((e, emit) => emit(state.copyWith(activePlacement: () => e.placement, spot: () => null)));
    on<SpotPicked>((e, emit) => emit(state.copyWith(activePlacement: () => e.placement, spot: () => (placement: e.placement, x: e.xCm, y: e.yCm), surfaceSpot: () => null, selectedId: () => null)));
    on<SurfacePicked>((e, emit) => emit(state.copyWith(surfaceSpot: () => e.at, spot: () => null, selectedId: () => null)));
    on<UndoRequested>((e, emit) => _history(emit, state.history?.undo()));
    on<RedoRequested>((e, emit) => _history(emit, state.history?.redo()));
    on<DesignRenamed>((e, emit) => _commit(emit, state.doc!.copyWith(name: e.name.trim()), key: 'name'));
    on<ImageRightsConfirmed>((e, emit) => emit(state.copyWith(imageRightsConfirmed: e.confirmed)));
    on<DesignIdAssigned>((e, emit) => emit(state.copyWith(designId: () => e.id)));
  }

  final StudioRepository _repo;
  final Preferences _prefs;

  Future<void> _onOpened(StudioOpened e, Emitter<StudioState> emit) async {
    emit(const StudioState());
    try {
      final config = await _repo.config(productSlug: e.productSlug);
      if (config.baseProducts.isEmpty) throw const ApiException(statusCode: 404, code: 'studio.base_not_found');
      if (e.designId != null) {
        final d = await _repo.design(e.designId!);
        emit(StudioState(
          status: StudioStatus.ready,
          config: config,
          step: d.editable ? StudioStep.editor : StudioStep.review,
          history: History(DesignDoc(name: d.name, spec: d.spec, layers: d.layers)),
          uploads: {for (final u in d.uploads) u.id: u},
          designId: d.id,
          editable: d.editable,
          designStatus: d.status,
          changeRequestMessage: d.changeRequestMessage,
          imageRightsConfirmed: d.imageRightsConfirmed,
          activePlacement: config.base(d.spec.baseCode)?.printAreas.firstOrNull?.placement,
        ));
        return;
      }
      // from a PDP the catalog product is the preselected base; otherwise resume the last base or take the first
      final progress = _prefs.studioProgress;
      final preselect = e.productSlug != null ? config.baseProducts.where((b) => b.product?.slug == e.productSlug || b.isCatalog).firstOrNull : null;
      final base = preselect ?? config.base(progress?['baseCode'] as String?) ?? config.baseProducts.first;
      final spec = defaultSpec(base, config, preferredSize: e.preferredSize, preferredFit: e.preferredFit);
      emit(StudioState(
        status: StudioStatus.ready,
        config: config,
        step: preselect != null ? StudioStep.fabric : StudioStep.product,
        history: History(DesignDoc(spec: spec)),
        activePlacement: base.printAreas.firstOrNull?.placement,
      ));
    } catch (err) {
      emit(StudioState(status: StudioStatus.failure, error: err));
    }
  }

  void _onStep(StudioStepChanged e, Emitter<StudioState> emit) {
    if (!state.editable && e.step != StudioStep.review) return;
    emit(state.copyWith(step: e.step, selectedId: e.step == StudioStep.editor ? null : () => null));
    final spec = state.spec;
    if (spec != null) _prefs.setStudioProgress({'step': e.step.name, 'baseCode': spec.baseCode, 'designId': ?state.designId});
  }

  void _onBase(BaseSelected e, Emitter<StudioState> emit) {
    final config = state.config;
    final base = config?.base(e.code);
    final doc = state.doc;
    if (config == null || base == null || doc == null) return;
    final spec = rebaseSpec(doc.spec, base, config);
    _commit(emit, doc.copyWith(spec: spec, layers: layersForBase(doc.layers, base)));
    emit(state.copyWith(activePlacement: () => base.printAreas.firstOrNull?.placement, selectedId: () => null));
  }

  void _onColor(ColorSelected e, Emitter<StudioState> emit) {
    final base = state.base;
    if (base == null) return;
    _spec(emit, (s) => s.copyWith(colorId: e.colorId, size: s.customMeasurements != null ? null : pickSize(base, e.colorId, s.size)), key: 'color');
  }

  void _onTextAdded(TextLayerAdded e, Emitter<StudioState> emit) {
    if (!_roomForLayer(emit)) return;
    final config = state.config!;
    final target = _target();
    if (target == null) return;
    var layer = createTextLayer(
      placement: target.placement,
      area: target.area,
      printMethodCode: pickPrintMethod(config.printMethods, target.area.widthCm * 0.5, target.area.heightCm * 0.2),
      zIndex: nextZIndex(state.layers),
      text: e.text,
      font: e.font,
      colorHex: e.colorHex,
      fontSizePt: e.fontSizePt,
      align: e.align,
    );
    layer = _position(layer, target.area);
    _add(emit, fitPrintMethod(layer, config.printMethods, target.area));
  }

  void _onTextEdited(TextLayerEdited e, Emitter<StudioState> emit) => _layer(emit, e.id, (l) {
        final next = l.copyWith(text: e.text ?? l.text, font: e.font ?? l.font, colorHex: e.colorHex ?? l.colorHex, fontSizePt: e.fontSizePt ?? l.fontSizePt, align: e.align ?? l.align);
        final area = state.areaOf(next);
        final measured = e.text != null || e.fontSizePt != null || e.font != null ? remeasureText(next, isFreeLayer(next) ? null : area) : next;
        return isFreeLayer(measured) ? normalizeFree(measured) : measured;
      }, key: 'text-${e.id}');

  void _onImageAdded(ImageLayerAdded e, Emitter<StudioState> emit) {
    final uploads = {...state.uploads, e.upload.id: e.upload};
    final images = e.localDataUrl == null ? state.localImages : {...state.localImages, e.upload.id: e.localDataUrl!};
    emit(state.copyWith(uploads: uploads, localImages: images));
    if (!_roomForLayer(emit)) return;
    final config = state.config!;
    final target = _target();
    if (target == null) return;
    var layer = createImageLayer(
      placement: target.placement,
      area: target.area,
      printMethodCode: pickPrintMethod(config.printMethods, target.area.widthCm * 0.6, target.area.heightCm * 0.6),
      zIndex: nextZIndex(state.layers),
      upload: e.upload,
    );
    layer = _position(layer, target.area);
    _add(emit, fitPrintMethod(layer, config.printMethods, target.area));
  }

  void _onDragged(LayerDragged e, Emitter<StudioState> emit) => _layer(emit, e.id, (l) {
        final area = state.areaOf(l);
        return area == null ? l : clampLayerToArea(l.copyWith(xCm: e.xCm, yCm: e.yCm), area);
      }, live: true);

  void _onScaled(LayerScaled e, Emitter<StudioState> emit) => _layer(emit, e.id, (l) {
        final area = isFreeLayer(l) ? const PrintArea(placement: '', widthCm: LayerRules.maxCm, heightCm: LayerRules.maxCm) : state.areaOf(l);
        if (area == null) return l;
        final scaled = scaleLayer(l, e.factor, area);
        final config = state.config!;
        return fitPrintMethod(isFreeLayer(scaled) ? normalizeFree(scaled) : scaled, config.printMethods, area);
      }, key: 'scale-${e.id}');

  void _onDuplicated(LayerDuplicated e, Emitter<StudioState> emit) {
    final src = state.layers.where((l) => l.id == e.id).firstOrNull;
    if (src == null || !_roomForLayer(emit)) return;
    final area = state.areaOf(src);
    var copy = src.copyWith(id: newLayerId(), xCm: src.xCm + 1, yCm: src.yCm + 1, zIndex: nextZIndex(state.layers));
    if (isFreeLayer(src)) {
      copy = copy.copyWith(placement: newFreeCode(state.layers.map((l) => l.placement)), xCm: 0, yCm: 0);
    } else if (area != null) {
      copy = clampLayerToArea(copy, area);
    }
    _add(emit, copy);
  }

  /// Where a new layer goes: a picked spot, the picked free surface, the active zone, or the first zone.
  ({String placement, PrintArea area})? _target() {
    final base = state.base;
    if (base == null) return null;
    final surface = state.surfaceSpot;
    if (surface != null && base.allowsFreePlacement) {
      final code = newFreeCode(state.layers.map((l) => l.placement));
      return (placement: code, area: PrintArea(placement: code, widthCm: 28, heightCm: 28));
    }
    final placement = state.spot?.placement ?? state.activePlacement ?? base.printAreas.firstOrNull?.placement;
    final area = placement == null ? null : base.area(placement);
    return area == null ? null : (placement: placement!, area: area);
  }

  DesignLayer _position(DesignLayer layer, PrintArea area) {
    final spot = state.spot;
    final surface = state.surfaceSpot;
    if (surface != null && layer.placement.startsWith(FreePlacement.prefix)) {
      return normalizeFree(layer.copyWith(anchor: surface));
    }
    if (spot != null && spot.placement == layer.placement) return placeLayerAt(layer, area, spot.x, spot.y);
    return layer;
  }

  bool _roomForLayer(Emitter<StudioState> emit) {
    if (state.layers.length < state.maxLayers) return true;
    emit(state.copyWith(notice: () => 'studio.too_many_layers'));
    emit(state.copyWith(notice: () => null));
    return false;
  }

  void _add(Emitter<StudioState> emit, DesignLayer layer) {
    _commit(emit, state.doc!.copyWith(layers: [...state.layers, layer]));
    emit(state.copyWith(selectedId: () => layer.id, spot: () => null, surfaceSpot: () => null, activePlacement: isFreeLayer(layer) ? null : () => layer.placement));
  }

  void _spec(Emitter<StudioState> emit, DesignSpec Function(DesignSpec) change, {String? key}) {
    final doc = state.doc;
    if (doc == null || !state.editable) return;
    _commit(emit, doc.copyWith(spec: change(doc.spec)), key: key);
  }

  void _layer(Emitter<StudioState> emit, String id, DesignLayer Function(DesignLayer) change, {String? key, bool live = false}) {
    final doc = state.doc;
    if (doc == null || !state.editable) return;
    final layers = [for (final l in doc.layers) l.id == id ? change(l) : l];
    final next = doc.copyWith(layers: layers);
    if (live) {
      emit(state.copyWith(history: state.history!.replacePresent(next)));
    } else {
      _commit(emit, next, key: key);
    }
  }

  void _commit(Emitter<StudioState> emit, DesignDoc next, {String? key}) {
    final h = state.history;
    if (h == null) return;
    emit(state.copyWith(history: h.commit(next, key: key)));
  }

  void _history(Emitter<StudioState> emit, History<DesignDoc>? h) {
    if (h == null || !state.editable) return;
    final ids = h.present.layers.map((l) => l.id).toSet();
    emit(state.copyWith(history: h, selectedId: ids.contains(state.selectedId) ? null : () => null));
  }
}
