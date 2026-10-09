/// Build flavor. Selected by the entrypoint (`main_dev.dart`, `main_staging.dart`, `main_prod.dart`).
enum Flavor { dev, staging, prod }

/// Environment configuration, read at build time from the flavor's env file (keys documented in `.env.example`):
/// `flutter run -t lib/main_dev.dart --dart-define-from-file=.env.dev`. A `--dart-define` overrides a single key,
/// e.g. `--dart-define=HOO_API_URL=http://10.0.2.2:5131`.
///
/// No secrets live here: everything is compiled into the binary, so only public OAuth client ids and public URLs.
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

  /// SHA-256 SPKI pins (base64). Empty → pinning disabled.
  final List<String> certificatePins;

  final String? googleServerClientId;
  final String? googleIosClientId;
  final String? appleServiceId;

  String get apiRoot => '$apiBaseUrl/api/v1';
  bool get isProd => flavor == Flavor.prod;

  static const _apiUrl = String.fromEnvironment('HOO_API_URL');
  static const _webUrl = String.fromEnvironment('HOO_WEB_URL');
  static const _mock = String.fromEnvironment('HOO_MOCK');
  static const _googleServer = String.fromEnvironment('HOO_GOOGLE_SERVER_CLIENT_ID');
  static const _googleIos = String.fromEnvironment('HOO_GOOGLE_IOS_CLIENT_ID');
  static const _appleService = String.fromEnvironment('HOO_APPLE_SERVICE_ID');
  static const _pins = String.fromEnvironment('HOO_CERT_PINS');

  static String? _str(String v) => v.isEmpty ? null : v;

  static String _required(String key, String v, Flavor flavor) =>
      v.isNotEmpty ? v : throw StateError('$key is not set — run with --dart-define-from-file=.env.${flavor.name} (template: .env.example)');

  factory Env.forFlavor(Flavor flavor) {
    final prod = flavor == Flavor.prod;
    return Env(
      flavor: flavor,
      apiBaseUrl: _required('HOO_API_URL', _apiUrl, flavor),
      webBaseUrl: _required('HOO_WEB_URL', _webUrl, flavor),
      // The fake backend and request logs never ship in prod, whatever the env file says.
      useMockApi: !prod && (_mock == 'true' || _mock == '1'),
      enableNetworkLogs: !prod,
      certificatePins: [
        for (final p in _pins.split(','))
          if (p.trim().isNotEmpty) p.trim(),
      ],
      googleServerClientId: _str(_googleServer),
      googleIosClientId: _str(_googleIos),
      appleServiceId: _str(_appleService),
    );
  }
}
