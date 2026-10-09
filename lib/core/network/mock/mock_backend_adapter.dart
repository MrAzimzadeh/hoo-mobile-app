import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'mock_seed.dart';

/// In-app fake backend for `--dart-define=HOO_MOCK=true`: answers the customer API (`/api/v1`) from seed data
/// with in-memory state (guest, session, bag, checkout, orders, wishlist, designs), so the whole UI runs without
/// a server. Responses follow the Hoo.Api contracts; prices here are computed by the fake *server* — the app never
/// computes them. Demo: any e-mail + password `Hoo12345!`, OTP code `123456`, promo `HOO10`.
class MockBackendAdapter implements HttpClientAdapter {
  MockBackendAdapter({this.latency = const Duration(milliseconds: 220)});

  final Duration latency;
  final _state = MockState();

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    await Future<void>.delayed(latency);
    final path = options.uri.path.replaceFirst(RegExp(r'^.*?/api/v1'), '');
    final req = MockRequest(
      method: options.method,
      path: path,
      query: options.uri.queryParametersAll,
      body: options.data is Map ? (options.data as Map).cast<String, dynamic>() : null,
      headers: options.headers,
    );
    MockResponse res;
    try {
      res = _state.handle(req);
    } on MockError catch (e) {
      res = MockResponse(e.status, {'type': 'https://docs.hoo.az/errors/${e.code}', 'title': e.title, 'status': e.status, 'code': e.code, if (e.errors != null) 'errors': e.errors});
    }
    final json = res.body == null ? '' : jsonEncode(res.body);
    return ResponseBody.fromString(json, res.status, headers: {
      Headers.contentTypeHeader: [res.status >= 400 ? 'application/problem+json' : 'application/json'],
    });
  }

  @override
  void close({bool force = false}) {}
}

class MockRequest {
  MockRequest({required this.method, required this.path, required this.query, this.body, required this.headers});
  final String method;
  final String path;
  final Map<String, List<String>> query;
  final Map<String, dynamic>? body;
  final Map<String, dynamic> headers;

  String? q(String k) => query[k]?.firstOrNull;
  List<String> qs(String k) => query[k] ?? const [];
  String? get token => (headers['Authorization'] as String?)?.replaceFirst('Session ', '');
  String get lang => (headers['Accept-Language'] as String?) ?? 'az';
}

class MockResponse {
  MockResponse(this.status, [this.body]);
  final int status;
  final Object? body;
}

class MockError implements Exception {
  MockError(this.status, this.code, this.title, {this.errors});
  final int status;
  final String code;
  final String title;
  final Map<String, List<String>>? errors;
}

/// Server state + routing.
class MockState {
  final seed = MockSeed();
  String? token;
  Map<String, dynamic>? user;
  final cart = <Map<String, dynamic>>[]; // {id, variantId?, designId?, quantity}
  String? promo;
  bool isGift = false;
  final wishlist = <String>{};
  final recent = <String>[];
  final orders = <Map<String, dynamic>>[];
  final designs = <String, Map<String, dynamic>>{};
  final checkouts = <String, Map<String, dynamic>>{};
  int _seq = 1000;
  final _rnd = math.Random(7);

  String _id() => '${DateTime.now().microsecondsSinceEpoch}-${_rnd.nextInt(1 << 30)}';

  MockResponse ok(Object? body) => MockResponse(200, body);

  MockResponse handle(MockRequest r) {
    final p = r.path;
    final m = r.method;
    RegExpMatch? match(String pattern) => RegExp('^$pattern\$').firstMatch(p);

    // meta & launch
    if (m == 'GET' && p == '/meta/store') return ok(seed.store);
    if (m == 'POST' && p == '/guest') return ok({'guestId': 'mock-guest-${_id()}'});
    if (m == 'POST' && p == '/events') return MockResponse(204);
    if (m == 'GET' && p == '/content/strings') throw MockError(404, 'content.no_published_release', 'No release');
    if (m == 'GET' && p == '/content/coming-soon') return ok({...seed.comingSoon, 'waitlistCount': 128});
    if (m == 'GET' && p == '/waitlist/count') return ok({'total': 128, 'today': 9});
    if (m == 'POST' && p == '/waitlist') return ok({'position': 129, 'total': 129, 'alreadyJoined': false});
    if (m == 'POST' && p.startsWith('/newsletter')) return ok({'code': 'ok', 'message': 'OK'});

    // auth
    if (m == 'POST' && (p == '/auth/login' || p == '/auth/register' || p == '/auth/otp/verify')) {
      if (p == '/auth/login' && r.body?['password'] != 'Hoo12345!') throw MockError(401, 'auth.invalid_credentials', 'E-poçt və ya şifrə yanlışdır');
      if (p == '/auth/otp/verify' && r.body?['code'] != '123456') throw MockError(400, 'auth.otp_invalid', 'Kod yanlışdır');
      return ok(_signIn(r, isNew: p == '/auth/register'));
    }
    if (m == 'POST' && p == '/auth/otp/send') return ok({'resendAfterSeconds': 30, 'expiresInSeconds': 300, 'maskedPhone': '+994 ** *** ** ${(r.body?['phone'] as String? ?? '00').substring((r.body?['phone'] as String? ?? '00').length - 2)}'});
    if (m == 'POST' && (p == '/auth/google' || p == '/auth/apple')) throw MockError(401, 'auth.external_token_invalid', 'Token etibarsızdır');
    if (m == 'POST' && p == '/auth/logout') {
      token = null;
      user = null;
      return ok({'code': 'ok', 'message': 'OK'});
    }
    if (m == 'GET' && p == '/auth/session') return ok(_me(r));
    if (m == 'GET' && p == '/auth/sessions') {
      _me(r);
      return ok([
        {'id': 's1', 'createdAt': '2026-10-01T10:00:00Z', 'lastSeenAt': DateTime.now().toUtc().toIso8601String(), 'userAgent': 'Dart/3.10 (dart:io) HOO/0.1 iPhone', 'isCurrent': true},
        {'id': 's2', 'createdAt': '2026-09-20T10:00:00Z', 'lastSeenAt': '2026-10-05T18:30:00Z', 'userAgent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 14_6) AppleWebKit Chrome/129 Safari/537.36', 'isCurrent': false},
      ]);
    }
    if (p.startsWith('/auth/password') || (m == 'DELETE' && p.startsWith('/auth/sessions/'))) return ok({'code': 'ok', 'message': 'OK'});

    // account
    if (p.startsWith('/account')) return _account(r, match);

    // catalog
    if (m == 'GET' && p == '/catalog/categories') return ok(seed.categories(r.lang));
    if (m == 'GET' && p == '/catalog/collections') return ok(seed.collections);
    if (m == 'GET' && p == '/catalog/colors') return ok(seed.colors.values.toList());
    if (m == 'GET' && p == '/catalog/products') return ok(_list(r));
    if (m == 'GET' && (p == '/catalog/new-arrivals' || p == '/catalog/bestsellers')) {
      final cards = seed.products.map(seed.card).toList();
      return ok(p.endsWith('bestsellers') ? cards.reversed.toList() : cards);
    }
    if (m == 'GET' && p == '/catalog/looks') return ok(seed.looks);
    var mm = match(r'/catalog/products/([^/]+)/recommendations');
    if (mm != null) return ok({'youMayAlsoLike': seed.products.where((x) => x['slug'] != mm!.group(1)).map(seed.card).toList(), 'completeTheLook': seed.products.take(2).map(seed.card).toList()});
    mm = match(r'/catalog/products/([^/]+)/reviews');
    if (mm != null) {
      if (m == 'POST') throw MockError(422, 'catalog.review_requires_purchase', 'Rəy yazmaq üçün məhsulu almaq lazımdır');
      return ok({'items': seed.reviews, 'page': 1, 'pageSize': 10, 'totalCount': seed.reviews.length, 'totalPages': 1, 'hasMore': false});
    }
    mm = match(r'/catalog/products/([^/]+)');
    if (mm != null) {
      final prod = seed.bySlug(mm.group(1)!);
      if (prod == null) throw MockError(404, 'catalog.product_not_found', 'Məhsul tapılmadı');
      return ok(seed.detail(prod, wishlisted: wishlist.contains(prod['id'])));
    }

    // search
    if (m == 'GET' && p == '/search/suggest') return ok(['hudi', 'hudi qara', 'futbolka', 'sweatshirt'].where((s) => s.contains((r.q('q') ?? '').toLowerCase())).toList());
    if (p == '/search/recent') return m == 'GET' ? ok(['hudi', 'oversized']) : MockResponse(204);
    if (m == 'GET' && p == '/search') {
      final q = (r.q('q') ?? '').toLowerCase();
      final items = seed.products.where((x) => (x['name'] as String).toLowerCase().contains(q) || (x['type'] as String).toLowerCase().contains(q)).map(seed.card).toList();
      return ok({'query': r.q('q'), 'items': items, 'totalCount': items.length, 'suggestDesignYourOwn': items.isEmpty});
    }

    // wishlist, recently viewed, alerts
    if (p == '/wishlist' && m == 'GET') return ok(seed.products.where((x) => wishlist.contains(x['id'])).map(seed.card).toList());
    if (p == '/wishlist/share') return ok({'token': 'w1', 'url': 'https://hoo.az/wishlist/shared/w1'});
    if (p.startsWith('/wishlist/shared/')) return ok({'ownerFirstName': 'Aysel', 'items': seed.products.take(3).map(seed.card).toList()});
    mm = match(r'/wishlist/([^/]+)');
    if (mm != null) {
      _me(r);
      m == 'POST' ? wishlist.add(mm.group(1)!) : wishlist.remove(mm.group(1));
      return MockResponse(204);
    }
    if (p == '/recently-viewed') {
      if (m == 'DELETE') recent.clear();
      return ok([
        for (final id in recent.reversed) {'product': seed.card(seed.byId(id)!), 'viewedAt': DateTime.now().toUtc().toIso8601String()},
      ]);
    }
    mm = match(r'/recently-viewed/([^/]+)');
    if (mm != null) {
      recent
        ..remove(mm.group(1))
        ..add(mm.group(1)!);
      return MockResponse(204);
    }
    if (p == '/alerts') return m == 'GET' ? ok(<Object>[]) : ok({'id': _id()});
    if (p.startsWith('/alerts/')) return MockResponse(204);

    // cart
    if (p.startsWith('/cart')) return _cart(r, match);

    // delivery & gift
    if (p == '/delivery/zones') return ok(seed.zones);
    if (p == '/gift/options') return ok(seed.giftOptions);
    if (p == '/gift/message/validate') {
      final msg = (r.body?['message'] as String?) ?? '';
      return ok({'valid': msg.length <= 300, 'length': msg.length, 'maxLength': 300, 'issues': msg.length > 300 ? [{'code': 'gift.message_too_long', 'message': 'Mesaj çox uzundur', 'field': 'message'}] : []});
    }

    // checkout & payments
    if (p.startsWith('/checkout')) return _checkout(r, match);
    mm = match(r'/orders/([^/]+)/payment(/retry)?');
    if (mm != null) {
      final o = orders.firstWhere((x) => x['number'] == mm!.group(1), orElse: () => throw MockError(404, 'order.not_found', 'Sifariş tapılmadı'));
      final pay = o['payment'] as Map<String, dynamic>;
      if (mm.group(2) != null) {
        pay['method'] = r.body?['method'] ?? pay['method'];
        pay['status'] = 'Pending';
        o['_polls'] = 0;
      } else if (pay['status'] == 'Pending' && (o['_polls'] = (o['_polls'] as int? ?? 0) + 1) >= 2) {
        pay['status'] = 'Captured';
        o['status'] = 'Paid';
      }
      return ok({'orderNumber': o['number'], 'orderStatus': o['status'], 'method': pay['method'], 'status': pay['status'], 'amount': (o['totals'] as Map)['total'], 'redirectUrl': 'https://epoint.az/mock/${o['number']}'});
    }
    if (p == '/orders/track') {
      final o = orders.where((x) => x['number'] == r.q('number')).firstOrNull ?? (throw MockError(404, 'order.not_found', 'Sifariş tapılmadı'));
      return ok({'order': o, 'isRecipientView': false, 'whatsAppUrl': 'https://wa.me/994500000000'});
    }

    // studio
    if (p.startsWith('/studio')) return _studio(r, match);

    throw MockError(404, 'general.not_found', 'Mock: ${r.method} $p');
  }

  // ---------------------------------------------------------------- helpers

  Map<String, dynamic> _signIn(MockRequest r, {required bool isNew}) {
    token = 'mock-session-${_id()}';
    user = {
      'id': 'u1',
      'fullName': (r.body?['fullName'] as String?)?.isNotEmpty ?? false ? r.body!['fullName'] : 'Aysel Məmmədova',
      'email': r.body?['email'] ?? (r.body?['identifier'] as String?)?.contains('@') == true ? r.body!['identifier'] : 'aysel@example.com',
      'phone': r.body?['phone'] ?? '+994501234567',
      'emailVerified': true,
      'phoneVerified': true,
      'language': r.lang,
      'marketingConsent': false,
      'hasPassword': true,
      'hasStyleProfile': false,
      'roles': ['Customer'],
      'permissions': <String>[],
    };
    return {'sessionToken': token, 'expiresAt': DateTime.now().add(const Duration(days: 30)).toUtc().toIso8601String(), 'isNewUser': isNew, 'user': user};
  }

  Map<String, dynamic> _me(MockRequest r) {
    if (token == null || r.token != token || user == null) throw MockError(401, 'auth.unauthenticated', 'Daxil olun');
    return user!;
  }

  Map<String, dynamic> _list(MockRequest r) {
    var items = seed.products.toList();
    final cat = r.q('category');
    if (cat != null) items = items.where((x) => x['category'] == cat).toList();
    final sizes = r.qs('sizes');
    if (sizes.isNotEmpty) items = items.where((x) => (x['sizes'] as List).any(sizes.contains)).toList();
    if (r.q('chip') == 'Sale') items = items.where((x) => x['compareAt'] != null).toList();
    switch (r.q('sort')) {
      case 'PriceAsc':
        items.sort((a, b) => (a['price'] as num).compareTo(b['price'] as num));
      case 'PriceDesc':
        items.sort((a, b) => (b['price'] as num).compareTo(a['price'] as num));
    }
    final page = int.tryParse(r.q('page') ?? '1') ?? 1, size = int.tryParse(r.q('pageSize') ?? '12') ?? 12;
    final slice = items.skip((page - 1) * size).take(size).map(seed.card).toList();
    return {
      'items': slice,
      'page': page,
      'pageSize': size,
      'totalCount': items.length,
      'hasMore': page * size < items.length,
      'facets': seed.facets,
    };
  }

  Map<String, dynamic> _cartJson() {
    final lines = <Map<String, dynamic>>[];
    var subtotal = 0.0;
    for (final i in cart) {
      Map<String, dynamic> line;
      if (i['designId'] != null) {
        final d = designs[i['designId']]!;
        final unit = ((d['quote'] as Map?)?['unitPrice'] as num?)?.toDouble() ?? 79.0;
        line = {'id': i['id'], 'kind': 'Custom', 'designId': i['designId'], 'name': d['name'] == '' ? 'Studio dizaynı' : d['name'], 'imageUrl': (d['mockupUrls'] as List).firstOrNull, 'unitPrice': unit, 'quantity': i['quantity'], 'lineTotal': unit * (i['quantity'] as int), 'stock': 'MadeToOrder', 'leadTimeDays': 7, 'adjustments': []};
      } else {
        final v = seed.variant(i['variantId'] as String)!;
        final unit = (v.product['price'] as num).toDouble();
        line = {
          'id': i['id'], 'kind': 'Stock', 'productId': v.product['id'], 'productSlug': v.product['slug'], 'variantId': i['variantId'], 'name': v.product['name'], 'color': v.color['name'],
          'colorHex': v.color['hex'], 'size': v.size, 'imageUrl': v.product['image'], 'unitPrice': unit, 'quantity': i['quantity'], 'lineTotal': unit * (i['quantity'] as int),
          'stock': 'InStock', 'stockLeft': 12, 'adjustments': [],
        };
      }
      subtotal += (line['lineTotal'] as num).toDouble();
      lines.add(line);
    }
    final discount = promo == null ? 0.0 : (subtotal * 0.1).roundToDouble();
    final total = subtotal - discount;
    return {
      'id': 'cart-1',
      'items': lines,
      'itemsCount': cart.fold<int>(0, (a, i) => a + (i['quantity'] as int)),
      'promo': promo == null ? null : {'code': promo, 'valid': true},
      'isGift': isGift,
      'totals': {'subtotal': subtotal, 'discount': discount, 'total': total, 'vatIncluded': (total * 0.18 / 1.18 * 100).roundToDouble() / 100},
      'freeDelivery': {'zoneCode': 'BAKU', 'threshold': 150, 'remaining': math.max(0, 150 - total), 'qualifies': total >= 150},
      'canCheckout': cart.isNotEmpty,
      'completeTheLook': seed.products.take(3).map(seed.card).toList(),
      'bestsellers': seed.products.map(seed.card).toList(),
    };
  }

  MockResponse _cart(MockRequest r, RegExpMatch? Function(String) match) {
    final m = r.method, p = r.path;
    if (p == '/cart' && m == 'GET') return ok(_cartJson());
    if (p == '/cart/items' && m == 'POST') {
      final variantId = r.body?['variantId'] as String?, designId = r.body?['designId'] as String?;
      final existing = cart.where((i) => (variantId != null && i['variantId'] == variantId) || (designId != null && i['designId'] == designId)).firstOrNull;
      if (existing != null) {
        existing['quantity'] = (existing['quantity'] as int) + ((r.body?['quantity'] as int?) ?? 1);
      } else {
        cart.add({'id': _id(), 'variantId': variantId, 'designId': designId, 'quantity': r.body?['quantity'] ?? 1});
      }
      return ok(_cartJson());
    }
    final mm = match(r'/cart/items/([^/]+)');
    if (mm != null) {
      if (m == 'DELETE') {
        cart.removeWhere((i) => i['id'] == mm.group(1));
      } else {
        cart.firstWhere((i) => i['id'] == mm.group(1))['quantity'] = r.body?['quantity'];
      }
      return ok(_cartJson());
    }
    if (p == '/cart/promo') {
      if (m == 'DELETE') {
        promo = null;
      } else if ((r.body?['code'] as String?)?.toUpperCase() == 'HOO10') {
        promo = 'HOO10';
      } else {
        throw MockError(422, 'promo.not_found', 'Belə promo kod yoxdur');
      }
      return ok(_cartJson());
    }
    if (p == '/cart/gift') {
      isGift = r.body?['isGift'] == true;
      return ok(_cartJson());
    }
    throw MockError(404, 'general.not_found', 'cart');
  }

  Map<String, dynamic> _checkoutJson(Map<String, dynamic> c) {
    final cartJson = _cartJson();
    final totals = cartJson['totals'] as Map<String, dynamic>;
    final zone = seed.zones.where((z) => z['id'] == c['zoneId']).firstOrNull;
    final sub = (totals['total'] as num).toDouble();
    final delivery = zone == null ? 0.0 : (sub >= 150 ? 0.0 : (zone['price'] as num).toDouble());
    final missing = [
      if (c['contact'] == null) 'contact',
      if (isGift && c['gift'] == null) 'gift',
      if (zone == null) 'delivery',
      if (zone != null && zone['kind'] != 'Pickup' && c['address'] == null) 'address',
      if (zone != null && zone['supportsTimeSlots'] == true && c['slot'] == null) 'slot',
      if (c['paymentMethod'] == null) 'payment',
    ];
    final cod = sub + delivery <= 300;
    return {
      'id': c['id'],
      'expiresAt': DateTime.now().add(const Duration(minutes: 30)).toUtc().toIso8601String(),
      'items': cartJson['items'],
      'contact': c['contact'],
      'gift': c['gift'],
      'zone': zone,
      'address': c['address'],
      'slot': c['slot'],
      'paymentMethod': c['paymentMethod'],
      'promoCode': promo,
      'totals': {...totals, 'delivery': delivery, 'total': sub + delivery, 'giftPackaging': 0, 'giftPackagingSaving': 0, 'greetingCard': 0, 'freeDeliveryRemaining': math.max(0, 150 - sub)},
      'estimatedDeliveryFrom': DateTime.now().add(const Duration(days: 1)).toIso8601String().substring(0, 10),
      'estimatedDeliveryTo': DateTime.now().add(const Duration(days: 2)).toIso8601String().substring(0, 10),
      'zones': seed.zones,
      'paymentMethods': [
        {'method': 'ApplePay', 'available': true},
        {'method': 'Card', 'available': true},
        {'method': 'CashOnDelivery', 'available': cod, 'unavailableReasonCode': cod ? null : 'checkout.cod_limit_exceeded', 'unavailableReason': cod ? null : 'Qapıda ödəniş 300 ₼-a qədərdir'},
      ],
      'savedCards': <Object>[],
      'savedAddresses': user == null ? <Object>[] : seed.addresses,
      'hasCustomItems': cart.any((i) => i['designId'] != null),
      'missingSteps': missing,
      'canPlaceOrder': missing.isEmpty && cart.isNotEmpty,
    };
  }

  MockResponse _checkout(MockRequest r, RegExpMatch? Function(String) match) {
    if (r.path == '/checkout' && r.method == 'POST') {
      if (cart.isEmpty) throw MockError(422, 'cart.empty', 'Səbət boşdur');
      final c = <String, dynamic>{'id': _id()};
      if (user != null) c['contact'] = {'fullName': user!['fullName'], 'phone': user!['phone'], 'email': user!['email']};
      checkouts[c['id'] as String] = c;
      return ok(_checkoutJson(c));
    }
    final mm = match(r'/checkout/([^/]+)(/[a-z-]+)?');
    final c = checkouts[mm?.group(1)] ?? (throw MockError(404, 'checkout.session_not_found', 'Sessiya tapılmadı'));
    final b = r.body ?? const {};
    switch (mm!.group(2)) {
      case null:
        return ok(_checkoutJson(c));
      case '/contact':
        if (!RegExp(r'^\+994\d{9}$').hasMatch(b['phone'] as String? ?? '')) throw MockError(400, 'general.validation', 'Yoxlayın', errors: {'phone': ['Nömrə düzgün deyil']});
        c['contact'] = b;
      case '/gift':
        c['gift'] = b['isGift'] == true ? {...b, 'packaging': 'HOO qutusu', 'cardType': 'Çap olunmuş'} : null;
      case '/delivery':
        c['zoneId'] = b['zoneId'];
        c['address'] = b['address'] ?? (b['savedAddressId'] != null ? (seed.addresses.first['address']) : null);
      case '/slots':
        return ok(seed.slots());
      case '/slot':
        c['slot'] = {'date': b['date'], 'windowId': b['windowId'], 'start': '10:00:00', 'end': '14:00:00'};
      case '/payment-method':
        c['paymentMethod'] = b['method'];
      case '/place-order':
        final json = _checkoutJson(c);
        if (json['canPlaceOrder'] != true) throw MockError(422, 'checkout.contact_required', 'Addımları tamamlayın');
        final number = 'HOO-${++_seq}';
        final method = c['paymentMethod'] as String;
        final online = method != 'CashOnDelivery';
        orders.insert(0, {
          'id': _id(), 'number': number, 'status': online ? 'New' : 'New', 'types': ['Store'], 'createdAt': DateTime.now().toUtc().toIso8601String(), 'source': 'App',
          'contact': c['contact'], 'delivery': {'zoneCode': 'BAKU', 'zoneName': (json['zone'] as Map?)?['name'] ?? '', 'kind': (json['zone'] as Map?)?['kind'] ?? 'Courier', 'address': c['address']},
          'lines': [for (final l in json['items'] as List) {'id': l['id'], 'kind': l['kind'], 'name': l['name'], 'color': l['color'], 'size': l['size'], 'imageUrl': l['imageUrl'], 'unitPrice': l['unitPrice'], 'quantity': l['quantity'], 'lineTotal': l['lineTotal'], 'nonReturnable': l['kind'] == 'Custom'}],
          'adjustments': [], 'totals': {...(json['totals'] as Map), 'greetingCard': 0, 'giftPackaging': 0},
          'payment': {'method': method, 'status': online ? 'Pending' : 'Pending'},
          'timeline': [{'type': 'Placed', 'status': 'New', 'actor': 'Customer', 'occurredAt': DateTime.now().toUtc().toIso8601String()}],
          'canChangeSlot': false, 'canReturn': false, 'canPay': online,
        });
        cart.clear();
        promo = null;
        return ok({
          'orderId': orders.first['id'], 'orderNumber': number, 'status': 'New', 'total': (json['totals'] as Map)['total'], 'paymentMethod': method, 'paymentStatus': 'Pending',
          'paymentRedirectUrl': online ? 'https://epoint.az/mock/$number' : null, 'giftReceiptCode': c['gift'] == null ? null : 'G-$number',
        });
    }
    return ok(_checkoutJson(c));
  }

  MockResponse _account(MockRequest r, RegExpMatch? Function(String) match) {
    _me(r);
    final p = r.path, m = r.method;
    if (p == '/account/overview') return ok({'fullName': user!['fullName'], 'ordersCount': orders.length, 'designsCount': designs.length, 'wishlistCount': wishlist.length, 'activeOrders': orders.length});
    if (p == '/account/profile') {
      user = {...user!, ...?r.body};
      return ok({'code': 'ok', 'message': 'OK'});
    }
    if (p == '/account/style-profile') return ok(m == 'PUT' ? r.body : {'heightCm': 178, 'usualSize': 'M', 'preferredFit': 'Oversized', 'favoriteColors': ['Black', 'Forest'], 'styles': ['Minimal']});
    if (p == '/account/size-recommendations') return ok(<Object>[]);
    if (p.startsWith('/account/payment-methods')) return m == 'GET' ? ok(<Object>[]) : MockResponse(204);
    if (p == '/account/notification-preferences') {
      if (m == 'PUT') return ok(r.body ?? const <Object>[]);
      return ok([
        for (final t in ['Orders', 'Delivery', 'Alerts', 'Marketing'])
          for (final ch in ['Email', 'Sms', 'WhatsApp', 'Push']) {'topic': t, 'channel': ch, 'enabled': t != 'Marketing', 'locked': t == 'Orders' && ch == 'Sms'},
      ]);
    }
    if (p.startsWith('/account/addresses')) return m == 'GET' ? ok(seed.addresses) : ok(seed.addresses.first);
    if (p == '/account/orders') {
      return ok({
        'items': [
          for (final o in orders)
            {'id': o['id'], 'number': o['number'], 'status': o['status'], 'types': o['types'], 'customerName': '', 'customerPhone': '', 'total': (o['totals'] as Map)['total'], 'paymentMethod': (o['payment'] as Map)['method'], 'paymentStatus': (o['payment'] as Map)['status'], 'zoneCode': 'BAKU', 'itemsCount': (o['lines'] as List).length, 'createdAt': o['createdAt'], 'thumbnailUrl': ((o['lines'] as List).firstOrNull as Map?)?['imageUrl']},
        ],
        'page': 1, 'pageSize': 20, 'totalCount': orders.length, 'totalPages': 1, 'hasMore': false,
      });
    }
    final mm = match(r'/account/orders/([^/]+)');
    if (mm != null) return ok(orders.firstWhere((o) => o['number'] == mm.group(1), orElse: () => throw MockError(404, 'order.not_found', 'Sifariş tapılmadı')));
    if (p == '/account/returns') return ok(<Object>[]);
    throw MockError(404, 'general.not_found', 'account');
  }

  MockResponse _studio(MockRequest r, RegExpMatch? Function(String) match) {
    final p = r.path, m = r.method;
    if (p == '/studio/config') return ok(seed.studioConfig);
    if (p == '/studio/price') return ok(_quote(r.body?['spec'] as Map<String, dynamic>, (r.body?['layers'] as List?) ?? const []));
    if (p == '/studio/uploads') return ok({'id': 'up-${_id()}', 'url': 'asset:assets/images/look-1.jpg', 'contentType': 'image/jpeg', 'widthPx': 2400, 'heightPx': 3000, 'isVector': false, 'maxPrintWidthCmAtRecommendedDpi': 20});
    if (p == '/studio/designs' && m == 'GET') {
      return ok([
        for (final d in designs.values)
          {'id': d['id'], 'name': d['name'], 'status': d['status'], 'mockupUrl': (d['mockupUrls'] as List).firstOrNull, 'total': (d['quote'] as Map?)?['total'], 'updatedAt': d['updatedAt']},
      ]);
    }
    if (p == '/studio/designs' && m == 'POST') {
      final id = 'd-${_id()}';
      designs[id] = _design(id, r.body!);
      return MockResponse(201, designs[id]);
    }
    if (p.startsWith('/studio/shared/')) return ok(designs.values.firstOrNull ?? (throw MockError(404, 'studio.design_not_found', 'Dizayn tapılmadı')));
    final mm = match(r'/studio/designs/([^/]+)(/[a-z]+)?');
    final d = designs[mm?.group(1)] ?? (throw MockError(404, 'studio.design_not_found', 'Dizayn tapılmadı'));
    switch (mm!.group(2)) {
      case null when m == 'DELETE':
        designs.remove(d['id']);
        return MockResponse(204);
      case null when m == 'PATCH':
        final b = r.body ?? const {};
        designs[d['id'] as String] = _design(d['id'] as String, {'name': b['name'] ?? d['name'], 'spec': b['spec'] ?? d['spec'], 'layers': b['layers'] ?? d['layers']});
        return ok(designs[d['id']]);
      case '/mockups':
        (d['mockupUrls'] as List).add('asset:assets/images/cat-design.jpg');
        return ok(d);
      case '/share':
        return ok('https://hoo.az/studio/shared/${d['id']}');
      case '/duplicate':
        final id = 'd-${_id()}';
        designs[id] = {...d, 'id': id};
        return ok(designs[id]);
      case '/resubmit':
        d['status'] = 'Submitted';
        return ok(d);
    }
    return ok(d);
  }

  Map<String, dynamic> _design(String id, Map<String, dynamic> b) => {
        'id': id,
        'name': b['name'] ?? '',
        'status': 'Draft',
        'editable': true,
        'spec': b['spec'],
        'layers': b['layers'] ?? const <Object>[],
        'pricingVersionId': 'pv-1',
        'quote': _quote((b['spec'] as Map).cast<String, dynamic>(), (b['layers'] as List?) ?? const []),
        'mockupUrls': <String>[],
        'imageRightsConfirmed': false,
        'createdAt': DateTime.now().toUtc().toIso8601String(),
        'updatedAt': DateTime.now().toUtc().toIso8601String(),
        'uploads': [
          for (final l in (b['layers'] as List?) ?? const [])
            if ((l as Map)['uploadId'] != null) {'id': l['uploadId'], 'url': 'asset:assets/images/look-1.jpg', 'contentType': 'image/jpeg', 'widthPx': 2400, 'heightPx': 3000, 'isVector': false},
        ],
      };

  /// The fake server's price calculator (a simplified StudioPriceCalculator).
  Map<String, dynamic> _quote(Map<String, dynamic> spec, List<dynamic> layers) {
    final base = (seed.studioConfig['baseProducts'] as List).cast<Map<String, dynamic>>().firstWhere((b) => b['code'] == spec['baseCode'], orElse: () => (seed.studioConfig['baseProducts'] as List).first as Map<String, dynamic>);
    final qty = (spec['quantity'] as int?) ?? 1;
    final breakdown = <Map<String, dynamic>>[
      {'kind': 'Base', 'code': base['code'], 'label': base['name'], 'unitAmount': base['price']},
      for (final l in layers) {'kind': 'Print', 'code': (l as Map)['placement'], 'label': 'Çap · ${l['placement']}', 'detail': '${(l['widthCm'] as num).toStringAsFixed(0)}×${(l['heightCm'] as num).toStringAsFixed(0)} sm', 'unitAmount': 12},
      if (spec['fabricCode'] == 'HEAVY') {'kind': 'Fabric', 'code': 'HEAVY', 'label': 'Ağır pambıq', 'unitAmount': 8},
    ];
    final unit = breakdown.fold<double>(0, (a, b) => a + (b['unitAmount'] as num).toDouble());
    final volumePercent = qty >= 10 ? 10 : (qty >= 5 ? 5 : 0);
    final gross = unit * qty;
    final volume = gross * volumePercent / 100;
    final rush = spec['rush'] == true ? 15.0 : 0.0;
    final setup = layers.isEmpty ? 0.0 : 5.0;
    return {
      'unitPrice': unit, 'quantity': qty, 'breakdown': breakdown, 'volumeDiscountPercent': volumePercent, 'volumeDiscount': volume, 'rushFee': rush, 'setupFee': setup,
      'total': gross - volume + rush + setup, 'leadTimeMinDays': spec['rush'] == true ? 3 : 5, 'leadTimeMaxDays': spec['rush'] == true ? 4 : 7,
      'estimatedDeliveryFrom': DateTime.now().add(const Duration(days: 6)).toIso8601String().substring(0, 10),
      'estimatedDeliveryTo': DateTime.now().add(const Duration(days: 9)).toIso8601String().substring(0, 10),
      'warnings': [
        for (final l in layers)
          if ((l as Map)['kind'] == 'Image') {'layerId': l['id'], 'effectiveDpi': ((2400 / ((l['widthCm'] as num) / 2.54))).floor(), 'level': (l['widthCm'] as num) > 25 ? 'warning' : 'ok'},
      ],
    };
  }
}
