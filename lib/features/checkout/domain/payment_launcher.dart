/// Opens the payment page (EPoint / 3-D Secure) outside the app UI — a Custom Tab on Android, an in-app Safari view
/// on iOS. The result is read back from `GET /orders/{number}/payment`, never from the browser.
abstract interface class PaymentRedirectLauncher {
  Future<void> open(String url);
}
