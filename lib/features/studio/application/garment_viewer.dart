import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../shared/application/contracts.dart';
import '../data/studio_repository.dart';
import '../engine/engine_protocol.dart';
import '../engine/studio_engine_view.dart';

/// [GarmentViewerFactory]: the Studio renderer as a read-only product model viewer (PDP "3D").
class StudioGarmentViewerFactory implements GarmentViewerFactory {
  StudioGarmentViewerFactory(this._repo);
  final StudioRepository _repo;

  @override
  Widget productModel({Key? key, required String modelUrl, required double heightCm, required bool tintable, required String colorHex}) =>
      _ProductModelView(key: key, repo: _repo, modelUrl: modelUrl, heightCm: heightCm, tintable: tintable, colorHex: colorHex);
}

class _ProductModelView extends StatefulWidget {
  const _ProductModelView({super.key, required this.repo, required this.modelUrl, required this.heightCm, required this.tintable, required this.colorHex});

  final StudioRepository repo;
  final String modelUrl;
  final double heightCm;
  final bool tintable;
  final String colorHex;

  @override
  State<_ProductModelView> createState() => _ProductModelViewState();
}

class _ProductModelViewState extends State<_ProductModelView> {
  StudioEngineController? _engine;

  Future<void> _load(StudioEngineController c) async {
    _engine = c;
    await c.init(background: '#00000000', reducedMotion: MediaQuery.maybeDisableAnimationsOf(context) ?? false);
    await c.setEditable(false);
    try {
      final bytes = await widget.repo.modelBytes(widget.modelUrl);
      await c.loadProductModel(glbBase64: base64Encode(bytes), heightCm: widget.heightCm, tintable: widget.tintable, colorHex: widget.colorHex);
    } catch (_) {
      // the gallery stays usable without the model
    }
  }

  @override
  void didUpdateWidget(_ProductModelView old) {
    super.didUpdateWidget(old);
    if (old.colorHex != widget.colorHex) _engine?.setColor(widget.colorHex);
  }

  @override
  Widget build(BuildContext context) => StudioEngineView(onCreated: _load);
}
