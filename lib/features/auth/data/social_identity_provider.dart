import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/config/env.dart';
import '../domain/auth_models.dart';

/// Obtains an ID token from a native identity provider. The backend verifies it (`POST /auth/google|apple`).
/// Returns null when the user cancelled.
abstract interface class SocialIdentityProvider {
  bool get googleAvailable;
  bool get appleAvailable;

  Future<GoogleCredential?> google();
  Future<AppleCredential?> apple();
}

/// Failure of the native provider itself (misconfiguration, no Play services…), not a cancellation.
class SocialSignInException implements Exception {
  const SocialSignInException(this.provider, [this.cause]);
  final String provider;
  final Object? cause;

  @override
  String toString() => 'SocialSignInException($provider)';
}

/// `google_sign_in` 7 + `sign_in_with_apple` 7, configured from [Env].
class PlatformSocialIdentityProvider implements SocialIdentityProvider {
  PlatformSocialIdentityProvider(this._env);

  final Env _env;
  Future<void>? _googleInit;

  /// Google needs the server (web) client id so the ID token's audience is the backend. iOS additionally needs
  /// its own client id (+ the reversed-client-id URL scheme in Info.plist).
  @override
  bool get googleAvailable {
    if (kIsWeb) return false;
    if (_env.googleServerClientId == null) return false;
    if (Platform.isIOS && _env.googleIosClientId == null) return false;
    return Platform.isAndroid || Platform.isIOS;
  }

  /// Native Sign in with Apple only on iOS. Android would need the web flow with a Services ID + redirect URI.
  // TODO(backend): Android Apple sign-in needs a redirect endpoint (web flow) and Env.appleRedirectUri.
  @override
  bool get appleAvailable => !kIsWeb && Platform.isIOS;

  @override
  Future<GoogleCredential?> google() async {
    final signIn = GoogleSignIn.instance;
    try {
      await (_googleInit ??= signIn.initialize(clientId: Platform.isIOS ? _env.googleIosClientId : null, serverClientId: _env.googleServerClientId));
      if (!signIn.supportsAuthenticate()) throw const SocialSignInException('google');
      final account = await signIn.authenticate(scopeHint: const ['email', 'profile']);
      final token = account.authentication.idToken;
      if (token == null || token.isEmpty) throw const SocialSignInException('google');
      return GoogleCredential(token);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled || e.code == GoogleSignInExceptionCode.interrupted) return null;
      _googleInit = null;
      throw SocialSignInException('google', e);
    }
  }

  @override
  Future<AppleCredential?> apple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(scopes: const [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName]);
      final token = credential.identityToken;
      if (token == null || token.isEmpty) throw const SocialSignInException('apple');
      final name = [credential.givenName, credential.familyName].whereType<String>().where((s) => s.trim().isNotEmpty).join(' ');
      return AppleCredential(token, fullName: name.isEmpty ? null : name);
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) return null;
      throw SocialSignInException('apple', e);
    } on SignInWithAppleException catch (e) {
      throw SocialSignInException('apple', e);
    }
  }
}
