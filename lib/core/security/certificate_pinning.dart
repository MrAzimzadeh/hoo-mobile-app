import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/io.dart';

/// Production certificate pinning: after the platform trust check passes, the server's leaf certificate must
/// match one of the SHA-256 fingerprints (base64 of the DER digest) passed via
/// `--dart-define=HOO_CERT_PINS=pin1,pin2`. Ship a backup pin for rotation. Dev/staging run without pinning.
abstract final class CertificatePinning {
  static IOHttpClientAdapter adapter(List<String> pins) {
    final allowed = pins.map((p) => p.trim()).where((p) => p.isNotEmpty).toSet();
    return IOHttpClientAdapter(
      createHttpClient: () => HttpClient(context: SecurityContext(withTrustedRoots: true)),
      validateCertificate: (cert, host, port) => cert != null && allowed.contains(fingerprint(cert)),
    );
  }

  static String fingerprint(X509Certificate cert) => base64.encode(sha256.convert(cert.der).bytes);
}
