import 'dart:math' as math;

import 'package:uuid/uuid.dart';

import '../../../shared/domain/enums.dart';
import 'models/design.dart';
import 'models/studio_config.dart';

/// Pure layer geometry and stack rules — a port of the web `@hoo/studio-engine` domain (layers.ts, geometry.ts,
/// sanitize.ts). No Flutter, no I/O: the editor bloc and the tests use these directly.
abstract final class LayerRules {
  /// Backend `DesignLayerValidator`: 0.5 ≤ width/height ≤ 60 cm.
  static const minCm = 0.5;
  static const maxCm = 60.0;
  static const ptToCm = 2.54 / 72;

  /// Backend: 4 ≤ fontSizePt ≤ 400; the editor offers a calmer 8–200 range.
  static const minFontPt = 8.0;
  static const maxFontPt = 200.0;

  /// Snap distance (cm) between a layer centre and the zone centre lines.
  static const snapThresholdCm = 0.6;
  static const maxTextLength = 200;
  static const defaultTextColor = '#121212';
}

double round2(num n) => (n * 100).roundToDouble() / 100;

double _clamp(double v, double min, double max) => math.min(math.max(v, min), math.max(min, max));

String newLayerId() => const Uuid().v4();

/// Keeps a layer's (unrotated) box fully inside its print area — the backend rejects anything larger than the area.
DesignLayer clampLayerToArea(DesignLayer layer, PrintArea area) {
  final width = _clamp(layer.widthCm, LayerRules.minCm, math.min(area.widthCm, LayerRules.maxCm));
  final height = _clamp(layer.heightCm, LayerRules.minCm, math.min(area.heightCm, LayerRules.maxCm));
  final x = _clamp(layer.xCm, 0, area.widthCm - width);
  final y = _clamp(layer.yCm, 0, area.heightCm - height);
  return layer.copyWith(widthCm: round2(width), heightCm: round2(height), xCm: round2(x), yCm: round2(y));
}

/// Centres [layer] on ([cx], [cy]) of [area], first shrinking it proportionally (text scales its font) when it is
/// larger than the area — used when a layer is dropped on a tapped spot or carried to a smaller area.
DesignLayer placeLayerAt(DesignLayer layer, PrintArea area, double cx, double cy) {
  final k = math.min(1.0, math.min(area.widthCm / layer.widthCm, area.heightCm / layer.heightCm));
  final w = layer.widthCm * k, h = layer.heightCm * k;
  final font = layer.kind == LayerKind.text && layer.fontSizePt != null && k < 1 ? math.max(6.0, (layer.fontSizePt! * k).floorToDouble()) : layer.fontSizePt;
  return clampLayerToArea(layer.copyWith(fontSizePt: font, widthCm: w, heightCm: h, xCm: cx - w / 2, yCm: cy - h / 2), area);
}

/// Average advance width (em) per font — WebView fonts are not available to Flutter, so text boxes are estimated.
const _fontWidthEm = {'Bebas': 0.42, 'Archivo': 0.6, 'Space': 0.6, 'Montserrat': 0.68, 'Inter': 0.6};

/// Estimated text box (cm) for [text] at [fontSizePt], used to size new and edited text layers.
({double widthCm, double heightCm}) measureTextBox(String text, double fontSizePt, {String? font}) {
  final lines = (text.isEmpty ? ' ' : text).split('\n');
  final longest = lines.map((l) => l.runes.length).fold<int>(1, math.max);
  final em = fontSizePt * LayerRules.ptToCm;
  final advance = _fontWidthEm[font] ?? 0.62;
  return (widthCm: math.max(LayerRules.minCm, longest * em * advance), heightCm: math.max(LayerRules.minCm, lines.length * em * 1.2));
}

({double xCm, double yCm, double widthCm, double heightCm}) _centered(PrintArea area, double w, double h) =>
    (xCm: (area.widthCm - w) / 2, yCm: (area.heightCm - h) / 2, widthCm: w, heightCm: h);

DesignLayer createTextLayer({
  required String placement,
  required PrintArea area,
  required String printMethodCode,
  required int zIndex,
  String text = 'HOO',
  String? font,
  String colorHex = LayerRules.defaultTextColor,
  double? fontSizePt,
  String align = 'center',
  String? id,
}) {
  // Start at ~45% of the area width (24–110 pt), then shrink until the whole box fits comfortably.
  final longest = text.split('\n').map((l) => l.runes.length).fold<int>(1, math.max);
  var size = (fontSizePt ?? _clamp(area.widthCm * 0.45 / (longest * 0.62 * LayerRules.ptToCm), 24, 110)).roundToDouble();
  var box = measureTextBox(text, size, font: font);
  while ((box.widthCm > area.widthCm * 0.9 || box.heightCm > area.heightCm * 0.9) && size > 6) {
    size -= 2;
    box = measureTextBox(text, size, font: font);
  }
  final c = _centered(area, box.widthCm, box.heightCm);
  return clampLayerToArea(
    DesignLayer(
      id: id ?? newLayerId(),
      kind: LayerKind.text,
      placement: placement,
      zIndex: zIndex,
      printMethodCode: printMethodCode,
      widthCm: c.widthCm,
      heightCm: c.heightCm,
      xCm: c.xCm,
      yCm: c.yCm,
      text: text,
      font: font,
      fontSizePt: size,
      align: align,
      colorHex: colorHex,
    ),
    area,
  );
}

/// New image layer: ~60% of the area, aspect from the upload, and no wider than it prints sharply (when known).
DesignLayer createImageLayer({
  required String placement,
  required PrintArea area,
  required String printMethodCode,
  required int zIndex,
  required DesignUpload upload,
  String? id,
}) {
  final wPx = upload.widthPx, hPx = upload.heightPx;
  final aspect = wPx != null && hPx != null && wPx > 0 && hPx > 0 ? wPx / hPx : 1.0;
  var w = math.min(area.widthCm * 0.6, LayerRules.maxCm);
  final sharp = upload.maxPrintWidthCmAtRecommendedDpi;
  if (!upload.isVector && sharp != null && sharp >= 4) w = math.min(w, sharp.toDouble());
  var h = w / aspect;
  if (h > area.heightCm * 0.6) {
    h = area.heightCm * 0.6;
    w = h * aspect;
  }
  final c = _centered(area, w, h);
  return clampLayerToArea(
    DesignLayer(
      id: id ?? newLayerId(),
      kind: LayerKind.image,
      placement: placement,
      zIndex: zIndex,
      printMethodCode: printMethodCode,
      widthCm: c.widthCm,
      heightCm: c.heightCm,
      xCm: c.xCm,
      yCm: c.yCm,
      uploadId: upload.id,
    ),
    area,
  );
}

/// Re-measures a text layer after its text/font/size changed, keeping its centre.
DesignLayer remeasureText(DesignLayer layer, PrintArea? area) {
  if (layer.kind != LayerKind.text) return layer;
  final box = measureTextBox(layer.text ?? '', layer.fontSizePt ?? 24, font: layer.font);
  final cx = layer.xCm + layer.widthCm / 2, cy = layer.yCm + layer.heightCm / 2;
  final next = layer.copyWith(widthCm: box.widthCm, heightCm: box.heightCm, xCm: cx - box.widthCm / 2, yCm: cy - box.heightCm / 2);
  return area == null ? next : clampLayerToArea(next, area);
}

/// Uniform scale around the layer centre (images keep their aspect; text scales its font). Clamped to [area].
DesignLayer scaleLayer(DesignLayer layer, double factor, PrintArea area) {
  final maxK = math.min(math.min(area.widthCm, LayerRules.maxCm) / layer.widthCm, math.min(area.heightCm, LayerRules.maxCm) / layer.heightCm);
  final minK = math.max(LayerRules.minCm / layer.widthCm, LayerRules.minCm / layer.heightCm);
  final k = _clamp(factor, minK, math.max(minK, maxK));
  final w = layer.widthCm * k, h = layer.heightCm * k;
  final cx = layer.xCm + layer.widthCm / 2, cy = layer.yCm + layer.heightCm / 2;
  final font = layer.kind == LayerKind.text && layer.fontSizePt != null
      ? _clamp(layer.fontSizePt! * k, 4, 400)
      : layer.fontSizePt;
  return clampLayerToArea(layer.copyWith(widthCm: w, heightCm: h, xCm: cx - w / 2, yCm: cy - h / 2, fontSizePt: font == null ? null : round2(font)), area);
}

/// Normalises rotation into [-180, 180) at 0.1° precision.
double normalizeRotation(double deg) {
  final r = (((deg + 180) % 360) + 360) % 360 - 180;
  return (r * 10).roundToDouble() / 10;
}

/// Layers of a placement ordered bottom → top.
List<DesignLayer> layersForPlacement(List<DesignLayer> layers, String placement) =>
    layers.where((l) => l.placement == placement).toList()..sort((a, b) => a.zIndex.compareTo(b.zIndex));

int nextZIndex(Iterable<DesignLayer> layers) => layers.isEmpty ? 0 : layers.map((l) => l.zIndex).reduce(math.max) + 1;

/// Re-numbers the zIndex of one placement's stack to 0..n-1 following [orderedIds] (bottom → top).
List<DesignLayer> applyStackOrder(List<DesignLayer> layers, String placement, List<String> orderedIds) {
  final idx = {for (var i = 0; i < orderedIds.length; i++) orderedIds[i]: i};
  return [
    for (final l in layers) l.placement == placement && idx.containsKey(l.id) ? l.copyWith(zIndex: idx[l.id]!) : l,
  ];
}

enum StackMove { front, back, forward, backward }

List<DesignLayer> moveInStack(List<DesignLayer> layers, String id, StackMove move) {
  final target = layers.where((l) => l.id == id).firstOrNull;
  if (target == null) return layers;
  final ids = layersForPlacement(layers, target.placement).map((l) => l.id).toList();
  final i = ids.indexOf(id);
  ids.removeAt(i);
  final j = switch (move) {
    StackMove.front => ids.length,
    StackMove.back => 0,
    StackMove.forward => math.min(i + 1, ids.length),
    StackMove.backward => math.max(i - 1, 0),
  };
  ids.insert(j, id);
  return applyStackOrder(layers, target.placement, ids);
}

/// Drag-reorder: moves [id] to [toIndex] of its placement's stack (bottom → top order).
List<DesignLayer> reorderStack(List<DesignLayer> layers, String id, int toIndex) {
  final target = layers.where((l) => l.id == id).firstOrNull;
  if (target == null) return layers;
  final ids = layersForPlacement(layers, target.placement).map((l) => l.id).where((x) => x != id).toList();
  ids.insert(toIndex.clamp(0, ids.length), id);
  return applyStackOrder(layers, target.placement, ids);
}

/// Copy of [id] nudged 1 cm right/down, on top of its stack.
({List<DesignLayer> layers, String? newId}) duplicateLayer(List<DesignLayer> layers, String id, PrintArea area, {String? newId}) {
  final src = layers.where((l) => l.id == id).firstOrNull;
  if (src == null) return (layers: layers, newId: null);
  final copy = clampLayerToArea(
    src.copyWith(id: newId ?? newLayerId(), xCm: src.xCm + 1, yCm: src.yCm + 1, zIndex: nextZIndex(layers.where((l) => l.placement == src.placement))),
    area,
  );
  return (layers: [...layers, copy], newId: copy.id);
}

/// Effective DPI at the layer's print size — mirrors `StudioPriceCalculator.EffectiveDpi` (informational only; the
/// quote's `warnings` are authoritative).
int? effectiveDpi(DesignUpload upload, DesignLayer layer) {
  final w = upload.widthPx, h = upload.heightPx;
  if (w == null || h == null || w <= 0 || h <= 0 || layer.widthCm <= 0 || layer.heightCm <= 0) return null;
  return math.min(w / (layer.widthCm / 2.54), h / (layer.heightCm / 2.54)).floor();
}

class SnapResult {
  const SnapResult(this.xCm, this.yCm, {this.guideX = false, this.guideY = false});
  final double xCm;
  final double yCm;
  final bool guideX;
  final bool guideY;
}

/// Snaps the layer centre to the print-area centre lines within [thresholdCm].
SnapResult snapToCenter(DesignLayer l, PrintArea area, {double thresholdCm = LayerRules.snapThresholdCm}) {
  final cx = l.xCm + l.widthCm / 2, cy = l.yCm + l.heightCm / 2;
  final gx = (cx - area.widthCm / 2).abs() <= thresholdCm, gy = (cy - area.heightCm / 2).abs() <= thresholdCm;
  return SnapResult(gx ? area.widthCm / 2 - l.widthCm / 2 : l.xCm, gy ? area.heightCm / 2 - l.heightCm / 2 : l.yCm, guideX: gx, guideY: gy);
}

/// Moves by a delta, clamps to the area and snaps to the centre lines.
DesignLayer moveLayerBy(DesignLayer start, double dxCm, double dyCm, PrintArea area, {bool snap = true}) {
  final moved = clampLayerToArea(start.copyWith(xCm: start.xCm + dxCm, yCm: start.yCm + dyCm), area);
  if (!snap) return moved;
  final s = snapToCenter(moved, area);
  return moved.copyWith(xCm: round2(s.xCm), yCm: round2(s.yCm));
}

/// Centres the layer in its area.
DesignLayer centerLayer(DesignLayer l, PrintArea area) =>
    clampLayerToArea(l.copyWith(xCm: (area.widthCm - l.widthCm) / 2, yCm: (area.heightCm - l.heightCm) / 2), area);

// ---------------------------------------------------------------- print methods

/// Fits the method's max box (also turned by 90°) — `StudioPriceCalculator.Fits`.
bool methodFits(PrintMethod m, double w, double h) => (w <= m.maxWidthCm && h <= m.maxHeightCm) || (w <= m.maxHeightCm && h <= m.maxWidthCm);

/// The preferred method when it fits, else the first one that does, else the first method.
String pickPrintMethod(List<PrintMethod> methods, double w, double h, {String? prefer}) {
  if (prefer != null) {
    final preferred = methods.where((m) => m.code == prefer && methodFits(m, w, h)).firstOrNull;
    if (preferred != null) return preferred.code;
  }
  return methods.where((m) => methodFits(m, w, h)).firstOrNull?.code ?? (methods.isEmpty ? '' : methods.first.code);
}

/// Keeps a layer printable: switches to a method whose max size fits, or — when none does — shrinks the layer
/// (proportionally) to the largest method's limits.
DesignLayer fitPrintMethod(DesignLayer layer, List<PrintMethod> methods, PrintArea area) {
  if (methods.isEmpty) return layer;
  final current = methods.where((m) => m.code == layer.printMethodCode).firstOrNull;
  if (current != null && methodFits(current, layer.widthCm, layer.heightCm)) return layer;
  final fitting = methods.where((m) => methodFits(m, layer.widthCm, layer.heightCm)).firstOrNull;
  if (fitting != null) return layer.copyWith(printMethodCode: fitting.code);
  final largest = methods.reduce((a, b) => a.maxWidthCm * a.maxHeightCm >= b.maxWidthCm * b.maxHeightCm ? a : b);
  final k = math.min(largest.maxWidthCm / layer.widthCm, largest.maxHeightCm / layer.heightCm);
  return scaleLayer(layer.copyWith(printMethodCode: largest.code), k * 0.999, area);
}

// ---------------------------------------------------------------- payload

/// The exact layer list sent to `/studio/price` and `/studio/designs`: drops text layers without text (backend
/// `Text NotEmpty`), keeps fonts/limits inside what `DesignLayerValidator` accepts and never sends curved text.
List<DesignLayer> toApiLayers(List<DesignLayer> layers, List<String> allowedFonts) => [
      for (final l in layers)
        if (l.kind != LayerKind.text || (l.text?.trim().isNotEmpty ?? false))
          _sanitize(l, allowedFonts),
    ];

DesignLayer _sanitize(DesignLayer l, List<String> fonts) {
  var out = l.copyWith(
    widthCm: round2(_clamp(l.widthCm, LayerRules.minCm, LayerRules.maxCm)),
    heightCm: round2(_clamp(l.heightCm, LayerRules.minCm, LayerRules.maxCm)),
    xCm: round2(l.xCm),
    yCm: round2(l.yCm),
    rotation: normalizeRotation(l.rotation),
    curve: null,
  );
  if (l.kind == LayerKind.text) {
    final text = l.text ?? '';
    final hex = l.colorHex;
    out = out.copyWith(
      text: text.length > LayerRules.maxTextLength ? text.substring(0, LayerRules.maxTextLength) : text,
      font: l.font != null && fonts.contains(l.font) ? l.font : null,
      fontSizePt: l.fontSizePt == null ? null : (_clamp(l.fontSizePt!, 4, 400) * 10).roundToDouble() / 10,
      colorHex: hex != null && RegExp(r'^#[0-9a-fA-F]{6}$').hasMatch(hex) ? hex : null,
    );
  }
  return out;
}
