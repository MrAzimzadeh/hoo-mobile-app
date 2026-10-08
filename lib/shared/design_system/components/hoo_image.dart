import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';
import 'hoo_icons.dart';

/// Resolves backend-relative media paths (`/media/…`) to absolute URLs. Set once by the composition root.
abstract final class HooMedia {
  static String Function(String) resolve = (s) => s;
}

/// Cached network image on a surface.muted placeholder; fades in, never shows a broken-image glyph.
/// Pass [cacheWidth] for grid thumbnails so decoding stays cheap.
class HooNetworkImage extends StatelessWidget {
  const HooNetworkImage({super.key, required this.url, this.fit = BoxFit.cover, this.cacheWidth, this.borderRadius, this.semanticLabel, this.alignment = Alignment.center});

  final String? url;
  final BoxFit fit;
  final int? cacheWidth;
  final BorderRadius? borderRadius;
  final String? semanticLabel;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final placeholder = ColoredBox(color: c.surface);
    final src = url;
    Widget child;
    if (src == null || src.isEmpty) {
      child = ColoredBox(color: c.surface, child: Center(child: Icon(HooIcons.image, color: c.textTertiary)));
    } else if (src.startsWith('asset:')) {
      child = Image.asset(src.substring(6), fit: fit, alignment: alignment, cacheWidth: cacheWidth);
    } else {
      final dpr = MediaQuery.devicePixelRatioOf(context);
      child = CachedNetworkImage(
        imageUrl: HooMedia.resolve(src),
        fit: fit,
        alignment: alignment,
        memCacheWidth: cacheWidth == null ? null : (cacheWidth! * dpr).round(),
        fadeInDuration: context.hoo.motion(HooDurations.normal),
        fadeInCurve: HooCurves.standard,
        placeholder: (_, _) => placeholder,
        errorWidget: (_, _, _) => ColoredBox(color: c.surface, child: Center(child: Icon(HooIcons.image, color: c.textTertiary))),
      );
    }
    if (semanticLabel != null) child = Semantics(image: true, label: semanticLabel, child: child);
    return borderRadius == null ? child : ClipRRect(borderRadius: borderRadius!, child: child);
  }
}
