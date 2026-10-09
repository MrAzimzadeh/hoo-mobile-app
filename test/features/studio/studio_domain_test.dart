import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/features/studio/domain/history.dart';
import 'package:hoo/features/studio/domain/layer_ops.dart';
import 'package:hoo/features/studio/domain/models/design.dart';
import 'package:hoo/features/studio/domain/models/studio_config.dart';
import 'package:hoo/shared/domain/enums.dart';

void main() {
  const area = PrintArea(placement: 'Front', widthCm: 30, heightCm: 40);

  DesignLayer layer({double x = 0, double y = 0, double w = 10, double h = 10}) =>
      DesignLayer(id: 'l1', kind: LayerKind.text, placement: 'Front', printMethodCode: 'DTF', widthCm: w, heightCm: h, xCm: x, yCm: y, text: 'HOO');

  test('layers are clamped inside their print area', () {
    final l = clampLayerToArea(layer(x: 28, y: -5, w: 80, h: 10), area);
    expect(l.widthCm, lessThanOrEqualTo(30));
    expect(l.xCm + l.widthCm, lessThanOrEqualTo(30));
    expect(l.yCm, 0);
  });

  test('text layers fit the area and use the given font size range', () {
    final t = createTextLayer(placement: 'Front', area: area, printMethodCode: 'DTF', zIndex: 0, text: 'HELLO BAKU');
    expect(t.widthCm, lessThanOrEqualTo(area.widthCm));
    expect(t.fontSizePt, greaterThan(0));
  });

  test('snap to centre within threshold', () {
    final moved = moveLayerBy(layer(), 9.7, 0, area);
    expect(moved.xCm + moved.widthCm / 2, closeTo(15, 0.01));
  });

  test('history: commit, coalesce, undo, redo', () {
    final t0 = DateTime(2026);
    var h = History<int>(0).commit(1, key: 'a', at: t0).commit(2, key: 'a', at: t0.add(const Duration(milliseconds: 100)));
    expect(h.past.length, 1, reason: 'same key inside the window coalesces');
    h = h.undo();
    expect(h.present, 0);
    h = h.redo();
    expect(h.present, 2);
  });

  test('stack order: move to front', () {
    final a = layer().copyWith(id: 'a', zIndex: 0), b = layer().copyWith(id: 'b', zIndex: 1);
    final out = moveInStack([a, b], 'a', StackMove.front);
    expect(out.firstWhere((l) => l.id == 'a').zIndex, greaterThan(out.firstWhere((l) => l.id == 'b').zIndex));
  });
}
