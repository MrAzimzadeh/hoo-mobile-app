import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/deeplinks/deep_link_service.dart';

void main() {
  AppLink? p(String url) => DeepLinkService.parse(Uri.parse(url));

  test('product links work with and without locale prefixes and the custom scheme', () {
    for (final url in ['https://hoo.az/products/essential-hoodie', 'https://hoo.az/ru/products/essential-hoodie', 'hoo://products/essential-hoodie']) {
      final link = p(url);
      expect(link, isA<ProductLink>(), reason: url);
      expect((link! as ProductLink).slug, 'essential-hoodie');
    }
  });

  test('maps the web routes', () {
    expect(p('https://hoo.az/collections/winter'), isA<CollectionLink>());
    expect((p('https://hoo.az/search?q=hoodie')! as SearchLink).query, 'hoodie');
    expect(p('https://hoo.az/cart'), isA<CartLink>());
    expect((p('https://hoo.az/checkout/confirmed/HOO-1042')! as OrderConfirmedLink).number, 'HOO-1042');
    expect((p('https://hoo.az/account/orders/HOO-7')! as OrderLink).number, 'HOO-7');
    expect((p('https://hoo.az/en/design-your-own?product=tee')! as StudioLink).productSlug, 'tee');
    expect((p('https://hoo.az/studio/shared/abc')! as SharedDesignLink).token, 'abc');
    expect((p('https://hoo.az/wishlist/shared/xyz')! as SharedWishlistLink).token, 'xyz');
    expect((p('https://hoo.az/gift/receipt/G-1')! as GiftReceiptLink).code, 'G-1');
    expect((p('https://hoo.az/track-order?number=HOO-1')! as TrackOrderLink).number, 'HOO-1');
    expect(p('https://hoo.az/'), isA<HomeLink>());
  });

  test('EPoint return URLs become payment returns', () {
    final ok = p('https://hoo.az/checkout/success?order=HOO-9')! as PaymentReturnLink;
    expect(ok.success, isTrue);
    expect(ok.orderNumber, 'HOO-9');
    expect((p('https://hoo.az/checkout/error')! as PaymentReturnLink).success, isFalse);
  });

  test('unknown paths are ignored', () => expect(p('https://hoo.az/whatever/else'), isNull));
}
