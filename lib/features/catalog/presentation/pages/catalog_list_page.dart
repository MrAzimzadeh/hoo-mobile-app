import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `catalog` feature.
@RoutePage()
class CatalogListPage extends StatelessWidget {
  const CatalogListPage({super.key, @QueryParam('category') this.category, @QueryParam('collection') this.collection, @QueryParam('chip') this.chip, @QueryParam('title') this.title});

  final String? category;
  final String? collection;
  final String? chip;
  final String? title;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('CatalogListPage')));
}
