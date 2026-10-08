import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../../../app/router/app_router.dart';
import '../../../core/session/session_store.dart';
import '../../../shared/application/contracts.dart';
import '../../../shared/domain/models.dart';
import '../domain/auth_repository.dart';
import '../presentation/widgets/sign_in_sheet.dart';

/// [AuthGate] over [AuthRepository]: signed-in state for the rest of the app, the "Sign in to continue" sheet, and
/// the reaction to a 401 (the interceptor already dropped the token — the local user must follow).
class AuthGateImpl implements AuthGate {
  AuthGateImpl(this._repository, SessionStore session) {
    unawaited(_repository.restore());
    _sub = session.events.listen((e) {
      if (e == SessionEvent.unauthorized) unawaited(_repository.clearLocal());
    });
  }

  final AuthRepository _repository;
  late final StreamSubscription<SessionEvent> _sub;

  @override
  Me? get currentUser => _repository.currentUser;

  @override
  bool get isSignedIn => _repository.currentUser != null;

  @override
  Stream<Me?> get userChanges => _repository.userChanges;

  @override
  Future<bool> requireSignIn(BuildContext context, {String? reason}) async {
    if (isSignedIn) return true;
    final router = context.router.root;
    final choice = await showSignInSheet(context, reason: reason);
    if (choice == null) return false;
    final done = Completer<bool>();
    void finish(bool ok) {
      if (done.isCompleted) return;
      // remove every auth page that was pushed for this sign-in
      router.popUntil((route) => !_authRoutes.contains(route.settings.name));
      done.complete(ok);
    }

    final future = switch (choice) {
      SignInChoice.signIn => router.push<Object?>(SignInRoute(onResult: finish)),
      SignInChoice.signUp => router.push<Object?>(SignUpRoute(onResult: finish)),
    };
    unawaited(future.whenComplete(() => finish(isSignedIn)));
    return done.future;
  }

  static final _authRoutes = {SignInRoute.name, SignUpRoute.name, OtpRoute.name, ForgotPasswordRoute.name, ResetPasswordRoute.name};

  @override
  Future<void> signOut({bool allDevices = false}) => _repository.logout(allDevices: allDevices);

  @override
  Future<void> refreshUser() async {
    try {
      await _repository.refreshSession();
    } on Object {
      // keep the cached user; the next refresh retries
    }
  }

  Future<void> dispose() => _sub.cancel();
}
