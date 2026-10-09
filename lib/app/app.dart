import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/connectivity/connectivity_cubit.dart';
import '../core/deeplinks/deep_link_service.dart';
import '../core/localization/app_settings_cubit.dart';
import '../core/localization/content_strings.dart';
import '../core/push/push_service.dart';
import '../core/session/session_store.dart';
import '../l10n/l10n.dart';
import '../shared/design_system/design_system.dart';
import 'di/injector.dart';
import 'router/app_router.dart';
import 'router/link_navigator.dart';

/// Root widget: theme (light/dark/system), locale (az default, ru, en, tr), typed router, and the app-wide
/// reactions to session events, deep links and push taps.
class HooApp extends StatefulWidget {
  const HooApp({super.key});

  @override
  State<HooApp> createState() => _HooAppState();
}

class _HooAppState extends State<HooApp> {
  final _router = sl<AppRouter>();

  /// Always boot through the Splash (store mode, guest id, session restore); incoming links are queued by
  /// [DeepLinkService] and replayed once the app is ready.
  late final _routerConfig = _router.config(deepLinkBuilder: (_) => DeepLink.single(const SplashRoute()));
  final _subs = <StreamSubscription<Object?>>[];

  @override
  void initState() {
    super.initState();
    final session = sl<SessionStore>();
    _subs.add(session.events.listen((e) {
      switch (e) {
        case SessionEvent.unauthorized:
          // token cleared by the interceptor; the guest bag (X-Guest-Id) is kept
          _router.replaceAll([const WelcomeRoute()]);
        case SessionEvent.storeComingSoon:
          _router.replaceAll([const ComingSoonRoute()]);
      }
    }));
    final links = sl<DeepLinkService>();
    _subs.add(links.links().listen(_openLink));
    final push = sl<PushService>();
    _subs.add(push.taps.listen((m) {
      final path = m.link;
      if (path == null) return;
      final link = DeepLinkService.parse(Uri.parse(path.startsWith('/') ? 'hoo:/$path' : path));
      if (link != null) _openLink(link);
    }));
    unawaited(push.start());
    links.initialLink().then((l) => links.pendingLink ??= l);
  }

  void _openLink(AppLink link) {
    if (link is PaymentReturnLink) return;
    final top = _router.topRoute.name;
    if (top == SplashRoute.name) {
      // the splash replays it after routing (DeepLinkService.takePendingLink)
      sl<DeepLinkService>().pendingLink = link;
      return;
    }
    unawaited(LinkNavigator.open(_router, link));
  }

  @override
  void dispose() {
    for (final s in _subs) {
      s.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sl<AppSettingsCubit>()),
        BlocProvider.value(value: sl<ConnectivityCubit>()),
      ],
      child: BlocConsumer<AppSettingsCubit, AppSettings>(
        listenWhen: (a, b) => a.language != b.language,
        listener: (_, s) => sl<ContentStrings>().load(s.language.wire),
        builder: (context, settings) => ListenableBuilder(
          listenable: sl<ContentStrings>(),
          builder: (context, _) => MaterialApp.router(
            title: 'HOO',
            debugShowCheckedModeBanner: false,
            theme: HooThemeData.light(),
            darkTheme: HooThemeData.dark(),
            themeMode: settings.themeMode,
            themeAnimationDuration: HooDurations.normal,
            themeAnimationCurve: HooCurves.standard,
            locale: settings.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: _routerConfig,
            builder: (context, child) {
              // Dynamic type up to 1.3× (layouts are designed for it); beyond that the editorial grid breaks.
              final mq = MediaQuery.of(context);
              return MediaQuery(
                data: mq.copyWith(textScaler: mq.textScaler.clamp(minScaleFactor: 0.9, maxScaleFactor: 1.3)),
                child: child ?? const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }
}
