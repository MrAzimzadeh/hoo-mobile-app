import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/catalog_models.dart';

/// PDP hero: swipeable photos for the selected color with page dots, tap-to-zoom and, when the product has a 3D
/// model and the Studio renderer is registered, a "3D" toggle.
class ProductGallery extends StatefulWidget {
  const ProductGallery({super.key, required this.images, required this.heroTag, required this.product, required this.colorHex, this.previewUrl});

  final List<String> images;
  final String heroTag;
  final String? previewUrl;
  final ProductDetail? product;
  final String? colorHex;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  final _controller = PageController();
  int _page = 0;
  bool _show3d = false;

  @override
  void didUpdateWidget(ProductGallery old) {
    super.didUpdateWidget(old);
    if (old.images != widget.images && _controller.hasClients) {
      _page = 0;
      _controller.jumpToPage(0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _can3d => widget.product?.model3D != null && widget.colorHex != null && sl.isRegistered<GarmentViewerFactory>();

  void _zoom(BuildContext context, int index) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder<void>(
        opaque: false,
        barrierColor: context.hoo.colors.background,
        transitionDuration: context.hoo.motion(HooDurations.normal),
        pageBuilder: (_, a, _) => FadeTransition(
          opacity: a,
          child: _ZoomPage(images: widget.images, initial: index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final images = widget.images.isNotEmpty ? widget.images : [if (widget.previewUrl != null) widget.previewUrl!];
    final model = widget.product?.model3D;
    return AspectRatio(
      aspectRatio: HooSize.productImageAspect,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (_show3d && _can3d && model != null)
            ColoredBox(
              color: c.surface,
              child: sl<GarmentViewerFactory>().productModel(
                key: ValueKey(widget.colorHex),
                modelUrl: model.modelUrl,
                heightCm: model.heightCm,
                tintable: model.tintable,
                colorHex: widget.colorHex!,
              ),
            )
          else if (images.isEmpty)
            const HooNetworkImage(url: null)
          else
            PageView.builder(
              controller: _controller,
              itemCount: images.length,
              onPageChanged: (i) => setState(() => _page = i),
              itemBuilder: (context, i) {
                final image = GestureDetector(
                  onTap: widget.images.isEmpty ? null : () => _zoom(context, i),
                  child: HooNetworkImage(url: images[i], cacheWidth: 1200, semanticLabel: widget.product?.name),
                );
                return i == 0 ? Hero(tag: widget.heroTag, child: image) : image;
              },
            ),
          if (!_show3d && images.length > 1)
            Positioned(
              left: 0,
              right: 0,
              bottom: HooSpacing.md,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < images.length; i++)
                    AnimatedContainer(
                      duration: context.hoo.motion(HooDurations.fast),
                      margin: const EdgeInsets.symmetric(horizontal: HooSpacing.xxs),
                      width: i == _page ? HooSpacing.md : HooSpacing.xs,
                      height: HooSpacing.xs,
                      decoration: BoxDecoration(color: i == _page ? c.textPrimary : c.textTertiary, borderRadius: HooRadius.pillAll),
                    ),
                ],
              ),
            ),
          if (_can3d)
            Positioned(
              right: HooSpacing.md,
              bottom: HooSpacing.md,
              child: OptionChip(
                label: _show3d ? context.l10n.catalogGalleryPhotos : context.l10n.catalogGallery3d,
                selected: _show3d,
                minWidth: 0,
                onTap: () => setState(() => _show3d = !_show3d),
              ),
            ),
        ],
      ),
    );
  }
}

class _ZoomPage extends StatefulWidget {
  const _ZoomPage({required this.images, required this.initial});
  final List<String> images;
  final int initial;

  @override
  State<_ZoomPage> createState() => _ZoomPageState();
}

class _ZoomPageState extends State<_ZoomPage> {
  late final _controller = PageController(initialPage: widget.initial);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.hoo.colors.background,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.images.length,
              itemBuilder: (_, i) => InteractiveViewer(
                maxScale: 4,
                child: HooNetworkImage(url: widget.images[i], fit: BoxFit.contain),
              ),
            ),
            Positioned(
              top: HooSpacing.xs,
              right: HooSpacing.xs,
              child: HooIconButton(icon: HooIcons.close, semanticLabel: context.l10n.a11yClose, onPressed: () => Navigator.of(context).pop()),
            ),
          ],
        ),
      ),
    );
  }
}
