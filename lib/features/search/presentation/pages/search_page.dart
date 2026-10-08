import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `search` feature.
@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key, @QueryParam('q') this.query});

  final String? query;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('SearchPage')));
}
