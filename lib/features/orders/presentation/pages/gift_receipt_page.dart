import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `orders` feature.
@RoutePage()
class GiftReceiptPage extends StatelessWidget {
  const GiftReceiptPage({super.key, @PathParam('code') this.code});

  final String? code;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('GiftReceiptPage')));
}
