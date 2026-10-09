import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../shared/design_system/design_system.dart';
import 'engine_protocol.dart';

/// [EngineTransport] over a WebView JavaScript channel.
class WebViewEngineTransport implements EngineTransport {
  WebViewEngineTransport(this.web);

  final WebViewController web;
  final _incoming = StreamController<String>.broadcast();

  void receive(String message) => _incoming.add(message);

  @override
  Stream<String> get incoming => _incoming.stream;

  @override
  Future<void> send(String json) => web.runJavaScript('window.hooEngine && window.hooEngine.receive(${_jsString(json)});');

  static String _jsString(String s) => "'${s.replaceAll(r'\', r'\\').replaceAll("'", r"\'").replaceAll('\n', r'\n').replaceAll(' ', r' ').replaceAll(' ', r' ')}'";
}

/// Hosts the three.js renderer (assets/studio/index.html). Create once and keep it alive across Studio steps so the
/// garment persists; [onCreated] hands out the typed controller.
class StudioEngineView extends StatefulWidget {
  const StudioEngineView({super.key, required this.onCreated, this.background});

  final void Function(StudioEngineController controller) onCreated;
  final Color? background;

  @override
  State<StudioEngineView> createState() => _StudioEngineViewState();
}

class _StudioEngineViewState extends State<StudioEngineView> {
  late final WebViewController _web;
  late final WebViewEngineTransport _transport;
  late final StudioEngineController _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _web = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..addJavaScriptChannel('HooEngine', onMessageReceived: (m) => _transport.receive(m.message));
    _transport = WebViewEngineTransport(_web);
    _controller = StudioEngineController(_transport);
    _controller.events.listen((e) {
      if (e is EngineModelLoaded && mounted && !_visible) setState(() => _visible = true);
      if (e is EngineError && kDebugMode) debugPrint('[studio-engine] ${e.message}');
    });
    _web.loadFlutterAsset('assets/studio/index.html');
    widget.onCreated(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: widget.background ?? context.hoo.colors.surface),
        AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: context.hoo.motion(HooDurations.slow),
          curve: HooCurves.standard,
          child: WebViewWidget(
            controller: _web,
            // the 3D stage owns its gestures (orbit, pinch, layer drag) even inside scroll views
            gestureRecognizers: const {Factory<EagerGestureRecognizer>(EagerGestureRecognizer.new)},
          ),
        ),
        if (!_visible) const Center(child: HooLoading()),
      ],
    );
  }
}
