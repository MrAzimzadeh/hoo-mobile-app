import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import 'studio_engine_controller.dart';

/// The 3D garment: a transparent WebView on top of the page background, kept in sync with the editor state.
/// Everything the engine draws comes from props; everything it reports goes out through [onEvent].
class StudioEngineView extends StatefulWidget {
  const StudioEngineView({
    super.key,
    required this.controller,
    required this.model,
    required this.colorHex,
    this.layers = const [],
    this.images = const {},
    this.selectedId,
    this.activePlacement,
    this.editable = false,
    this.onEvent,
  });

  final StudioEngineController controller;

  /// Null while the GLB is still being fetched.
  final EngineModel? model;
  final String colorHex;
  final List<DesignLayer> layers;

  /// `uploadId` → data URL.
  final Map<String, String> images;
  final String? selectedId;
  final String? activePlacement;
  final bool editable;
  final ValueChanged<EngineEvent>? onEvent;

  @override
  State<StudioEngineView> createState() => _StudioEngineViewState();
}

class _StudioEngineViewState extends State<StudioEngineView> {
  StreamSubscription<EngineEvent>? _sub;
  bool _loadFailed = false;
  bool _modelReady = false;

  @override
  void initState() {
    super.initState();
    _sub = widget.controller.events.listen((e) {
      if (e is EngineModelLoaded && mounted) {
        setState(() => _modelReady = true);
        unawaited(_syncAll());
      }
      if (e is EngineModelFailed && mounted) setState(() => _loadFailed = true);
      widget.onEvent?.call(e);
    });
    widget.controller.load().catchError((Object _) {
      if (mounted) setState(() => _loadFailed = true);
    });
    if (widget.model != null) unawaited(_loadModel());
  }

  Future<void> _loadModel() async {
    final c = widget.controller;
    await c.init(reducedMotion: context.hoo.reducedMotion);
    _modelReady = false;
    await c.loadModel(widget.model!, widget.colorHex);
  }

  Future<void> _syncAll() async {
    final c = widget.controller;
    await c.setEditable(widget.editable);
    if (widget.images.isNotEmpty) await c.setImages(widget.images);
    await c.setLayers(widget.layers, selectedId: widget.selectedId);
    await c.setActive(widget.activePlacement, focus: false);
  }

  @override
  void didUpdateWidget(StudioEngineView old) {
    super.didUpdateWidget(old);
    final c = widget.controller;
    if (widget.model != old.model && widget.model != null) {
      unawaited(_loadModel());
      return;
    }
    if (!_modelReady) return;
    if (widget.colorHex != old.colorHex) unawaited(c.setColor(widget.colorHex));
    if (widget.editable != old.editable) unawaited(c.setEditable(widget.editable));
    if (!identical(widget.images, old.images) && !mapEquals(widget.images, old.images)) unawaited(c.setImages(widget.images));
    if (!listEquals(widget.layers, old.layers) || widget.selectedId != old.selectedId) unawaited(c.setLayers(widget.layers, selectedId: widget.selectedId));
    if (widget.activePlacement != old.activePlacement) unawaited(c.setActive(widget.activePlacement));
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.hoo.colors;
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: colors.surface),
        if (!_loadFailed)
          WebViewWidget(
            controller: widget.controller.web,
            gestureRecognizers: {Factory<OneSequenceGestureRecognizer>(EagerGestureRecognizer.new)},
          ),
        if (!_modelReady && !_loadFailed) const Center(child: HooLoading()),
        if (_loadFailed)
          HooEmptyState(title: context.l10n.studioPreviewUnavailable, message: context.l10n.studioPreviewUnavailableHint, icon: HooIcons.studio, compact: true),
      ],
    );
  }
}
