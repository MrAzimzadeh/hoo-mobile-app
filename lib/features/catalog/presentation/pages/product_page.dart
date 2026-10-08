import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../shared/domain/models.dart';

/// Placeholder — implemented by the `catalog` feature.
@RoutePage()
class ProductPage extends StatelessWidget {
  const ProductPage({super.key, @PathParam('slug') required this.slug, this.preview, this.heroTagPrefix = 'product'});

  final String slug;

  /// Card data for an instant first frame while the detail loads.
  final ProductCard? preview;
  final String heroTagPrefix;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('ProductPage')));
}
