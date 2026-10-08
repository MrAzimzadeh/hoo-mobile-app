import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/network/api_client.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/models/studio_config.dart';
import 'studio_engine_controller.dart';
import 'studio_engine_view.dart';

/// A rotatable, read-only 3D view of a catalog product model — the Studio's renderer lent to the PDP and to order
/// pages through [GarmentViewerFactory].
class StudioGarmentViewerFactory implements GarmentViewerFactory {
  StudioGarmentViewerFactory(this._api);

  final ApiClient _api;

  @override
  Widget productModel({Key? key, required String modelUrl, required double heightCm, required bool tintable, required String colorHex}) =>
      StudioGarmentViewer(key: key, api: _api, modelUrl: modelUrl, heightCm: heightCm, tintable: tintable, colorHex: colorHex);
}

class StudioGarmentViewer extends StatefulWidget {
  const StudioGarmentViewer({super.key, required this.api, required this.modelUrl, required this.heightCm, required this.tintable, required this.colorHex});

  final ApiClient api;
  final String modelUrl;
  final double heightCm;
  final bool tintable;
  final String colorHex;

  @override
  State<StudioGarmentViewer> createState() => _StudioGarmentViewerState();
}

class _StudioGarmentViewerState extends State<StudioGarmentViewer> {
  final _controller = StudioEngineController();
  EngineModel? _model;

  @override
  void initState() {
    super.initState();
    unawaited(_fetch());
  }

  Future<void> _fetch() async {
    try {
      final bytes = await widget.api.bytes(widget.modelUrl);
      if (!mounted) return;
      setState(() {
        _model = EngineModel(
          productType: ProductType.unknown,
          areas: const [],
          template: StudioTemplate(id: 'view', modelUrl: widget.modelUrl, heightCm: widget.heightCm, tintable: widget.tintable),
          glbBase64: base64Encode(bytes),
        );
      });
    } on Object {
      // the engine view shows its "preview unavailable" state when no model arrives
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StudioEngineView(controller: _controller, model: _model, colorHex: widget.colorHex);
}
