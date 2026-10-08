import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/history.dart';
import '../../domain/layer_math.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import '../../domain/spec_defaults.dart';
import '../../domain/studio_repositories.dart';

enum StudioStep { product, fabric, size, color, editor, review }

enum EditorStatus { loading, ready, failure }

/// One-off messages the page turns into toasts.
enum StudioNotice { layersDropped, maxLayers, designNotEditable, baseChanged }

sealed class StudioEditorEvent {
  const StudioEditorEvent();
}

final class StudioStarted extends StudioEditorEvent {
  const StudioStarted({this.productSlug, this.designId});
  final String? productSlug;
  final String? designId;
}

final class StepRequested extends StudioEditorEvent {
  const StepRequested(this.step);
  final StudioStep step;
}

final class StepAdvanced extends StudioEditorEvent {
  const StepAdvanced();
}

final class StepBack extends StudioEditorEvent {
  const StepBack();
}

final class BaseSelected extends StudioEditorEvent {
  const BaseSelected(this.code);
  final String code;
}

final class FabricSelected extends StudioEditorEvent {
  const FabricSelected(this.code);
  final String code;
}

final class FeatureToggled extends StudioEditorEvent {
  const FeatureToggled(this.code);
  final String code;
}

final class FitSelected extends StudioEditorEvent {
  const FitSelected(this.fit);
  final Fit fit;
}

final class SizeSelected extends StudioEditorEvent {
  const SizeSelected(this.size);
  final Size size;
}

final class ColorSelected extends StudioEditorEvent {
  const ColorSelected(this.colorId);
  final String colorId;
}

final class CustomMeasurementsChanged extends StudioEditorEvent {
  const CustomMeasurementsChanged(this.measurements);

  /// Null switches custom measurements off.
  final CustomMeasurements? measurements;
}

final class QuantityChanged extends StudioEditorEvent {
  const QuantityChanged(this.quantity);
  final int quantity;
}

final class RushToggled extends StudioEditorEvent {
  const RushToggled(this.rush);
  final bool rush;
}

final class NameChanged extends StudioEditorEvent {
  const NameChanged(this.name);
  final String name;
}

final class ImageRightsChanged extends StudioEditorEvent {
  const ImageRightsChanged(this.confirmed);
  final bool confirmed;
}

final class PlacementSelected extends StudioEditorEvent {
  const PlacementSelected(this.placement);
  final String placement;
}

final class TextLayerAdded extends StudioEditorEvent {
  const TextLayerAdded({this.text = 'HOO'});
  final String text;
}

final class ImageLayerAdded extends StudioEditorEvent {
  const ImageLayerAdded(this.upload);
  final DesignUpload upload;
}

/// Edits one layer. [coalesceKey] merges rapid edits (a slider drag) into a single undo step.
final class LayerEdited extends StudioEditorEvent {
  const LayerEdited(this.id, this.edit, {this.coalesceKey});
  final String id;
  final DesignLayer Function(DesignLayer layer) edit;
  final String? coalesceKey;
}

final class LayerSelected extends StudioEditorEvent {
  const LayerSelected(this.id);
  final String? id;
}

final class LayerDeleted extends StudioEditorEvent {
  const LayerDeleted(this.id);
  final String id;
}

final class LayerDuplicated extends StudioEditorEvent {
  const LayerDuplicated(this.id);
  final String id;
}

final class LayerReordered extends StudioEditorEvent {
  const LayerReordered(this.id, this.toIndex);
  final String id;
  final int toIndex;
}

/// A tap on a zone: moves the selected layer there, else just activates the zone.
final class ZoneTapped extends StudioEditorEvent {
  const ZoneTapped(this.placement, this.xCm, this.yCm);
  final String placement;
  final double xCm;
  final double yCm;
}

final class GestureStarted extends StudioEditorEvent {
  const GestureStarted();
}

final class GestureEnded extends StudioEditorEvent {
  const GestureEnded();
}

final class LayerDragged extends StudioEditorEvent {
  const LayerDragged(this.id, this.xCm, this.yCm);
  final String id;
  final double xCm;
  final double yCm;
}

final class SurfaceDragged extends StudioEditorEvent {
  const SurfaceDragged(this.id, this.anchor);
  final String id;
  final LayerAnchor anchor;
}

final class UndoRequested extends StudioEditorEvent {
  const UndoRequested();
}

final class RedoRequested extends StudioEditorEvent {
  const RedoRequested();
}

/// The server created the design (autosave) — keep its id so the next saves are PATCHes.
final class DesignPersisted extends StudioEditorEvent {
  const DesignPersisted(this.id);
  final String id;
}

class StudioEditorState extends Equatable {
  const StudioEditorState({
    this.status = EditorStatus.loading,
    this.config,
    this.stale = false,
    this.history,
    this.step = StudioStep.product,
    this.designId,
    this.designStatus = DesignStatus.draft,
    this.readOnly = false,
    this.changeRequestMessage,
    this.selectedLayerId,
    this.activePlacement,
    this.imageRightsConfirmed = false,
    this.uploads = const [],
    this.notice,
    this.noticeCount = 0,
    this.noticeValue = 0,
    this.error,
  });

  final EditorStatus status;
  final StudioConfig? config;
  final bool stale;
  final History<DesignDoc>? history;
  final StudioStep step;
  final String? designId;
  final DesignStatus designStatus;

  /// The design is no longer editable (submitted / approved…): shown, never changed.
  final bool readOnly;
  final String? changeRequestMessage;
  final String? selectedLayerId;
  final String? activePlacement;
  final bool imageRightsConfirmed;

  /// Uploads already attached to the loaded design (their images are fetched for the 3D view).
  final List<DesignUpload> uploads;
  final StudioNotice? notice;
  final int noticeCount;
  final int noticeValue;
  final ApiException? error;

  DesignDoc? get doc => history?.present;
  DesignSpec? get spec => doc?.spec;
  List<DesignLayer> get layers => doc?.layers ?? const [];
  StudioBase? get base => spec == null ? null : config?.base(spec!.baseCode);
  bool get hasBase => base != null;
  bool get canUndo => !readOnly && (history?.canUndo ?? false);
  bool get canRedo => !readOnly && (history?.canRedo ?? false);
  DesignLayer? get selectedLayer => layers.where((l) => l.id == selectedLayerId).firstOrNull;
  ColorInfo? get color => base?.colors.where((c) => c.id == spec?.colorId).firstOrNull;
  bool get canAddLayer => config != null && layers.length < config!.maxLayers && !readOnly;

  /// Whether the customer may leave [step] forward.
  bool canLeave(StudioStep step) {
    final s = spec;
    final b = base;
    switch (step) {
      case StudioStep.product:
        return b != null;
      case StudioStep.fabric:
        return s != null && s.fabricCode.isNotEmpty;
      case StudioStep.size:
        return s != null && ((b?.sizes.isEmpty ?? true) || s.size != null);
      case StudioStep.color:
        return s != null && s.colorId.isNotEmpty;
      case StudioStep.editor:
        return layers.isNotEmpty;
      case StudioStep.review:
        return true;
    }
  }

  StudioEditorState copyWith({
    EditorStatus? status,
    StudioConfig? config,
    bool? stale,
    History<DesignDoc>? history,
    StudioStep? step,
    String? designId,
    DesignStatus? designStatus,
    bool? readOnly,
    Object? changeRequestMessage = _keep,
    Object? selectedLayerId = _keep,
    Object? activePlacement = _keep,
    bool? imageRightsConfirmed,
    List<DesignUpload>? uploads,
    StudioNotice? notice,
    int? noticeValue,
    Object? error = _keep,
  }) => StudioEditorState(
    status: status ?? this.status,
    config: config ?? this.config,
    stale: stale ?? this.stale,
    history: history ?? this.history,
    step: step ?? this.step,
    designId: designId ?? this.designId,
    designStatus: designStatus ?? this.designStatus,
    readOnly: readOnly ?? this.readOnly,
    changeRequestMessage: identical(changeRequestMessage, _keep) ? this.changeRequestMessage : changeRequestMessage as String?,
    selectedLayerId: identical(selectedLayerId, _keep) ? this.selectedLayerId : selectedLayerId as String?,
    activePlacement: identical(activePlacement, _keep) ? this.activePlacement : activePlacement as String?,
    imageRightsConfirmed: imageRightsConfirmed ?? this.imageRightsConfirmed,
    uploads: uploads ?? this.uploads,
    notice: notice ?? this.notice,
    noticeCount: notice != null ? noticeCount + 1 : noticeCount,
    noticeValue: noticeValue ?? this.noticeValue,
    error: identical(error, _keep) ? this.error : error as ApiException?,
  );

  @override
  List<Object?> get props => [status, config, stale, history, step, designId, designStatus, readOnly, changeRequestMessage, selectedLayerId, activePlacement, imageRightsConfirmed, noticeCount, error];
}

const _keep = Object();

/// The Studio editor: the design document (spec + layers) with undo/redo, the step flow, selection and the
/// rules that keep every layer inside its zone. Pricing, autosave and uploads are separate cubits that watch it.
class StudioEditorBloc extends Bloc<StudioEditorEvent, StudioEditorState> {
  StudioEditorBloc(this._config, this._designs) : super(const StudioEditorState()) {
    on<StudioStarted>(_onStarted);
    on<StepRequested>((e, emit) => emit(state.copyWith(step: e.step)));
    on<StepAdvanced>(_onAdvance);
    on<StepBack>(_onBack);
    on<BaseSelected>(_onBase);
    on<FabricSelected>((e, emit) => _spec(emit, (s) => s.copyWith(fabricCode: e.code)));
    on<FeatureToggled>((e, emit) => _spec(emit, (s) => s.copyWith(featureCodes: s.featureCodes.contains(e.code) ? s.featureCodes.where((c) => c != e.code).toList() : [...s.featureCodes, e.code])));
    on<FitSelected>((e, emit) => _spec(emit, (s) => s.copyWith(fit: e.fit)));
    on<SizeSelected>((e, emit) => _spec(emit, (s) => s.copyWith(size: e.size, customMeasurements: s.customMeasurements)));
    on<ColorSelected>(_onColor);
    on<CustomMeasurementsChanged>((e, emit) => _spec(emit, (s) => s.copyWith(customMeasurements: e.measurements), key: 'measurements'));
    on<QuantityChanged>((e, emit) => _spec(emit, (s) => s.copyWith(quantity: e.quantity.clamp(1, state.base?.maxQuantity ?? 999)), key: 'quantity'));
    on<RushToggled>((e, emit) => _spec(emit, (s) => s.copyWith(rush: e.rush)));
    on<NameChanged>((e, emit) => _commit(emit, state.doc!.copyWith(name: e.name), key: 'name'));
    on<ImageRightsChanged>((e, emit) => emit(state.copyWith(imageRightsConfirmed: e.confirmed)));
    on<PlacementSelected>((e, emit) => emit(state.copyWith(activePlacement: e.placement, selectedLayerId: state.selectedLayer?.placement == e.placement ? state.selectedLayerId : null)));
    on<TextLayerAdded>(_onAddText);
    on<ImageLayerAdded>(_onAddImage);
    on<LayerEdited>(_onEdit);
    on<LayerSelected>((e, emit) {
      final l = state.layers.where((x) => x.id == e.id).firstOrNull;
      emit(state.copyWith(selectedLayerId: e.id, activePlacement: l?.placement ?? state.activePlacement));
    });
    on<LayerDeleted>(_onDelete);
    on<LayerDuplicated>(_onDuplicate);
    on<LayerReordered>((e, emit) => _layers(emit, LayerMath.reorder(state.layers, e.id, e.toIndex)));
    on<ZoneTapped>(_onZoneTapped);
    on<GestureStarted>((e, emit) {
      final h = state.history;
      if (h != null && !state.readOnly) emit(state.copyWith(history: h.checkpoint()));
    });
    on<GestureEnded>((e, emit) {
      final h = state.history;
      if (h != null) emit(state.copyWith(history: h.dropCheckpointIfUnchanged()));
    });
    on<LayerDragged>(_onDragged);
    on<SurfaceDragged>(_onSurfaceDragged);
    on<UndoRequested>(_onUndo);
    on<RedoRequested>(_onRedo);
    on<DesignPersisted>((e, emit) => emit(state.copyWith(designId: e.id)));
  }

  final StudioConfigRepository _config;
  final StudioDesignRepository _designs;

  // ── start ────────────────────────────────────────────────────────────────

  Future<void> _onStarted(StudioStarted e, Emitter<StudioEditorState> emit) async {
    emit(const StudioEditorState());
    try {
      final cfg = await _config.config(product: e.productSlug);
      final prefs = await _config.stylePreferences();
      final config = cfg.data;
      _prefs = prefs;
      if (e.designId != null) {
        final d = await _designs.get(e.designId!);
        final base = config.base(d.spec.baseCode);
        emit(StudioEditorState(
          status: EditorStatus.ready,
          config: config,
          stale: cfg.stale,
          history: History(d.doc),
          step: base == null ? StudioStep.product : StudioStep.editor,
          designId: d.id,
          designStatus: d.status,
          readOnly: !d.editable,
          changeRequestMessage: d.changeRequestMessage,
          activePlacement: base?.areas.firstOrNull?.placement,
          imageRightsConfirmed: d.imageRightsConfirmed,
          uploads: d.uploads,
          notice: d.editable ? null : StudioNotice.designNotEditable,
        ));
        return;
      }
      final preselected = e.productSlug == null ? null : config.baseProducts.where((b) => b.product?.slug == e.productSlug).firstOrNull;
      if (preselected != null) {
        final spec = SpecDefaults.specFor(config, preselected, preferredSize: prefs.size, preferredFit: prefs.fit);
        emit(StudioEditorState(
          status: EditorStatus.ready,
          config: config,
          stale: cfg.stale,
          history: History(DesignDoc(spec: spec)),
          step: StudioStep.fabric,
          activePlacement: preselected.areas.firstOrNull?.placement,
        ));
      } else {
        emit(StudioEditorState(status: EditorStatus.ready, config: config, stale: cfg.stale));
      }
    } on ApiException catch (err) {
      emit(StudioEditorState(status: EditorStatus.failure, error: err));
    }
  }

  ({Size? size, Fit? fit}) _prefs = (size: null, fit: null);

  // ── steps ────────────────────────────────────────────────────────────────

  void _onAdvance(StepAdvanced e, Emitter<StudioEditorState> emit) {
    if (!state.canLeave(state.step)) return;
    final i = StudioStep.values.indexOf(state.step);
    if (i < StudioStep.values.length - 1) emit(state.copyWith(step: StudioStep.values[i + 1], selectedLayerId: null));
  }

  void _onBack(StepBack e, Emitter<StudioEditorState> emit) {
    final i = StudioStep.values.indexOf(state.step);
    if (i > 0) emit(state.copyWith(step: StudioStep.values[i - 1]));
  }

  // ── spec ─────────────────────────────────────────────────────────────────

  void _onBase(BaseSelected e, Emitter<StudioEditorState> emit) {
    final config = state.config;
    final base = config?.base(e.code);
    if (config == null || base == null || state.readOnly) return;
    final previous = state.spec;
    final spec = SpecDefaults.specFor(config, base, previous: previous, preferredSize: _prefs.size, preferredFit: _prefs.fit);
    final carried = SpecDefaults.carryLayers(state.layers, base, config);
    final doc = DesignDoc(name: state.doc?.name ?? '', spec: spec, layers: carried.kept);
    final h = state.history;
    final next = h == null ? History(doc) : h.commit(doc);
    emit(state.copyWith(
      history: next,
      activePlacement: base.areas.firstOrNull?.placement,
      selectedLayerId: carried.kept.any((l) => l.id == state.selectedLayerId) ? state.selectedLayerId : null,
      notice: carried.dropped > 0 ? StudioNotice.layersDropped : null,
      noticeValue: carried.dropped,
    ));
  }

  void _onColor(ColorSelected e, Emitter<StudioEditorState> emit) {
    final base = state.base;
    if (base == null) return;
    _spec(emit, (s) => s.copyWith(colorId: e.colorId, size: SpecDefaults.pickSize(base, e.colorId, s.size, preferred: _prefs.size)));
  }

  void _spec(Emitter<StudioEditorState> emit, DesignSpec Function(DesignSpec s) change, {String? key}) {
    final doc = state.doc;
    if (doc == null || state.readOnly) return;
    _commit(emit, doc.copyWith(spec: change(doc.spec)), key: key);
  }

  void _commit(Emitter<StudioEditorState> emit, DesignDoc next, {String? key, String? selected, bool keepSelection = true}) {
    final h = state.history;
    if (h == null || state.readOnly) return;
    emit(state.copyWith(history: h.commit(next, key: key)));
  }

  // ── layers ───────────────────────────────────────────────────────────────

  PrintArea? _area(String placement) => state.base?.area(placement);

  void _layers(Emitter<StudioEditorState> emit, List<DesignLayer> layers, {String? key}) {
    final doc = state.doc;
    if (doc == null || state.readOnly) return;
    _commit(emit, doc.copyWith(layers: layers), key: key);
  }

  void _onAddText(TextLayerAdded e, Emitter<StudioEditorState> emit) {
    final config = state.config;
    final area = _area(state.activePlacement ?? '') ?? state.base?.areas.firstOrNull;
    if (config == null || area == null || state.readOnly) return;
    if (!state.canAddLayer) {
      emit(state.copyWith(notice: StudioNotice.maxLayers, noticeValue: config.maxLayers));
      return;
    }
    final method = LayerMath.pickPrintMethod(config.printMethods, area.widthCm * 0.45, area.heightCm * 0.2);
    final layer = LayerMath.createText(
      area: area,
      printMethodCode: method,
      zIndex: LayerMath.nextZIndex(LayerMath.layersFor(state.layers, area.placement)),
      text: e.text,
      font: config.fonts.firstOrNull,
    );
    final fixed = _fitMethod(layer, area);
    _layers(emit, [...state.layers, fixed]);
    emit(state.copyWith(selectedLayerId: fixed.id, activePlacement: area.placement));
  }

  void _onAddImage(ImageLayerAdded e, Emitter<StudioEditorState> emit) {
    final config = state.config;
    final area = _area(state.activePlacement ?? '') ?? state.base?.areas.firstOrNull;
    if (config == null || area == null || state.readOnly) return;
    if (!state.canAddLayer) {
      emit(state.copyWith(notice: StudioNotice.maxLayers, noticeValue: config.maxLayers));
      return;
    }
    final method = LayerMath.pickPrintMethod(config.printMethods, area.widthCm * 0.6, area.heightCm * 0.6);
    final layer = LayerMath.createImage(area: area, printMethodCode: method, zIndex: LayerMath.nextZIndex(LayerMath.layersFor(state.layers, area.placement)), upload: e.upload);
    final fixed = _fitMethod(layer, area);
    _layers(emit, [...state.layers, fixed]);
    emit(state.copyWith(selectedLayerId: fixed.id, activePlacement: area.placement));
  }

  /// Re-picks the print method for the layer's size and shrinks it to that method's limit.
  DesignLayer _fitMethod(DesignLayer l, PrintArea area) {
    final methods = state.config?.printMethods ?? const <StudioPrintMethod>[];
    final code = LayerMath.pickPrintMethod(methods, l.widthCm, l.heightCm, prefer: l.printMethodCode);
    final method = methods.where((m) => m.code == code).firstOrNull;
    return LayerMath.clampToArea(l.copyWith(printMethodCode: code), area, method: method);
  }

  void _onEdit(LayerEdited e, Emitter<StudioEditorState> emit) {
    final layers = state.layers;
    final i = layers.indexWhere((l) => l.id == e.id);
    if (i < 0 || state.readOnly) return;
    var next = e.edit(layers[i]);
    if (next.isText) next = LayerMath.remeasureText(next);
    if (!LayerMath.isFreeLayer(next)) {
      final area = _area(next.placement);
      if (area != null) next = _fitMethod(next, area);
    }
    _layers(emit, [...layers]..[i] = next, key: e.coalesceKey == null ? null : '${e.id}:${e.coalesceKey}');
  }

  void _onDelete(LayerDeleted e, Emitter<StudioEditorState> emit) {
    _layers(emit, state.layers.where((l) => l.id != e.id).toList());
    if (state.selectedLayerId == e.id) emit(state.copyWith(selectedLayerId: null));
  }

  void _onDuplicate(LayerDuplicated e, Emitter<StudioEditorState> emit) {
    final src = state.layers.where((l) => l.id == e.id).firstOrNull;
    if (src == null || state.readOnly) return;
    if (!state.canAddLayer) {
      emit(state.copyWith(notice: StudioNotice.maxLayers, noticeValue: state.config?.maxLayers ?? 0));
      return;
    }
    final copy = LayerMath.duplicate(src, state.layers, _area(src.placement));
    _layers(emit, [...state.layers, copy]);
    emit(state.copyWith(selectedLayerId: copy.id));
  }

  void _onZoneTapped(ZoneTapped e, Emitter<StudioEditorState> emit) {
    final area = _area(e.placement);
    final selected = state.selectedLayer;
    if (area == null) return;
    if (selected == null || LayerMath.isFreeLayer(selected) || state.readOnly) {
      emit(state.copyWith(activePlacement: e.placement));
      return;
    }
    var moved = LayerMath.placeAt(selected.copyWith(placement: e.placement, zIndex: selected.placement == e.placement ? selected.zIndex : LayerMath.nextZIndex(LayerMath.layersFor(state.layers, e.placement))), area, e.xCm, e.yCm);
    moved = _fitMethod(moved, area);
    _layers(emit, [for (final l in state.layers) l.id == moved.id ? moved : l]);
    emit(state.copyWith(activePlacement: e.placement));
  }

  void _onDragged(LayerDragged e, Emitter<StudioEditorState> emit) {
    final doc = state.doc;
    final h = state.history;
    if (doc == null || h == null || state.readOnly) return;
    final next = [for (final l in doc.layers) l.id == e.id ? l.copyWith(xCm: e.xCm, yCm: e.yCm) : l];
    emit(state.copyWith(history: h.replace(doc.copyWith(layers: next))));
  }

  void _onSurfaceDragged(SurfaceDragged e, Emitter<StudioEditorState> emit) {
    final doc = state.doc;
    final h = state.history;
    if (doc == null || h == null || state.readOnly) return;
    final next = [for (final l in doc.layers) l.id == e.id ? l.copyWith(anchor: e.anchor) : l];
    emit(state.copyWith(history: h.replace(doc.copyWith(layers: next))));
  }

  // ── undo / redo ──────────────────────────────────────────────────────────

  void _onUndo(UndoRequested e, Emitter<StudioEditorState> emit) {
    final h = state.history;
    if (h == null || !state.canUndo) return;
    _afterTimeTravel(emit, h.undo());
  }

  void _onRedo(RedoRequested e, Emitter<StudioEditorState> emit) {
    final h = state.history;
    if (h == null || !state.canRedo) return;
    _afterTimeTravel(emit, h.redo());
  }

  void _afterTimeTravel(Emitter<StudioEditorState> emit, History<DesignDoc> h) {
    final layers = h.present.layers;
    emit(state.copyWith(history: h, selectedLayerId: layers.any((l) => l.id == state.selectedLayerId) ? state.selectedLayerId : null));
  }
}
