import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/catalog_models.dart';

/// Swipeable gallery of the selected color with dots; tap opens the full-screen zoomable viewer. The first image
/// carries the Hero tag so the product card expands into it.
class ProductGallery extends StatefulWidget {
  const ProductGallery({super.key, required this.images, required this.heroTag, this.fallbackUrl, this.overlay});

  final List<String> images;
  final String heroTag;
  final String? fallbackUrl;
  final Widget? overlay;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  final _pages = PageController();
  int _index = 0;

  @override
  void didUpdateWidget(ProductGallery old) {
    super.didUpdateWidget(old);
    // a new color → back to its first image
    if (old.images.firstOrNull != widget.images.firstOrNull && _pages.hasClients) {
      _pages.jumpToPage(0);
      _index = 0;
    }
  }

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images.isEmpty ? [?widget.fallbackUrl] : widget.images;
    final c = context.hoo.colors;
    return AspectRatio(
      aspectRatio: HooSize.productImageAspect,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(color: c.surface),
          AnimatedSwitcher(
            duration: context.hoo.motion(HooDurations.medium),
            switchInCurve: HooCurves.standard,
            child: PageView.builder(
              key: ValueKey(images.firstOrNull),
              controller: _pages,
              itemCount: images.isEmpty ? 1 : images.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) {
                final img = HooNetworkImage(url: images.isEmpty ? null : images[i], cacheWidth: 900);
                return GestureDetector(
                  onTap: images.isEmpty ? null : () => _openViewer(context, images, i),
                  child: i == 0 ? Hero(tag: widget.heroTag, child: img) : img,
                );
              },
            ),
          ),
          if (images.length > 1)
            Positioned(
              bottom: HooSpacing.md,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < images.length; i++)
                    AnimatedContainer(
                      duration: context.hoo.motion(HooDurations.normal),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: i == _index ? 18 : 6,
                      height: 6,
                      decoration: BoxDecoration(color: i == _index ? c.textPrimary : c.textTertiary, borderRadius: HooRadius.pillAll),
                    ),
                ],
              ),
            ),
          ?widget.overlay,
        ],
      ),
    );
  }

  void _openViewer(BuildContext context, List<String> images, int start) {
    Navigator.of(context, rootNavigator: true).push(PageRouteBuilder<void>(
      opaque: false,
      transitionDuration: context.hoo.motion(HooDurations.normal),
      pageBuilder: (_, a, _) => FadeTransition(opacity: a, child: _FullscreenGallery(images: images, start: start)),
    ));
  }
}

class _FullscreenGallery extends StatelessWidget {
  const _FullscreenGallery({required this.images, required this.start});
  final List<String> images;
  final int start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HooPalette.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: PageController(initialPage: start),
            itemCount: images.length,
            itemBuilder: (_, i) => InteractiveViewer(minScale: 1, maxScale: 4, child: Center(child: HooNetworkImage(url: images[i], fit: BoxFit.contain))),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: HooIconButton(icon: HooIcons.close, color: HooPalette.white, semanticLabel: context.l10n.a11yClose, onPressed: () => Navigator.of(context).pop()),
            ),
          ),
        ],
      ),
    );
  }
}

/// Size guide sheet: chest / length / sleeve per size, cm ↔ in.
Future<void> showSizeGuide(BuildContext context, List<SizeChartRow> rows, {String? sizeAndFit}) {
  return showHooSheet<void>(context, title: context.l10n.catalogSizeGuide, builder: (_) => _SizeGuide(rows: rows, sizeAndFit: sizeAndFit));
}

class _SizeGuide extends StatefulWidget {
  const _SizeGuide({required this.rows, this.sizeAndFit});
  final List<SizeChartRow> rows;
  final String? sizeAndFit;

  @override
  State<_SizeGuide> createState() => _SizeGuideState();
}

class _SizeGuideState extends State<_SizeGuide> {
  bool _inches = false;

  String _n(double v) => v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    TableRow row(List<String> cells, {bool head = false}) => TableRow(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: context.hoo.colors.border))),
          children: [
            for (final c in cells)
              Padding(padding: const EdgeInsets.symmetric(vertical: HooSpacing.sm), child: Text(c, style: head ? t.labelSecondary : t.body)),
          ],
        );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.sizeAndFit != null) ...[Text(widget.sizeAndFit!, style: t.bodySecondary), const SizedBox(height: HooSpacing.md)],
        Row(children: [
          OptionChip(label: 'cm', selected: !_inches, onTap: () => setState(() => _inches = false)),
          const SizedBox(width: HooSpacing.xs),
          OptionChip(label: 'in', selected: _inches, onTap: () => setState(() => _inches = true)),
        ]),
        const SizedBox(height: HooSpacing.md),
        Table(children: [
          row([l.catalogSizeCol, l.catalogChestCol, l.catalogLengthCol, l.catalogSleeveCol], head: true),
          for (final r in widget.rows)
            row([r.size.label, _n(_inches ? r.chestIn : r.chestCm), _n(_inches ? r.lengthIn : r.lengthCm), _n(_inches ? r.sleeveIn : r.sleeveCm)]),
        ]),
        const SizedBox(height: HooSpacing.md),
        Text(l.catalogSizeGuideHint, style: t.caption),
      ],
    );
  }
}
