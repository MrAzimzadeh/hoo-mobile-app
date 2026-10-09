import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../data/studio_repository.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import '../../engine/engine_protocol.dart';
import '../../engine/studio_engine_view.dart';
import 'studio_page.dart';

/// Read-only 3D view of a shared design (`/studio/shared/{token}`).
@RoutePage()
class StudioSharedPage extends StatefulWidget {
  const StudioSharedPage({super.key, @PathParam('token') required this.token});

  final String token;

  @override
  State<StudioSharedPage> createState() => _StudioSharedPageState();
}

class _StudioSharedPageState extends State<StudioSharedPage> {
  StudioDesign? _design;
  StudioConfig? _config;
  Object? _error;
  StudioEngineController? _engine;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = sl<StudioRepository>();
    try {
      final results = await Future.wait<Object>([repo.shared(widget.token), repo.config()]);
      setState(() {
        _design = results[0] as StudioDesign;
        _config = results[1] as StudioConfig;
      });
      unawaited(_render());
    } on ApiException catch (e) {
      setState(() => _error = e);
    }
  }

  Future<void> _render() async {
    final c = _engine, d = _design, base = _config?.base(_design?.spec.baseCode);
    if (c == null || d == null || base == null) return;
    String? glb;
    if (base.template != null) {
      try {
        glb = base64Encode(await sl<StudioRepository>().modelBytes(base.template!.modelUrl));
      } catch (_) {}
    }
    await c.setEditable(false);
    await c.loadModel(base: base, colorHex: base.color(d.spec.colorId)?.hex ?? '#121212', glbBase64: glb);
    await c.setLayers(d.layers, images: {for (final u in d.uploads) u.id: sl<StudioRepository>().absolute(u.url)});
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final d = _design;
    final base = _config?.base(d?.spec.baseCode);
    return Scaffold(
      appBar: HooAppBar(title: d == null || d.name.isEmpty ? l.studioSharedTitle : d.name),
      body: _error != null
          ? HooErrorState(error: _error!, onRetry: _load)
          : Column(children: [
              Expanded(
                child: StudioEngineView(onCreated: (c) {
                  _engine = c;
                  c.init(background: '#00000000', reducedMotion: MediaQuery.maybeDisableAnimationsOf(context) ?? false);
                  unawaited(_render());
                }),
              ),
              if (d != null)
                Padding(
                  padding: const EdgeInsets.all(HooSpacing.screen),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Text([base?.name, d.spec.fit.label(l), sizeLabel(l, d.spec), base?.color(d.spec.colorId)?.name].whereType<String>().join(' · '), style: context.hoo.text.bodySecondary),
                    if (d.quote != null) Text(HooFormat.money(context, d.quote!.total), style: context.hoo.text.h2),
                    const SizedBox(height: HooSpacing.md),
                    PrimaryButton.accent(label: l.studioDesignYourOwn, onPressed: () => context.router.push(StudioRoute())),
                  ]),
                ),
            ]),
    );
  }
}
