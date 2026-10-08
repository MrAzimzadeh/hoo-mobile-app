import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `orders` feature.
@RoutePage()
class ReturnRequestPage extends StatelessWidget {
  const ReturnRequestPage({super.key, @PathParam('number') required this.number, this.phone});

  final String number;
  final String? phone;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('ReturnRequestPage')));
}
