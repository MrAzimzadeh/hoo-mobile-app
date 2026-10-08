import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'layer_math.dart';
import 'models/design.dart';
import 'models/studio_config.dart';

/// Default selections and availability rules for a base (port of web `base-variants.ts` + store defaults).
abstract final class SpecDefaults {
  /// Ready catalog products carry color × size stock; plain studio bases → every combination is orderable.
  static bool variantAvailable(StudioBase base, String colorId, Size? size) {
    final v = base.variants;
    if (v == null) return true;
    return v.any((x) => x.colorId == colorId && x.size == size && x.available);
  }

  /// Can this color be ordered in at least one size?
  static bool colorAvailable(StudioBase base, String colorId) {
    final v = base.variants;
    if (v == null) return true;
    return v.any((x) => x.colorId == colorId && x.available);
  }

  static List<ColorInfo> availableColors(StudioBase base) => base.colors.where((c) => colorAvailable(base, c.id)).toList();

  /// Keeps [current] when orderable, else [preferred] (style profile), else M, else the first orderable size.
  static Size? pickSize(StudioBase base, String colorId, Size? current, {Size? preferred}) {
    final sizes = base.sizes.where((s) => variantAvailable(base, colorId, s)).toList();
    if (current != null && sizes.contains(current)) return current;
    if (preferred != null && sizes.contains(preferred)) return preferred;
    if (sizes.contains(Size.m)) return Size.m;
    return sizes.firstOrNull ?? current;
  }

  /// Fabric that is included in the base price, else the first offered.
  static String pickFabric(StudioConfig config, StudioBase base, String? current) {
    if (current != null && base.fabricCodes.contains(current)) return current;
    final offered = base.fabricCodes;
    return offered.where((c) => config.fabric(c)?.included ?? false).firstOrNull ?? offered.firstOrNull ?? config.fabrics.firstOrNull?.code ?? '';
  }

  static Fit pickFit(StudioBase base, Fit? current, {Fit? preferred}) {
    if (current != null && base.fits.contains(current)) return current;
    if (preferred != null && base.fits.contains(preferred)) return preferred;
    return base.fits.firstOrNull ?? current ?? Fit.regular;
  }

  /// A full spec for [base], carrying over whatever of [previous] still applies.
  static DesignSpec specFor(StudioConfig config, StudioBase base, {DesignSpec? previous, Size? preferredSize, Fit? preferredFit}) {
    final colors = availableColors(base);
    final colorId = colors.any((c) => c.id == previous?.colorId) ? previous!.colorId : (colors.firstOrNull ?? base.colors.firstOrNull)?.id ?? '';
    final maxQ = base.maxQuantity;
    final quantity = (previous?.quantity ?? 1).clamp(1, maxQ ?? 999);
    return DesignSpec(
      baseCode: base.code,
      fit: pickFit(base, previous?.fit, preferred: preferredFit),
      featureCodes: (previous?.featureCodes ?? const <String>[]).where(base.featureCodes.contains).toList(),
      fabricCode: pickFabric(config, base, previous?.fabricCode),
      colorId: colorId,
      size: pickSize(base, colorId, previous?.size, preferred: preferredSize),
      customMeasurements: previous?.customMeasurements,
      quantity: quantity,
      rush: previous?.rush ?? false,
    );
  }

  /// Carries layers over to another base: layers on a placement the new base has are re-clamped, the rest dropped.
  static ({List<DesignLayer> kept, int dropped}) carryLayers(List<DesignLayer> layers, StudioBase base, StudioConfig config) {
    final kept = <DesignLayer>[];
    var dropped = 0;
    for (final l in layers) {
      if (LayerMath.isFreeLayer(l)) {
        if (base.template != null) {
          kept.add(l);
        } else {
          dropped++;
        }
        continue;
      }
      final area = base.area(l.placement);
      if (area == null) {
        dropped++;
        continue;
      }
      kept.add(LayerMath.clampToArea(l, area, method: config.printMethod(l.printMethodCode)));
    }
    return (kept: kept, dropped: dropped);
  }
}
