import 'dart:math' as math;

import 'layer_ops.dart';
import 'models/design.dart';
import 'models/studio_config.dart';

/// Free placement on uploaded 3D models (port of web `free.ts`): a layer can sit anywhere on the model, not only
/// inside the admin's zones. It gets its own print "zone" — code `free-xxxx`, the size of the layer itself — pinned
/// to a point of the model surface ([LayerAnchor]). Mirrors the backend (`Placement.FreePrefix`, `LayerAnchor`).
abstract final class FreePlacement {
  static const prefix = 'free-';

  /// Active placement meaning "free mode": the next text/image goes to the picked spot on the model.
  static const mode = 'free';

  /// Box used to size a brand-new free layer.
  static const newArea = PrintArea(placement: mode, widthCm: 28, heightCm: 28);
}

bool isFreeCode(String? code) => code != null && (code == FreePlacement.mode || code.startsWith(FreePlacement.prefix));

bool isFreeLayer(DesignLayer l) => l.anchor != null && l.placement.startsWith(FreePlacement.prefix);

/// New unique code (`free-` + 6 base-36 chars; the backend allows up to 40 chars).
String newFreeCode(Iterable<String> taken, {math.Random? random}) {
  final r = random ?? math.Random();
  const chars = '0123456789abcdefghijklmnopqrstuvwxyz';
  final used = taken.toSet();
  while (true) {
    final code = '${FreePlacement.prefix}${List.generate(6, (_) => chars[r.nextInt(chars.length)]).join()}';
    if (!used.contains(code)) return code;
  }
}

/// A free layer's print area: exactly its own box.
PrintArea freeArea(DesignLayer l) => PrintArea(placement: l.placement, widthCm: l.widthCm, heightCm: l.heightCm);

/// Keeps a free layer valid: at the zone origin, size within the print limits.
DesignLayer normalizeFree(DesignLayer l) => l.copyWith(
      xCm: 0,
      yCm: 0,
      widthCm: round2(l.widthCm.clamp(LayerRules.minCm, LayerRules.maxCm)),
      heightCm: round2(l.heightCm.clamp(LayerRules.minCm, LayerRules.maxCm)),
    );

/// Turns a layer into a free one pinned at [at] (keeps its size; text keeps its font).
DesignLayer toFreeLayer(DesignLayer l, LayerAnchor at, Iterable<String> taken) {
  final code = isFreeLayer(l) ? l.placement : newFreeCode(taken);
  return normalizeFree(l.copyWith(placement: code, anchor: at, zIndex: 0));
}

/// 1-based number of a free spot ("Free spot 2"), stable by layer order.
int freeIndex(List<DesignLayer> layers, String code) {
  final codes = <String>[];
  for (final l in layers) {
    if (l.placement.startsWith(FreePlacement.prefix) && !codes.contains(l.placement)) codes.add(l.placement);
  }
  return codes.indexOf(code) + 1;
}
