import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `orders` feature.
@RoutePage()
class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key, @PathParam('number') required this.number, this.phone});

  final String number;

  /// Set for guest tracking (number + phone); null → the signed-in customer's order.
  final String? phone;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('OrderDetailPage')));
}
