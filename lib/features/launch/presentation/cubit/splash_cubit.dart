import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/analytics/analytics.dart';
import '../../../../core/localization/app_settings_cubit.dart';
import '../../../../core/localization/content_strings.dart';
import '../../../../core/session/session_store.dart';
import '../../../../core/storage/preferences.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../data/store_info_repository.dart';
import '../../domain/launch_repository.dart';

/// Where the app goes once the splash has initialised.
enum LaunchDestination { comingSoon, onboarding, main }

/// Pure routing rule (unit-tested): Coming Soon for everyone but staff while the store is not live, then the
/// first-launch onboarding, then the app.
abstract final class LaunchRouting {
  static LaunchDestination decide({required StoreInfo store, required Me? user, required bool onboardingDone}) {
    if (store.mode != StoreMode.live && !(user?.isStaff ?? false)) return LaunchDestination.comingSoon;
    if (!onboardingDone) return LaunchDestination.onboarding;
    return LaunchDestination.main;
  }
}

@immutable
class SplashState extends Equatable {
  const SplashState({this.destination, this.slow = false});

  /// Null while initialising.
  final LaunchDestination? destination;

  /// Init is taking longer than the brand animation — the page shows a discreet progress line.
  final bool slow;

  bool get isReady => destination != null;

  @override
  List<Object?> get props => [destination, slow];
}

/// Runs the start-up work in parallel while the splash animation plays: store mode, guest id, session validation,
/// `/content/strings`, the Visit event — then decides the first screen. Every step is bounded and failure-tolerant:
/// start-up must reach a screen offline too (cached store mode, bundled strings).
class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required StoreInfoRepository store,
    required GuestRepository guests,
    required SessionStore session,
    required AuthGate auth,
    required ContentStrings content,
    required Analytics analytics,
    required Preferences prefs,
    required AppSettingsCubit settings,
    this.stepTimeout = const Duration(seconds: 6),
    this.slowAfter = const Duration(milliseconds: 2400),
  }) : _store = store,
       _guests = guests,
       _session = session,
       _auth = auth,
       _content = content,
       _analytics = analytics,
       _prefs = prefs,
       _settings = settings,
       super(const SplashState());

  final StoreInfoRepository _store;
  final GuestRepository _guests;
  final SessionStore _session;
  final AuthGate _auth;
  final ContentStrings _content;
  final Analytics _analytics;
  final Preferences _prefs;
  final AppSettingsCubit _settings;

  /// Upper bound for each network step (not a motion value) — past it the cached/default state is used.
  final Duration stepTimeout;

  /// When to reveal the progress line (≈ brand animation + hold).
  final Duration slowAfter;

  Timer? _slowTimer;
  bool _started = false;

  Future<void> start() async {
    if (_started) return;
    _started = true;
    _slowTimer = Timer(slowAfter, () {
      if (!isClosed && !state.isReady) emit(const SplashState(slow: true));
    });

    final hadSession = _session.hasSession;
    await Future.wait<void>([
      _store.load(timeout: stepTimeout),
      // The guest id first, then the Visit event so it is attributed to the device.
      _bounded(_guests.ensureGuestId(), 'guest').then((_) => _analytics.visit()),
      // Validates a restored token (`GET /auth/session`); a 401 clears it in the network layer.
      if (hadSession) _bounded(_auth.refreshUser(), 'session'),
      _bounded(_content.load(_settings.state.language.wire), 'strings'),
    ]);

    _slowTimer?.cancel();
    if (isClosed) return;
    final destination = LaunchRouting.decide(store: _store.info, user: _auth.currentUser, onboardingDone: _prefs.onboardingDone);
    emit(SplashState(destination: destination, slow: state.slow));
  }

  Future<void> _bounded(Future<Object?> work, String label) async {
    try {
      await work.timeout(stepTimeout);
    } on Object catch (e) {
      if (kDebugMode) debugPrint('[splash] $label: $e');
    }
  }

  @override
  Future<void> close() {
    _slowTimer?.cancel();
    return super.close();
  }
}
