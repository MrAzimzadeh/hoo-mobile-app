import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/profile_models.dart';
import '../../domain/profile_repositories.dart';

class ProfileState extends Equatable {
  const ProfileState({this.user, this.overview, this.loadingOverview = false, this.overviewError, this.stale = false, this.signingOut = false});

  /// Null → signed-out layout.
  final Me? user;
  final AccountOverview? overview;
  final bool loadingOverview;
  final Object? overviewError;
  final bool stale;
  final bool signingOut;

  bool get isSignedIn => user != null;

  /// Header name: the session's name (instant), the overview's once loaded.
  String get displayName => (overview?.fullName.isNotEmpty ?? false) ? overview!.fullName : (user?.fullName ?? '');

  ProfileState copyWith({AccountOverview? overview, bool? loadingOverview, Object? overviewError, bool clearError = false, bool? stale, bool? signingOut}) =>
      ProfileState(
        user: user,
        overview: overview ?? this.overview,
        loadingOverview: loadingOverview ?? this.loadingOverview,
        overviewError: clearError ? null : (overviewError ?? this.overviewError),
        stale: stale ?? this.stale,
        signingOut: signingOut ?? this.signingOut,
      );

  @override
  List<Object?> get props => [user, overview, loadingOverview, overviewError, stale, signingOut];
}

/// Profile tab: follows `AuthGate.userChanges`; loads the overview counters whenever a user signs in.
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._auth, this._account) : super(ProfileState(user: _auth.currentUser)) {
    _sub = _auth.userChanges.listen(_onUser);
    if (state.isSignedIn) unawaited(loadOverview());
  }

  final AuthGate _auth;
  final AccountRepository _account;
  StreamSubscription<Me?>? _sub;

  void _onUser(Me? user) {
    final previous = state.user;
    if (user == null) {
      emit(const ProfileState());
      return;
    }
    // keep counters when only profile fields changed; reload them for a different account
    final sameAccount = previous?.id == user.id;
    emit(
      ProfileState(
        user: user,
        overview: sameAccount ? state.overview : null,
        loadingOverview: state.loadingOverview && sameAccount,
        stale: sameAccount && state.stale,
      ),
    );
    if (!sameAccount) unawaited(loadOverview());
  }

  Future<void> loadOverview() async {
    if (!state.isSignedIn) return;
    emit(state.copyWith(loadingOverview: true, clearError: true));
    try {
      final r = await _account.overview();
      if (!isClosed && state.isSignedIn) emit(state.copyWith(overview: r.data, stale: r.stale, loadingOverview: false));
    } on ApiException catch (e) {
      if (!isClosed) emit(state.copyWith(loadingOverview: false, overviewError: e));
    }
  }

  Future<void> signOut() async {
    if (state.signingOut) return;
    emit(state.copyWith(signingOut: true));
    try {
      await _auth.signOut();
    } finally {
      // userChanges emits null on success; on failure just re-enable the button
      if (!isClosed && state.signingOut) emit(state.copyWith(signingOut: false));
    }
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }
}
