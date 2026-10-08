import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `studio` feature.
@RoutePage()
class StudioPage extends StatelessWidget {
  const StudioPage({super.key, @QueryParam('product') this.productSlug, @QueryParam('design') this.designId});

  /// Opened from a PDP via "Customize this" → base `p-<productId>` resolved from the slug.
  final String? productSlug;

  /// Resume/edit an existing design.
  final String? designId;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('StudioPage')));
}
