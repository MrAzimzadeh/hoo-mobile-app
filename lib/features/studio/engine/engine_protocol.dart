import 'dart:async';
import 'dart:convert';

import '../domain/models/design.dart';
import '../domain/models/studio_config.dart';

/// Events the three.js engine (assets/studio/engine.js) reports.
sealed class EngineEvent {
  const EngineEvent();

  static EngineEvent? decode(String raw) {
    final m = jsonDecode(raw) as Map<String, dynamic>;
    String? s(String k) => m[k] as String?;
    double d(String k) => (m[k] as num?)?.toDouble() ?? 0;
    return switch (m['type']) {
      'ready' => const EngineReady(),
      'modelLoaded' => const EngineModelLoaded(),
      'modelFailed' => EngineModelFailed(s('message')),
      'selectLayer' => EngineSelectLayer(s('id')),
      'gestureStart' => EngineGestureStart(s('id') ?? ''),
      'moveLayer' => EngineMoveLayer(s('id') ?? '', d('xCm'), d('yCm')),
      'moveSurface' => EngineMoveSurface(s('id') ?? '', LayerAnchor.fromJson((m['anchor'] as Map).cast<String, dynamic>())),
      'gestureEnd' => EngineGestureEnd(s('id') ?? ''),
      'placeAt' => EnginePlaceAt(s('placement') ?? '', d('xCm'), d('yCm')),
      'placeSurface' => EnginePlaceSurface(LayerAnchor.fromJson((m['at'] as Map).cast<String, dynamic>())),
      'facing' => EngineFacing(s('placement') ?? ''),
      'snapshot' => EngineSnapshot(s('requestId') ?? '', (m['images'] as Map? ?? const {}).map((k, v) => MapEntry(k.toString(), v.toString()))),
      'error' => EngineError(s('message') ?? ''),
      _ => null,
    };
  }
}

class EngineReady extends EngineEvent {
  const EngineReady();
}

class EngineModelLoaded extends EngineEvent {
  const EngineModelLoaded();
}

class EngineModelFailed extends EngineEvent {
  const EngineModelFailed(this.message);
  final String? message;
}

class EngineSelectLayer extends EngineEvent {
  const EngineSelectLayer(this.id);
  final String? id;
}

class EngineGestureStart extends EngineEvent {
  const EngineGestureStart(this.id);
  final String id;
}

class EngineMoveLayer extends EngineEvent {
  const EngineMoveLayer(this.id, this.xCm, this.yCm);
  final String id;
  final double xCm;
  final double yCm;
}

class EngineMoveSurface extends EngineEvent {
  const EngineMoveSurface(this.id, this.anchor);
  final String id;
  final LayerAnchor anchor;
}

class EngineGestureEnd extends EngineEvent {
  const EngineGestureEnd(this.id);
  final String id;
}

class EnginePlaceAt extends EngineEvent {
  const EnginePlaceAt(this.placement, this.xCm, this.yCm);
  final String placement;
  final double xCm;
  final double yCm;
}

class EnginePlaceSurface extends EngineEvent {
  const EnginePlaceSurface(this.at);
  final LayerAnchor at;
}

class EngineFacing extends EngineEvent {
  const EngineFacing(this.placement);
  final String placement;
}

class EngineSnapshot extends EngineEvent {
  const EngineSnapshot(this.requestId, this.images);
  final String requestId;

  /// view (`front`, `back`) → data URL.
  final Map<String, String> images;
}

class EngineError extends EngineEvent {
  const EngineError(this.message);
  final String message;
}

/// Wire to the engine. The WebView implements it in production; tests use an in-memory fake.
abstract interface class EngineTransport {
  Future<void> send(String json);
  Stream<String> get incoming;
}

/// Typed commands for the renderer. Flutter state is the source of truth: the engine only draws what it is told
/// and reports gestures; it never prices, saves or decides anything.
class StudioEngineController {
  StudioEngineController(this._transport) {
    _sub = _transport.incoming.listen((raw) {
      final e = EngineEvent.decode(raw);
      if (e == null) return;
      if (e is EngineReady) {
        _ready = true;
        _flush();
      }
      if (e is EngineSnapshot) _snapshots.remove(e.requestId)?.complete(e.images);
      _events.add(e);
    });
  }

  final EngineTransport _transport;
  late final StreamSubscription<String> _sub;
  final _events = StreamController<EngineEvent>.broadcast();
  final _pending = <String>[];
  final _snapshots = <String, Completer<Map<String, String>>>{};
  bool _ready = false;
  int _seq = 0;

  Stream<EngineEvent> get events => _events.stream;
  bool get ready => _ready;

  Future<void> _send(Map<String, Object?> msg) async {
    final json = jsonEncode(msg);
    if (!_ready) {
      // keep only the latest message of each type until the engine boots
      _pending.removeWhere((p) => (jsonDecode(p) as Map)['type'] == msg['type']);
      _pending.add(json);
      return;
    }
    await _transport.send(json);
  }

  void _flush() {
    final queued = [..._pending];
    _pending.clear();
    for (final m in queued) {
      _transport.send(m);
    }
  }

  Future<void> init({required String background, required bool reducedMotion}) => _send({'type': 'init', 'background': background, 'reducedMotion': reducedMotion});

  /// Procedural garment from [base] or an uploaded GLB ([glbBase64]).
  Future<void> loadModel({required StudioBase base, required String colorHex, String? glbBase64, List<PrintArea>? areas}) => _send({
        'type': 'loadModel',
        'productType': base.productType.wire,
        'model': base.model?.wire,
        'colorHex': colorHex,
        'printAreas': [for (final a in areas ?? base.printAreas) a.toJson()],
        if (glbBase64 != null && base.template != null)
          'template': {
            'glbBase64': glbBase64,
            'heightCm': base.template!.heightCm,
            'tintable': base.template!.tintable,
            'zones': [for (final z in base.template!.zones) z.toJson()],
          },
      });

  /// A read-only product model (PDP): no print areas.
  Future<void> loadProductModel({required String glbBase64, required double heightCm, required bool tintable, required String colorHex}) => _send({
        'type': 'loadModel',
        'productType': '',
        'colorHex': colorHex,
        'printAreas': const <Object>[],
        'template': {'glbBase64': glbBase64, 'heightCm': heightCm, 'tintable': tintable, 'zones': const <Object>[]},
      });

  Future<void> setColor(String hex, {bool animate = true}) => _send({'type': 'setColor', 'hex': hex, 'animate': animate});

  Future<void> setLayers(List<DesignLayer> layers, {Set<String> hidden = const {}, Map<String, String> images = const {}, String? selectedId}) => _send({
        'type': 'setLayers',
        'layers': [
          for (final l in layers) {...l.toJson(), if (hidden.contains(l.id)) 'hidden': true},
        ],
        'images': images,
        'selectedId': selectedId,
      });

  Future<void> select(String? id) => _send({'type': 'select', 'id': id});
  Future<void> setActive(String placement, {bool focus = false, bool showGuides = true}) => _send({'type': 'setActive', 'placement': placement, 'focus': focus, 'showGuides': showGuides});
  Future<void> setEditable(bool editable) => _send({'type': 'setEditable', 'editable': editable});
  Future<void> resetView() => _send({'type': 'resetView'});

  /// PNG data URLs of the requested views (mockups for the bag and the review step).
  Future<Map<String, String>> snapshot({List<String> views = const ['front', 'back'], int size = 1024}) {
    final id = 's${++_seq}';
    final c = Completer<Map<String, String>>();
    _snapshots[id] = c;
    _send({'type': 'snapshot', 'requestId': id, 'views': views, 'size': size, 'mime': 'image/png'});
    return c.future.timeout(const Duration(seconds: 15), onTimeout: () {
      _snapshots.remove(id);
      return const {};
    });
  }

  Future<void> dispose() async {
    await _sub.cancel();
    await _events.close();
  }
}

/// Lets panels reach the live engine (mockup snapshots) without owning it.
class EngineRef {
  StudioEngineController? controller;
}
