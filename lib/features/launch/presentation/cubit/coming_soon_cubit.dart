import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../domain/launch_models.dart';
import '../../domain/launch_repository.dart';

class ComingSoonState extends Equatable {
  const ComingSoonState({
    this.content,
    this.count,
    this.loading = true,
    this.loadError,
    this.joining = false,
    this.joined,
    this.joinError,
    this.newsletterBusy = false,
    this.newsletterDone = false,
    this.newsletterError,
  });

  final ComingSoonContent? content;
  final WaitlistCount? count;
  final bool loading;
  final Object? loadError;
  final bool joining;
  final WaitlistJoined? joined;
  final ApiException? joinError;
  final bool newsletterBusy;
  final bool newsletterDone;
  final ApiException? newsletterError;

  ComingSoonState copyWith({
    ComingSoonContent? content,
    WaitlistCount? count,
    bool? loading,
    Object? Function()? loadError,
    bool? joining,
    WaitlistJoined? joined,
    ApiException? Function()? joinError,
    bool? newsletterBusy,
    bool? newsletterDone,
    ApiException? Function()? newsletterError,
  }) =>
      ComingSoonState(
        content: content ?? this.content,
        count: count ?? this.count,
        loading: loading ?? this.loading,
        loadError: loadError == null ? this.loadError : loadError(),
        joining: joining ?? this.joining,
        joined: joined ?? this.joined,
        joinError: joinError == null ? this.joinError : joinError(),
        newsletterBusy: newsletterBusy ?? this.newsletterBusy,
        newsletterDone: newsletterDone ?? this.newsletterDone,
        newsletterError: newsletterError == null ? this.newsletterError : newsletterError(),
      );

  @override
  List<Object?> get props => [content, count, loading, loadError, joining, joined, joinError, newsletterBusy, newsletterDone, newsletterError];
}

class ComingSoonCubit extends Cubit<ComingSoonState> {
  ComingSoonCubit(this._repo) : super(const ComingSoonState());

  final LaunchRepository _repo;

  Future<void> load() async {
    emit(state.copyWith(loading: true, loadError: () => null));
    try {
      final results = await Future.wait([_repo.comingSoon(), _repo.waitlistCount()]);
      emit(state.copyWith(content: results[0] as ComingSoonContent, count: results[1] as WaitlistCount, loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false, loadError: () => e));
    }
  }

  Future<void> join({String? email, String? phone}) async {
    if (state.joining) return;
    emit(state.copyWith(joining: true, joinError: () => null));
    try {
      final joined = await _repo.joinWaitlist(email: email, phone: phone);
      emit(state.copyWith(joining: false, joined: joined, count: WaitlistCount(total: joined.total, today: state.count?.today ?? 0)));
    } on ApiException catch (e) {
      emit(state.copyWith(joining: false, joinError: () => e));
    }
  }

  Future<void> subscribe(String email) async {
    if (state.newsletterBusy) return;
    emit(state.copyWith(newsletterBusy: true, newsletterError: () => null));
    try {
      await _repo.subscribeNewsletter(email.trim());
      emit(state.copyWith(newsletterBusy: false, newsletterDone: true));
    } on ApiException catch (e) {
      // already subscribed is a success for the customer
      final done = e.code == 'launch.already_subscribed';
      emit(state.copyWith(newsletterBusy: false, newsletterDone: done, newsletterError: () => done ? null : e));
    }
  }
}
