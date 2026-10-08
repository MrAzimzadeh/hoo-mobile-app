/// Build flavor. Selected by the entrypoint (`main_dev.dart`, `main_staging.dart`, `main_prod.dart`).
enum Flavor { dev, staging, prod }

/// Environment configuration. Values can be overridden at build time with `--dart-define`, e.g.
/// `flutter run -t lib/main_dev.dart --dart-define=HOO_API=http://10.0.2.2:5131 --dart-define=HOO_MOCK=true`.
///
/// No secrets live here: only public OAuth client ids and public URLs.
final class Env {
  const Env({
    required this.flavor,
    required this.apiBaseUrl,
    required this.webBaseUrl,
    required this.useMockApi,
    required this.enableNetworkLogs,
    required this.certificatePins,
    this.googleServerClientId,
    this.googleIosClientId,
    this.appleServiceId,
  });

  final Flavor flavor;

  /// Origin of the Hoo.Api (without `/api/v1`).
  final String apiBaseUrl;

  /// Public storefront origin — used for share links and universal-link matching.
  final String webBaseUrl;

  /// Serve every request from the in-app fake backend (JSON fixtures) — the UI runs without a server.
  final bool useMockApi;

  final bool enableNetworkLogs;

  /// SHA-256 SPKI pins (base64) enforced in prod. Empty → pinning disabled.
  final List<String> certificatePins;

  final String? googleServerClientId;
  final String? googleIosClientId;
  final String? appleServiceId;

  String get apiRoot => '$apiBaseUrl/api/v1';
  bool get isProd => flavor == Flavor.prod;

  static const _apiOverride = String.fromEnvironment('HOO_API');
  static const _mockOverride = String.fromEnvironment('HOO_MOCK');
  static const _googleServer = String.fromEnvironment('HOO_GOOGLE_SERVER_CLIENT_ID');
  static const _googleIos = String.fromEnvironment('HOO_GOOGLE_IOS_CLIENT_ID');
  static const _pins = String.fromEnvironment('HOO_CERT_PINS');

  static bool? _bool(String v) => v.isEmpty ? null : v == 'true' || v == '1';
  static String? _str(String v) => v.isEmpty ? null : v;

  factory Env.forFlavor(Flavor flavor) => switch (flavor) {
        Flavor.dev => Env(
            flavor: flavor,
            apiBaseUrl: _str(_apiOverride) ?? 'http://localhost:5131',
            webBaseUrl: 'http://localhost:3000',
            useMockApi: _bool(_mockOverride) ?? false,
            enableNetworkLogs: true,
            certificatePins: const [],
            googleServerClientId: _str(_googleServer),
            googleIosClientId: _str(_googleIos),
          ),
        Flavor.staging => Env(
            flavor: flavor,
            apiBaseUrl: _str(_apiOverride) ?? 'https://api.staging.hoo.az',
            webBaseUrl: 'https://staging.hoo.az',
            useMockApi: _bool(_mockOverride) ?? false,
            enableNetworkLogs: true,
            certificatePins: const [],
            googleServerClientId: _str(_googleServer),
            googleIosClientId: _str(_googleIos),
          ),
        Flavor.prod => Env(
            flavor: flavor,
            apiBaseUrl: _str(_apiOverride) ?? 'https://api.hoo.az',
            webBaseUrl: 'https://hoo.az',
            useMockApi: false,
            enableNetworkLogs: false,
            certificatePins: _pins.isEmpty ? const [] : _pins.split(','),
            googleServerClientId: _str(_googleServer),
            googleIosClientId: _str(_googleIos),
            appleServiceId: 'az.hoo.app',
          ),
      };
}
