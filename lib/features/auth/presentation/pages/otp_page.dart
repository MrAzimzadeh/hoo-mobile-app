import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../shared/domain/enums.dart';

/// Placeholder — implemented by the `auth` feature.
@RoutePage()
class OtpPage extends StatelessWidget {
  const OtpPage({super.key, this.phone, this.purpose = OtpPurpose.login, this.onResult});

  final String? phone;
  final OtpPurpose purpose;
  final void Function(bool success)? onResult;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('OtpPage')));
}
