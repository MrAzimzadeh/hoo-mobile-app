/// Friendly device naming for the Active devices list, parsed from a session's `User-Agent`.
///
/// Platform and browser names are proper nouns and stay untranslated; only "HOO app" and "Unknown device" are
/// localized by the UI.
enum DevicePlatform {
  iPhone('iPhone'),
  iPad('iPad'),
  android('Android'),
  mac('Mac'),
  windows('Windows'),
  chromeOs('ChromeOS'),
  linux('Linux'),
  unknown('');

  const DevicePlatform(this.displayName);
  final String displayName;

  bool get isMobile => this == iPhone || this == iPad || this == android;
}

enum DeviceClient {
  /// This app (Dart's HTTP client or a `HOO/` user agent).
  app(''),
  edge('Edge'),
  opera('Opera'),
  samsungInternet('Samsung Internet'),
  chrome('Chrome'),
  firefox('Firefox'),
  safari('Safari'),
  unknown('');

  const DeviceClient(this.displayName);
  final String displayName;
}

class DeviceDescriptor {
  const DeviceDescriptor(this.platform, this.client);

  final DevicePlatform platform;
  final DeviceClient client;

  bool get isKnown => platform != DevicePlatform.unknown || client != DeviceClient.unknown;

  /// Order matters: iPad before Mac (iPadOS desktop UA), Edge/Opera/Samsung before Chrome, Chrome before Safari.
  static DeviceDescriptor parse(String? userAgent) {
    final ua = (userAgent ?? '').trim();
    if (ua.isEmpty) return const DeviceDescriptor(DevicePlatform.unknown, DeviceClient.unknown);
    final lower = ua.toLowerCase();

    final platform = switch (lower) {
      _ when lower.contains('ipad') => DevicePlatform.iPad,
      _ when lower.contains('iphone') || lower.contains('ipod') || lower.contains('(ios') || lower.contains('ios ') => DevicePlatform.iPhone,
      _ when lower.contains('android') => DevicePlatform.android,
      _ when lower.contains('cros') => DevicePlatform.chromeOs,
      _ when lower.contains('macintosh') || lower.contains('mac os') || lower.contains('macos') => DevicePlatform.mac,
      _ when lower.contains('windows') => DevicePlatform.windows,
      _ when lower.contains('linux') => DevicePlatform.linux,
      _ => DevicePlatform.unknown,
    };

    final client = switch (lower) {
      _ when lower.startsWith('dart/') || lower.contains('hoo/') || lower.contains('hooapp') || lower.contains('okhttp') => DeviceClient.app,
      _ when lower.contains('edg/') || lower.contains('edga/') || lower.contains('edgios/') => DeviceClient.edge,
      _ when lower.contains('opr/') || lower.contains('opera') => DeviceClient.opera,
      _ when lower.contains('samsungbrowser') => DeviceClient.samsungInternet,
      _ when lower.contains('firefox/') || lower.contains('fxios/') => DeviceClient.firefox,
      _ when lower.contains('chrome/') || lower.contains('crios/') => DeviceClient.chrome,
      _ when lower.contains('safari/') => DeviceClient.safari,
      _ => DeviceClient.unknown,
    };

    return DeviceDescriptor(platform, client);
  }
}
