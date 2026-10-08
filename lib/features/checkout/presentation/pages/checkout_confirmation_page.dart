import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `checkout` feature.
@RoutePage()
class CheckoutConfirmationPage extends StatelessWidget {
  const CheckoutConfirmationPage({super.key, @PathParam('number') required this.number, this.giftReceiptCode});

  final String number;
  final String? giftReceiptCode;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('CheckoutConfirmationPage')));
}
