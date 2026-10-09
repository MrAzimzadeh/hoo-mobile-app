import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/config/env.dart';

/// Thrown when a provider isn't configured for this build (no client id) or the user cancelled.
class SocialSignInUnavailable implements Exception {
  const SocialSignInUnavailable({this.cancelled = false});
  final bool cancelled;
}

/// Obtains provider tokens; the backend verifies them (`/auth/google`, `/auth/apple`).
class SocialSignIn {
  SocialSignIn(this._env);

  final Env _env;
  bool _googleReady = false;

  bool get appleAvailable => defaultTargetPlatform == TargetPlatform.iOS;

  Future<String> googleIdToken() async {
    final serverId = _env.googleServerClientId;
    if (serverId == null) throw const SocialSignInUnavailable();
    final google = GoogleSignIn.instance;
    if (!_googleReady) {
      await google.initialize(clientId: _env.googleIosClientId, serverClientId: serverId);
      _googleReady = true;
    }
    if (!google.supportsAuthenticate()) throw const SocialSignInUnavailable();
    try {
      final account = await google.authenticate();
      final token = account.authentication.idToken;
      if (token == null) throw const SocialSignInUnavailable();
      return token;
    } on GoogleSignInException catch (e) {
      throw SocialSignInUnavailable(cancelled: e.code == GoogleSignInExceptionCode.canceled);
    }
  }

  /// Apple only returns the name on the very first sign-in, so it is forwarded to the backend.
  Future<({String identityToken, String? fullName})> appleCredential() async {
    try {
      final c = await SignInWithApple.getAppleIDCredential(scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName]);
      final token = c.identityToken;
      if (token == null) throw const SocialSignInUnavailable();
      final name = [c.givenName, c.familyName].whereType<String>().where((s) => s.isNotEmpty).join(' ');
      return (identityToken: token, fullName: name.isEmpty ? null : name);
    } on SignInWithAppleAuthorizationException catch (e) {
      throw SocialSignInUnavailable(cancelled: e.code == AuthorizationErrorCode.canceled);
    }
  }
}
