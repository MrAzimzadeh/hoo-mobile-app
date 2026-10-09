import 'package:equatable/equatable.dart';

import '../../../shared/domain/enums.dart';
import '../../../shared/domain/models.dart';
import 'free_layers.dart';
import 'models/design.dart';
import 'models/studio_config.dart';

/// The document the editor edits and autosave persists: name + spec + layers.
class DesignDoc extends Equatable {
  const DesignDoc({this.name = '', required this.spec, this.layers = const []});

  final String name;
  final DesignSpec spec;
  final List<DesignLayer> layers;

  DesignDoc copyWith({String? name, DesignSpec? spec, List<DesignLayer>? layers}) =>
      DesignDoc(name: name ?? this.name, spec: spec ?? this.spec, layers: layers ?? this.layers);

  bool get hasImages => layers.any((l) => l.kind == LayerKind.image);

  @override
  List<Object?> get props => [name, spec, layers];
}

/// Colour × size orderability. Plain studio bases have no variants → every combination can be ordered; ready
/// catalog products carry per-variant availability (port of web `base-variants.ts`).
bool variantAvailable(StudioBase base, String colorId, Size? size) {
  final variants = base.variants;
  if (variants == null) return true;
  return variants.any((v) => v.colorId == colorId && v.size == size && v.available);
}

/// Can the colour be picked at all (at least one orderable size)?
bool colorAvailable(StudioBase base, String colorId) {
  final variants = base.variants;
  if (variants == null) return true;
  return variants.any((v) => v.colorId == colorId && v.available);
}

List<ColorInfo> availableColors(StudioBase base) => base.colors.where((c) => colorAvailable(base, c.id)).toList();

/// Best size for a colour: keeps [current] when orderable, then [preferred] (style profile), then M, then the first.
Size? pickSize(StudioBase base, String colorId, Size? current, {Size? preferred}) {
  final sizes = base.sizes.where((s) => s != Size.unknown && variantAvailable(base, colorId, s)).toList();
  if (current != null && sizes.contains(current)) return current;
  if (preferred != null && sizes.contains(preferred)) return preferred;
  if (sizes.contains(Size.m)) return Size.m;
  return sizes.firstOrNull ?? current;
}

/// Defaults for a freshly picked base: included fabric, Oversized (or the preferred/first fit), first orderable
/// colour, style-profile size.
DesignSpec defaultSpec(StudioBase base, StudioConfig config, {Size? preferredSize, Fit? preferredFit}) {
  final fabrics = config.fabricsFor(base);
  final fabric = fabrics.where((f) => f.included).firstOrNull ?? fabrics.firstOrNull;
  final colorId = (availableColors(base).firstOrNull ?? base.colors.firstOrNull)?.id ?? '';
  final fits = base.fits.where((f) => f != Fit.unknown).toList();
  final fit = preferredFit != null && fits.contains(preferredFit)
      ? preferredFit
      : fits.contains(Fit.oversized)
          ? Fit.oversized
          : (fits.firstOrNull ?? Fit.regular);
  return DesignSpec(
    baseCode: base.code,
    fit: fit,
    fabricCode: fabric?.code ?? base.fabricCodes.firstOrNull ?? '',
    colorId: colorId,
    size: pickSize(base, colorId, null, preferred: preferredSize),
  );
}

/// Switching base keeps every choice the new base still offers (fit, fabric, features, colour, size, quantity).
DesignSpec rebaseSpec(DesignSpec spec, StudioBase base, StudioConfig config, {Size? preferredSize}) {
  final d = defaultSpec(base, config, preferredSize: preferredSize ?? spec.size, preferredFit: spec.fit);
  final fabricOk = base.fabricCodes.contains(spec.fabricCode) && config.fabric(spec.fabricCode) != null;
  final colorId = base.colors.any((c) => c.id == spec.colorId) && colorAvailable(base, spec.colorId) ? spec.colorId : d.colorId;
  final measurements = base.isCatalog ? null : spec.customMeasurements;
  final quantity = base.maxQuantity != null && spec.quantity > base.maxQuantity! ? base.maxQuantity! : spec.quantity;
  return d.copyWith(
    fabricCode: fabricOk ? spec.fabricCode : d.fabricCode,
    featureCodes: spec.featureCodes.where(base.featureCodes.contains).toList(),
    colorId: colorId,
    size: measurements != null ? null : pickSize(base, colorId, spec.size, preferred: preferredSize),
    customMeasurements: measurements,
    quantity: quantity < 1 ? 1 : quantity,
    rush: spec.rush,
  );
}

/// Layers that survive a base change: zone layers whose zone exists on the new base (clamped later), and free
/// layers when the new base is another uploaded 3D model.
List<DesignLayer> layersForBase(List<DesignLayer> layers, StudioBase base) =>
    layers.where((l) => isFreeLayer(l) ? base.allowsFreePlacement : base.area(l.placement) != null).toList();

/// Upper quantity bound: per-product cap or the backend's 500.
int maxQuantityFor(StudioBase? base) {
  const systemMax = 500;
  final cap = base?.maxQuantity;
  return cap == null || cap > systemMax ? systemMax : (cap < 1 ? 1 : cap);
}

/// The step a design needs before it can be quoted: a size or custom measurements.
bool specHasSize(DesignSpec spec) => spec.size != null || spec.customMeasurements != null;
