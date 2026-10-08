import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `catalog` feature.
@RoutePage()
class WriteReviewPage extends StatelessWidget {
  const WriteReviewPage({super.key, @PathParam('slug') required this.slug, this.productName});

  final String slug;
  final String? productName;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('WriteReviewPage')));
}
