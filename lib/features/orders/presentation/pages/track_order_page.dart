import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `orders` feature.
@RoutePage()
class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key, @QueryParam('number') this.number});

  final String? number;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('TrackOrderPage')));
}
