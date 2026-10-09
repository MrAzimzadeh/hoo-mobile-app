import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app/router/app_router.dart';
import '../../../core/error/api_exception.dart';
import '../../../core/session/session_store.dart';
import '../../../l10n/l10n.dart';
import '../../../shared/application/contracts.dart';
import '../../../shared/design_system/design_system.dart';
import '../../../shared/domain/models.dart';
import '../domain/auth_models.dart';
import '../domain/auth_repository.dart';

/// The signed-in user for the whole app ([AuthGate]). Pages call [signedIn] after a successful auth call; everything
/// else (bag, wishlist, profile) listens to [userChanges].
class AuthSession implements AuthGate {
  AuthSession(this._repo, this._session) {
    _session.events.where((e) => e == SessionEvent.unauthorized).listen((_) => _set(null));
  }

  final AuthRepository _repo;
  final SessionStore _session;
  final _changes = StreamController<Me?>.broadcast();
  Me? _user;

  @override
  Me? get currentUser => _user;

  @override
  bool get isSignedIn => _user != null && _session.hasSession;

  @override
  Stream<Me?> get userChanges => _changes.stream;

  /// Called by auth pages once a sign-in/up succeeded (the repository already stored the token).
  void signedIn(AuthResult result) => _set(result.user);

  @override
  Future<void> refreshUser() async {
    if (!_session.hasSession) {
      _set(null);
      return;
    }
    try {
      _set(await _repo.me());
    } on ApiException catch (e) {
      if (e.isUnauthorized) {
        await _session.clearToken();
        _set(null);
      }
      // offline: keep whatever we had
    }
  }

  @override
  Future<void> signOut({bool allDevices = false}) async {
    try {
      await _repo.logout(allDevices: allDevices);
    } catch (_) {
      // the token is cleared locally either way
    }
    _set(null);
  }

  @override
  Future<bool> requireSignIn(BuildContext context, {String? reason}) async {
    if (isSignedIn) return true;
    final router = context.router;
    final completer = Completer<bool>();
    void done(bool ok) {
      if (!completer.isCompleted) completer.complete(ok && isSignedIn);
    }

    final choice = await showHooSheet<_GateChoice>(
      context,
      title: context.l10n.authGateTitle,
      builder: (ctx) => _GateSheet(reason: reason),
    );
    switch (choice) {
      case _GateChoice.signIn:
        unawaited(router.push(SignInRoute(onResult: done)));
      case _GateChoice.signUp:
        unawaited(router.push(SignUpRoute(onResult: done)));
      case _GateChoice.phone:
        unawaited(router.push(OtpRoute(onResult: done)));
      case null:
        done(false);
    }
    return completer.future;
  }

  void _set(Me? user) {
    if (_user == user) return;
    _user = user;
    _changes.add(user);
  }
}

enum _GateChoice { signIn, signUp, phone }

class _GateSheet extends StatelessWidget {
  const _GateSheet({this.reason});
  final String? reason;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(reason ?? l.authGateBody, style: context.hoo.text.bodySecondary),
        const SizedBox(height: HooSpacing.lg),
        PrimaryButton(label: l.commonSignIn, onPressed: () => Navigator.of(context).pop(_GateChoice.signIn)),
        const SizedBox(height: HooSpacing.sm),
        SecondaryButton(label: l.commonCreateAccount, onPressed: () => Navigator.of(context).pop(_GateChoice.signUp)),
        const SizedBox(height: HooSpacing.xs),
        Center(child: HooTextButton(label: l.authSignInWithSms, onPressed: () => Navigator.of(context).pop(_GateChoice.phone))),
      ],
    );
  }
}
