import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `auth` feature.
@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key, @QueryParam('identifier') this.identifier, @QueryParam('token') this.token});

  final String? identifier;
  final String? token;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('ResetPasswordPage')));
}
