import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'dart:ui' show Color;

import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../shared/domain/enums.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';

/// Events the 3D engine reports (JS → Flutter, see `tool/studio_engine/src/engine.js`).
sealed class EngineEvent {
  const EngineEvent();
}

final class EngineReady extends EngineEvent {
  const EngineReady();
}

final class EngineModelLoaded extends EngineEvent {
  const EngineModelLoaded(this.zones);
  final List<String> zones;
}

final class EngineModelFailed extends EngineEvent {
  const EngineModelFailed(this.message);
  final String message;
}

final class EngineLayerSelected extends EngineEvent {
  const EngineLayerSelected(this.id);
  final String? id;
}

final class EngineGestureStart extends EngineEvent {
  const EngineGestureStart(this.id);
  final String id;
}

final class EngineGestureEnd extends EngineEvent {
  const EngineGestureEnd(this.id);
  final String id;
}

final class EngineLayerMoved extends EngineEvent {
  const EngineLayerMoved(this.id, this.xCm, this.yCm);
  final String id;
  final double xCm;
  final double yCm;
}

final class EngineSurfaceMoved extends EngineEvent {
  const EngineSurfaceMoved(this.id, this.anchor);
  final String id;
  final LayerAnchor anchor;
}

final class EnginePlaceAt extends EngineEvent {
  const EnginePlaceAt(this.placement, this.xCm, this.yCm);
  final String placement;
  final double xCm;
  final double yCm;
}

final class EngineFacing extends EngineEvent {
  const EngineFacing(this.placement);
  final String placement;
}

final class EngineError extends EngineEvent {
  const EngineError(this.message);
  final String message;
}

/// A garment the engine can draw: the GLB template (base64) or the procedural fallback.
class EngineModel {
  const EngineModel({required this.productType, this.model, required this.areas, this.template, this.glbBase64});

  final ProductType productType;
  final GarmentModel? model;
  final List<PrintArea> areas;
  final StudioTemplate? template;
  final String? glbBase64;

  Map<String, dynamic> toMessage(String colorHex) => {
        'type': 'loadModel',
        'productType': productType.wire,
        'model': model?.wire,
        'colorHex': colorHex,
        'printAreas': [for (final a in areas) a.toJson()],
        if (template != null && glbBase64 != null)
          'template': {
            'glbBase64': glbBase64,
            'heightCm': template!.heightCm,
            'tintable': template!.tintable,
            'zones': [for (final z in template!.zones) z.toJson()],
          },
      };
}

/// Drives the WebView-hosted three.js engine: queues messages until the page said "ready", parses its events and
/// answers snapshot requests. One controller per engine view.
class StudioEngineController {
  StudioEngineController({WebViewController? web}) : web = web ?? WebViewController() {
    this.web
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel('HooEngine', onMessageReceived: (m) => _onRaw(m.message));
  }

  final WebViewController web;
  final _events = StreamController<EngineEvent>.broadcast();
  final _ready = Completer<void>();
  final _snapshots = <String, Completer<Map<String, Uint8List>>>{};
  int _requestSeq = 0;
  bool _disposed = false;

  Stream<EngineEvent> get events => _events.stream;
  Future<void> get ready => _ready.future;
  bool get isReady => _ready.isCompleted;

  Future<void> load() => web.loadFlutterAsset('assets/studio/index.html');

  void _onRaw(String raw) {
    if (_disposed) return;
    final Map<String, dynamic> msg;
    try {
      msg = (jsonDecode(raw) as Map).cast<String, dynamic>();
    } on Object {
      return;
    }
    final event = parse(msg);
    if (event is EngineReady && !_ready.isCompleted) _ready.complete();
    if (msg['type'] == 'snapshot') {
      final c = _snapshots.remove(msg['requestId']?.toString());
      if (c != null) c.complete(_decodeImages(msg['images']));
      return;
    }
    if (event != null) _events.add(event);
  }

  /// Pure message → event mapping (unit-tested).
  @visibleForTesting
  static EngineEvent? parse(Map<String, dynamic> msg) {
    double n(Object? v) => (v as num?)?.toDouble() ?? 0;
    switch (msg['type']) {
      case 'ready':
        return const EngineReady();
      case 'modelLoaded':
        return EngineModelLoaded([for (final z in (msg['zones'] as List? ?? const [])) z.toString()]);
      case 'modelFailed':
        return EngineModelFailed(msg['message']?.toString() ?? '');
      case 'selectLayer':
        return EngineLayerSelected(msg['id'] as String?);
      case 'gestureStart':
        return EngineGestureStart(msg['id'] as String);
      case 'gestureEnd':
        return EngineGestureEnd(msg['id'] as String);
      case 'moveLayer':
        return EngineLayerMoved(msg['id'] as String, n(msg['xCm']), n(msg['yCm']));
      case 'moveSurface':
        return EngineSurfaceMoved(msg['id'] as String, LayerAnchor.fromJson((msg['anchor'] as Map).cast<String, dynamic>()));
      case 'placeAt':
        return EnginePlaceAt(msg['placement'] as String, n(msg['xCm']), n(msg['yCm']));
      case 'facing':
        return EngineFacing(msg['placement'] as String);
      case 'error':
        return EngineError(msg['message']?.toString() ?? '');
      default:
        return null;
    }
  }

  static Map<String, Uint8List> _decodeImages(Object? images) {
    final out = <String, Uint8List>{};
    if (images is Map) {
      for (final e in images.entries) {
        final s = e.value?.toString() ?? '';
        final comma = s.indexOf(',');
        if (comma > 0) out[e.key.toString()] = base64Decode(s.substring(comma + 1));
      }
    }
    return out;
  }

  Future<void> send(Map<String, dynamic> message) async {
    if (_disposed) return;
    await ready;
    if (_disposed) return;
    await web.runJavaScript('window.hooEngine && window.hooEngine.receive(${jsonEncode(jsonEncode(message))});');
  }

  Future<void> init({required bool reducedMotion}) => send({'type': 'init', 'reducedMotion': reducedMotion});

  Future<void> loadModel(EngineModel model, String colorHex) => send(model.toMessage(colorHex));

  Future<void> setColor(String hex, {bool animate = true}) => send({'type': 'setColor', 'hex': hex, 'animate': animate});

  Future<void> setAreas(List<PrintArea> areas) => send({'type': 'setAreas', 'printAreas': [for (final a in areas) a.toJson()]});

  /// [images] maps `uploadId` → data URL (or CORS-enabled URL).
  Future<void> setImages(Map<String, String> images) => send({'type': 'setImages', 'images': images});

  Future<void> setLayers(List<DesignLayer> layers, {String? selectedId}) =>
      send({'type': 'setLayers', 'layers': [for (final l in layers) l.toJson()], 'selectedId': selectedId});

  Future<void> select(String? id) => send({'type': 'select', 'id': id});

  Future<void> setActive(String? placement, {bool focus = true, bool showGuides = true}) =>
      send({'type': 'setActive', 'placement': placement, 'focus': focus, 'showGuides': showGuides});

  Future<void> focus(String placement) => send({'type': 'focus', 'placement': placement});

  Future<void> setEditable(bool editable) => send({'type': 'setEditable', 'editable': editable});

  Future<void> resetView() => send({'type': 'resetView'});

  /// PNG snapshots keyed by view (`front`, `back`).
  Future<Map<String, Uint8List>> snapshot({List<String> views = const ['front', 'back'], int size = 1024}) async {
    final id = 'snap-${++_requestSeq}';
    final completer = _snapshots[id] = Completer<Map<String, Uint8List>>();
    await send({'type': 'snapshot', 'requestId': id, 'views': views, 'size': size, 'mime': 'image/png'});
    return completer.future.timeout(const Duration(seconds: 20), onTimeout: () {
      _snapshots.remove(id);
      return const {};
    });
  }

  void dispose() {
    _disposed = true;
    for (final c in _snapshots.values) {
      if (!c.isCompleted) c.complete(const {});
    }
    _snapshots.clear();
    _events.close();
  }
}
