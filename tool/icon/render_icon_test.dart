// Renders the app icon master (1024×1024) from the brand tokens: white `HOo` wordmark (Inter Bold, −2%) on
// brand.black. Run `flutter test tool/icon/render_icon_test.dart`, then `tool/icon/make_icons.sh`.
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _loadInter() async {
  final loader = FontLoader('Inter')..addFont(Future.value(ByteData.sublistView(File('assets/fonts/Inter-Bold.ttf').readAsBytesSync())));
  await loader.load();
}

void main() {
  testWidgets('render icon', (tester) async {
    await _loadInter();
    final key = GlobalKey();
    for (final (name, bg, scale) in [('icon_master', const Color(0xFF121212), 0.30), ('icon_foreground', const Color(0x00000000), 0.20)]) {
      tester.view.physicalSize = const Size(1024, 1024);
      tester.view.devicePixelRatio = 1;
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: RepaintBoundary(
            key: key,
            child: Container(
              color: bg,
              alignment: Alignment.center,
              child: Text(
                'HOo',
                style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 1024 * scale, letterSpacing: 1024 * scale * -0.02, color: Colors.white, height: 1),
              ),
            ),
          ),
        ),
      );
      final boundary = key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      final bytes = await tester.runAsync(() async {
        final image = await boundary.toImage();
        return (await image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
      });
      File('tool/icon/$name.png').writeAsBytesSync(bytes!);
    }
    tester.view.reset();
  });
}
