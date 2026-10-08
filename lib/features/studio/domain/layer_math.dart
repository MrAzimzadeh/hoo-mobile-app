import 'dart:math' as math;

import 'package:uuid/uuid.dart';

import '../../../shared/domain/enums.dart';
import 'models/design.dart';
import 'models/studio_config.dart';
import 'models/studio_responses.dart';

/// Pure layer geometry, ported from the web `@hoo/studio-engine/domain` (layers.ts, geometry.ts, sanitize.ts,
/// free.ts). Everything is in centimetres relative to the top-left of the layer's print area. No Flutter, no I/O.
abstract final class LayerMath {
  static const minLayerCm = 0.5;
  static const maxLayerCm = 60.0;
  static const ptToCm = 2.54 / 72;
  static const snapThresholdCm = 0.6;
  static const freePrefix = 'free-';
  static const minFontPt = 6.0;
  static const maxFontPt = 400.0;
  static const maxTextLength = 200;

  /// Text colors offered by the editor (same palette as the web studio). Garment/print hexes are data, not tokens.
  static const textColors = ['#121212', '#FFFFFF', '#1C3829', '#D14242', '#E0A100', '#2F5FD0', '#EDE6D6', '#8F8F8A'];

  static double round2(double n) => (n * 100).roundToDouble() / 100;
  static double _clamp(double v, double min, double max) => math.min(math.max(v, min), math.max(min, max));

  static String newLayerId() => const Uuid().v4();

  static bool isFreeCode(String? code) => code != null && code.startsWith(freePrefix);
  static bool isFreeLayer(DesignLayer l) => l.anchor != null && isFreeCode(l.placement);

  // ---------------------------------------------------------------- print methods

  /// Does a w×h print fit the method's max size (either orientation)?
  static bool methodFits(StudioPrintMethod m, double w, double h) => (w <= m.maxWidthCm && h <= m.maxHeightCm) || (w <= m.maxHeightCm && h <= m.maxWidthCm);

  /// The preferred method when it fits, else the first that fits, else the first configured one.
  static String pickPrintMethod(List<StudioPrintMethod> methods, double w, double h, {String? prefer}) {
    final preferred = methods.where((m) => m.code == prefer && methodFits(m, w, h)).firstOrNull;
    return preferred?.code ?? methods.where((m) => methodFits(m, w, h)).firstOrNull?.code ?? methods.firstOrNull?.code ?? '';
  }

  /// Largest scale factor (≤ 1) that makes a w×h box fit the method, in whichever orientation needs less shrinking.
  static double methodScale(StudioPrintMethod m, double w, double h) {
    if (w <= 0 || h <= 0) return 1;
    final upright = math.min(1.0, math.min(m.maxWidthCm / w, m.maxHeightCm / h));
    final turned = math.min(1.0, math.min(m.maxHeightCm / w, m.maxWidthCm / h));
    return math.max(upright, turned);
  }

  // ---------------------------------------------------------------- clamping

  /// Keeps a layer's unrotated box inside its print area (the backend rejects anything larger) and, when [method]
  /// is given, within that print method's max size (shrinking proportionally; text scales its font with it).
  static DesignLayer clampToArea(DesignLayer layer, PrintArea area, {StudioPrintMethod? method}) {
    var l = layer;
    if (method != null) {
      final k = methodScale(method, l.widthCm, l.heightCm);
      if (k < 1) l = _scaleBox(l, k);
    }
    final width = _clamp(l.widthCm, minLayerCm, math.min(area.widthCm, maxLayerCm));
    final height = _clamp(l.heightCm, minLayerCm, math.min(area.heightCm, maxLayerCm));
    final x = _clamp(l.xCm, 0, area.widthCm - width);
    final y = _clamp(l.yCm, 0, area.heightCm - height);
    return l.copyWith(widthCm: round2(width), heightCm: round2(height), xCm: round2(x), yCm: round2(y));
  }

  static DesignLayer _scaleBox(DesignLayer l, double k) {
    final w = l.widthCm * k, h = l.heightCm * k;
    final cx = l.xCm + l.widthCm / 2, cy = l.yCm + l.heightCm / 2;
    return l.copyWith(
      widthCm: w,
      heightCm: h,
      xCm: cx - w / 2,
      yCm: cy - h / 2,
      fontSizePt: l.isText && l.fontSizePt != null ? math.max(minFontPt, (l.fontSizePt! * k * 10).floorToDouble() / 10) : l.fontSizePt,
    );
  }

  /// Free layers are their own zone: only the print limits apply, positioned at the zone origin.
  static DesignLayer normalizeFree(DesignLayer l) {
    final w = _clamp(l.widthCm, minLayerCm, maxLayerCm), h = _clamp(l.heightCm, minLayerCm, maxLayerCm);
    return l.copyWith(xCm: 0, yCm: 0, widthCm: round2(w), heightCm: round2(h));
  }

  /// Centres [layer] on (cx, cy) of [area], shrinking it first when it is larger than the area (text scales its font).
  static DesignLayer placeAt(DesignLayer layer, PrintArea area, double cx, double cy, {StudioPrintMethod? method}) {
    final k = math.min(1.0, math.min(area.widthCm / layer.widthCm, area.heightCm / layer.heightCm));
    final w = layer.widthCm * k, h = layer.heightCm * k;
    final font = layer.isText && layer.fontSizePt != null && k < 1 ? math.max(minFontPt, (layer.fontSizePt! * k).floorToDouble()) : layer.fontSizePt;
    return clampToArea(layer.copyWith(fontSizePt: font, widthCm: w, heightCm: h, xCm: cx - w / 2, yCm: cy - h / 2), area, method: method);
  }

  // ---------------------------------------------------------------- creation

  /// Estimated text box (cm) for a string at a font size — sizes new/edited text layers.
  static ({double widthCm, double heightCm}) measureTextBoxCm(String text, double fontSizePt) {
    final lines = (text.isEmpty ? ' ' : text).split('\n');
    final longest = math.max(1, lines.map((l) => l.length).fold<int>(0, math.max));
    final em = fontSizePt * ptToCm;
    return (widthCm: math.max(minLayerCm, longest * em * 0.62), heightCm: math.max(minLayerCm, lines.length * em * 1.2));
  }

  static DesignLayer createText({
    required PrintArea area,
    required String printMethodCode,
    required int zIndex,
    String text = 'HOO',
    String? font,
    String colorHex = '#121212',
    double? fontSizePt,
    String? id,
  }) {
    // Start at ~45% of the area width (24–110pt), then shrink until the whole box fits.
    final longest = math.max(1, text.split('\n').map((l) => l.length).fold<int>(0, math.max));
    var size = (fontSizePt ?? _clamp((area.widthCm * 0.45) / (longest * 0.62 * ptToCm), 24, 110)).roundToDouble();
    var box = measureTextBoxCm(text, size);
    while ((box.widthCm > area.widthCm * 0.9 || box.heightCm > area.heightCm * 0.9) && size > minFontPt) {
      size -= 2;
      box = measureTextBoxCm(text, size);
    }
    return clampToArea(
      DesignLayer(
        id: id ?? newLayerId(),
        kind: LayerKind.text,
        placement: area.placement,
        zIndex: zIndex,
        printMethodCode: printMethodCode,
        widthCm: box.widthCm,
        heightCm: box.heightCm,
        xCm: (area.widthCm - box.widthCm) / 2,
        yCm: (area.heightCm - box.heightCm) / 2,
        text: text,
        font: font,
        fontSizePt: size,
        align: 'center',
        colorHex: colorHex,
      ),
      area,
    );
  }

  static DesignLayer createImage({required PrintArea area, required String printMethodCode, required int zIndex, required DesignUpload upload, String? id}) {
    final aspect = (upload.widthPx ?? 0) > 0 && (upload.heightPx ?? 0) > 0 ? upload.widthPx! / upload.heightPx! : 1.0;
    var w = math.min(area.widthCm * 0.6, maxLayerCm);
    var h = w / aspect;
    if (h > area.heightCm * 0.6) {
      h = area.heightCm * 0.6;
      w = h * aspect;
    }
    return clampToArea(
      DesignLayer(
        id: id ?? newLayerId(),
        kind: LayerKind.image,
        placement: area.placement,
        zIndex: zIndex,
        printMethodCode: printMethodCode,
        widthCm: w,
        heightCm: h,
        xCm: (area.widthCm - w) / 2,
        yCm: (area.heightCm - h) / 2,
        uploadId: upload.id,
      ),
      area,
    );
  }

  // ---------------------------------------------------------------- edits

  /// Re-measures a text layer after its text or font size changed, keeping its centre.
  static DesignLayer remeasureText(DesignLayer l) {
    if (!l.isText) return l;
    final box = measureTextBoxCm(l.text ?? '', l.fontSizePt ?? 24);
    final cx = l.xCm + l.widthCm / 2, cy = l.yCm + l.heightCm / 2;
    return l.copyWith(widthCm: box.widthCm, heightCm: box.heightCm, xCm: cx - box.widthCm / 2, yCm: cy - box.heightCm / 2);
  }

  /// Uniform scale around the centre (pinch / size slider). Text scales its font; images keep their aspect.
  static DesignLayer scaleAroundCenter(DesignLayer l, double k) {
    if (k <= 0) return l;
    final scaled = _scaleBox(l, k);
    if (l.isText && l.fontSizePt != null) {
      return remeasureText(scaled.copyWith(fontSizePt: _clamp(l.fontSizePt! * k, minFontPt, maxFontPt)));
    }
    return scaled;
  }

  static double normalizeRotation(double deg) => (((deg + 180) % 360 + 360) % 360 * 10).roundToDouble() / 10 - 180;

  /// Snaps rotation to 0/±90/180 within 3° (gesture end), mirroring the web editor.
  static double snapRotation(double deg) {
    final d = normalizeRotation(deg);
    for (final s in const [0.0, 90.0, -90.0, 180.0, -180.0]) {
      if ((d - s).abs() < 3) return s;
    }
    return d;
  }

  /// Snaps the layer centre to the area centre lines within [threshold].
  static ({double xCm, double yCm, bool guideX, bool guideY}) snapToCenter(DesignLayer l, PrintArea area, {double threshold = snapThresholdCm}) {
    final cx = l.xCm + l.widthCm / 2, cy = l.yCm + l.heightCm / 2;
    final gx = (cx - area.widthCm / 2).abs() <= threshold, gy = (cy - area.heightCm / 2).abs() <= threshold;
    return (xCm: gx ? area.widthCm / 2 - l.widthCm / 2 : l.xCm, yCm: gy ? area.heightCm / 2 - l.heightCm / 2 : l.yCm, guideX: gx, guideY: gy);
  }

  /// Moves by (dx, dy) cm, clamped to the area and snapped to its centre lines.
  static DesignLayer move(DesignLayer start, double dxCm, double dyCm, PrintArea area, {bool snap = true}) {
    final moved = clampToArea(start.copyWith(xCm: start.xCm + dxCm, yCm: start.yCm + dyCm), area);
    if (!snap) return moved;
    final s = snapToCenter(moved, area);
    return moved.copyWith(xCm: round2(s.xCm), yCm: round2(s.yCm));
  }

  /// Centres the layer in its area (the "snap to center" action).
  static DesignLayer center(DesignLayer l, PrintArea area) =>
      clampToArea(l.copyWith(xCm: (area.widthCm - l.widthCm) / 2, yCm: (area.heightCm - l.heightCm) / 2), area);

  // ---------------------------------------------------------------- stacks

  static List<DesignLayer> layersFor(List<DesignLayer> layers, String placement) => layers.where((l) => l.placement == placement).toList()..sort((a, b) => a.zIndex.compareTo(b.zIndex));

  static int nextZIndex(Iterable<DesignLayer> layers) => layers.isEmpty ? 0 : layers.map((l) => l.zIndex).reduce(math.max) + 1;

  /// Re-numbers one placement's stack to 0..n-1 following [orderedIds] (bottom → top).
  static List<DesignLayer> applyStackOrder(List<DesignLayer> layers, String placement, List<String> orderedIds) {
    final idx = {for (var i = 0; i < orderedIds.length; i++) orderedIds[i]: i};
    return [for (final l in layers) l.placement == placement && idx.containsKey(l.id) ? l.copyWith(zIndex: idx[l.id]!) : l];
  }

  /// Moves [id] to [toIndex] within its placement's stack (bottom → top order).
  static List<DesignLayer> reorder(List<DesignLayer> layers, String id, int toIndex) {
    final target = layers.where((l) => l.id == id).firstOrNull;
    if (target == null) return layers;
    final ids = layersFor(layers, target.placement).map((l) => l.id).where((x) => x != id).toList();
    ids.insert(toIndex.clamp(0, ids.length), id);
    return applyStackOrder(layers, target.placement, ids);
  }

  /// Copy offset by 1 cm, on top of its stack. Free layers get a spot a little below the original.
  static DesignLayer duplicate(DesignLayer src, List<DesignLayer> layers, PrintArea? area, {String? id}) {
    final newId = id ?? newLayerId();
    if (isFreeLayer(src)) {
      final p = src.anchor!.position;
      final taken = layers.map((l) => l.placement).toSet();
      return normalizeFree(src.copyWith(
        id: newId,
        placement: newFreeCode(taken),
        anchor: src.anchor!.copyWith(position: p.copyWith(y: round2(p.y - math.max(2, src.heightCm * 0.6)))),
      ));
    }
    final copy = src.copyWith(id: newId, xCm: src.xCm + 1, yCm: src.yCm + 1, zIndex: nextZIndex(layers.where((l) => l.placement == src.placement)));
    return area == null ? copy : clampToArea(copy, area);
  }

  static String newFreeCode(Set<String> taken) {
    final r = math.Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    while (true) {
      final code = '$freePrefix${List.generate(6, (_) => chars[r.nextInt(chars.length)]).join()}';
      if (!taken.contains(code)) return code;
    }
  }

  // ---------------------------------------------------------------- quality

  /// Effective DPI at the layer's print size (mirrors `StudioPriceCalculator.EffectiveDpi`). The server's quote is
  /// authoritative for warnings; this only previews while a re-quote is in flight.
  static int? effectiveDpi(DesignUpload upload, DesignLayer layer) {
    final w = upload.widthPx, h = upload.heightPx;
    if (w == null || h == null || w <= 0 || h <= 0 || layer.widthCm <= 0 || layer.heightCm <= 0) return null;
    return math.min(w / (layer.widthCm / 2.54), h / (layer.heightCm / 2.54)).floor();
  }

  // ---------------------------------------------------------------- wire payload

  /// The exact layer list sent to /studio/price and /studio/designs: drops empty text layers, keeps fonts/limits
  /// within what `DesignLayerValidator` accepts.
  static List<DesignLayer> toApiLayers(List<DesignLayer> layers, List<String> allowedFonts) => [
        for (final l in layers)
          if (!l.isText || (l.text?.trim().isNotEmpty ?? false)) _sanitize(l, allowedFonts),
      ];

  static final _hex = RegExp(r'^#[0-9a-fA-F]{6}$');

  static DesignLayer _sanitize(DesignLayer l, List<String> fonts) {
    var out = l.copyWith(
      widthCm: round2(_clamp(l.widthCm, minLayerCm, maxLayerCm)),
      heightCm: round2(_clamp(l.heightCm, minLayerCm, maxLayerCm)),
      xCm: round2(l.xCm),
      yCm: round2(l.yCm),
      rotation: normalizeRotation(l.rotation),
    );
    if (l.isText) {
      final text = l.text ?? '';
      out = out.copyWith(
        text: text.length > maxTextLength ? text.substring(0, maxTextLength) : text,
        font: l.font != null && fonts.contains(l.font) ? l.font : null,
        fontSizePt: l.fontSizePt == null ? null : (_clamp(l.fontSizePt!, 4, maxFontPt) * 10).roundToDouble() / 10,
        colorHex: l.colorHex != null && _hex.hasMatch(l.colorHex!) ? l.colorHex : null,
      );
    }
    return out;
  }
}
