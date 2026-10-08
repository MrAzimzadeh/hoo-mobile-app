import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `studio` feature.
@RoutePage()
class StudioSharedPage extends StatelessWidget {
  const StudioSharedPage({super.key, @PathParam('token') required this.token});

  final String token;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('StudioSharedPage')));
}
