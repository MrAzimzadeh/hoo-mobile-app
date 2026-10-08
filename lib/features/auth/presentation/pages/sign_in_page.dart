import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Placeholder — implemented by the `auth` feature.
@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key, this.onResult});

  /// Set by the access guard: called with `true` once signed in so navigation resumes where it was.
  final void Function(bool success)? onResult;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('SignInPage')));
}
