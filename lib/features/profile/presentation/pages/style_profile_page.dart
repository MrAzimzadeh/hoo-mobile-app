import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `profile` feature.
@RoutePage()
class StyleProfilePage extends StatelessWidget {
  const StyleProfilePage({super.key, this.onboarding = false});

  /// Shown right after sign-up (skippable).
  final bool onboarding;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('StyleProfilePage')));
}
