import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/features/auth/data/auth_api.dart';
import 'package:hoo/features/auth/data/auth_repository_impl.dart';
import 'package:hoo/features/auth/data/auth_user_cache.dart';
import 'package:hoo/features/auth/data/social_identity_provider.dart';
import 'package:hoo/features/auth/presentation/bloc/auth_errors.dart';
import 'package:hoo/features/auth/presentation/bloc/auth_form_bloc.dart';

import '../../helpers/fake_api.dart';
import '../../helpers/memory_session.dart';

const _user = {
  'id': 'u1',
  'fullName': 'Demo User',
  'email': 'demo@hoo.az',
  'roles': ['Customer'],
};

class _NoSocial implements SocialIdentityProvider {
  @override
  bool get googleAvailable => false;
  @override
  bool get appleAvailable => false;
  @override
  Future<Null> google() async => null;
  @override
  Future<Null> apple() async => null;
}

void main() {
  group('AuthRepositoryImpl', () {
    test('login stores the session and publishes the user; logout clears both', () async {
      final session = await memorySession();
      final api = fakeApiClient({
        'POST /auth/login': (r) => (200, {'sessionToken': 'tok', 'expiresAt': '2030-01-01T00:00:00Z', 'isNewUser': false, 'user': _user}),
        'POST /auth/logout': (_) => (204, null),
      });
      final repo = AuthRepositoryImpl(AuthApi(api), session, MemoryAuthUserCache());
      await repo.login(identifier: 'demo@hoo.az', password: 'Hoo12345!');
      expect(session.token, 'tok');
      expect(repo.currentUser?.fullName, 'Demo User');

      await repo.logout();
      expect(session.hasSession, isFalse);
      expect(repo.currentUser, isNull);
    });

    test('refreshSession clears the user on 401', () async {
      final session = await memorySession();
      await session.saveToken('tok', DateTime(2030));
      final api = fakeApiClient({
        'GET /auth/session': (_) => (401, {'code': 'auth.unauthorized', 'title': 'x', 'status': 401}),
      });
      final repo = AuthRepositoryImpl(AuthApi(api), session, MemoryAuthUserCache());
      expect(await repo.refreshSession(), isNull);
    });
  });

  group('AuthFormBloc', () {
    test('invalid sign-in input never reaches the network', () async {
      final session = await memorySession();
      final adapter = FakeApiAdapter({});
      final repo = AuthRepositoryImpl(AuthApi(fakeApiClient({}, adapter: adapter)), session, MemoryAuthUserCache());
      final bloc = AuthFormBloc(repo, _NoSocial());
      bloc.add(const SignInSubmitted(identifier: '', password: ''));
      final state = await bloc.stream.firstWhere((s) => s.status == AuthFormStatus.failure);
      expect(state.fieldErrors['identifier']?.code, AuthFieldError.required);
      expect(state.fieldErrors['password']?.code, AuthFieldError.required);
      expect(adapter.requests, isEmpty);
      await bloc.close();
    });

    test('maps a 429 to a lock-out and a 409 email_taken to the email field', () async {
      final session = await memorySession();
      final api = fakeApiClient({
        'POST /auth/login': (_) => (429, {'code': 'general.too_many_requests', 'title': 'Slow down', 'status': 429, 'seconds': 30}),
        'POST /auth/register': (_) => (409, {'code': 'auth.email_taken', 'title': 'Email taken', 'status': 409}),
      });
      final repo = AuthRepositoryImpl(AuthApi(api), session, MemoryAuthUserCache());
      final bloc = AuthFormBloc(repo, _NoSocial());
      bloc.add(const SignInSubmitted(identifier: 'demo@hoo.az', password: 'x'));
      expect((await bloc.stream.firstWhere((s) => s.status == AuthFormStatus.failure)).lockedUntil, isNotNull);

      final bloc2 = AuthFormBloc(repo, _NoSocial());
      bloc2.add(const SignUpSubmitted(fullName: 'A B', email: 'a@b.az', password: 'Passw0rd!', acceptTerms: true));
      final s = await bloc2.stream.firstWhere((s) => s.status == AuthFormStatus.failure);
      expect(s.fieldErrors['email']?.message, 'Email taken');
      await bloc.close();
      await bloc2.close();
    });
  });
}
