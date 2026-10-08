import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../shared/domain/models.dart';

/// Placeholder — implemented by the `profile` feature.
@RoutePage()
class AddressFormPage extends StatelessWidget {
  const AddressFormPage({super.key, this.address});

  final SavedAddress? address;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('AddressFormPage')));
}
