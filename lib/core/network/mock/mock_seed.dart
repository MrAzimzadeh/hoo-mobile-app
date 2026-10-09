/// Seed data for [MockBackendAdapter] — shaped exactly like the Hoo.Api responses. Images are bundled brand photos
/// (`asset:` URLs, rendered by `HooNetworkImage`).
class MockSeed {
  static const _img = ['asset:assets/images/cat-hoodies.jpg', 'asset:assets/images/look-1.jpg', 'asset:assets/images/look-2.jpg', 'asset:assets/images/look-3.jpg', 'asset:assets/images/look-4.jpg', 'asset:assets/images/cat-tshirts.jpg'];

  final store = {
    'mode': 'Live',
    'launchAt': null,
    'contacts': {'phone': '+994120000000', 'whatsApp': '+994500000000', 'email': 'hello@hoo.az', 'instagram': 'hoo.az', 'tikTok': 'hoo.az', 'telegram': 'hoo_az'},
    'currency': 'AZN',
    'defaultLanguage': 'az',
    'languages': ['az', 'ru', 'en', 'tr'],
    'vatRate': 0.18,
  };

  final comingSoon = {
    'mode': 'ComingSoon',
    'launchAt': '2026-12-01T12:00:00+04:00',
    'title': 'Tezliklə',
    'subtitle': 'Bakıda doğulan streetwear.',
    'perks': ['İlk drop-a erkən giriş', 'Siyahıdakılara xüsusi endirim', '3D Studio-ya ilk baxış'],
    'contacts': {'phone': '+994120000000', 'whatsApp': '+994500000000', 'email': 'hello@hoo.az', 'instagram': 'hoo.az', 'tikTok': 'hoo.az', 'telegram': 'hoo_az'},
  };

  final colors = <String, Map<String, dynamic>>{
    'BLK': {'id': 'c-blk', 'code': 'BLK', 'name': 'Qara', 'hex': '#121212', 'family': 'Black'},
    'FOR': {'id': 'c-for', 'code': 'FOR', 'name': 'Meşə yaşılı', 'hex': '#1C3829', 'family': 'Forest'},
    'CRM': {'id': 'c-crm', 'code': 'CRM', 'name': 'Krem', 'hex': '#EDE6D6', 'family': 'Cream'},
    'GRY': {'id': 'c-gry', 'code': 'GRY', 'name': 'Boz', 'hex': '#9A9A9A', 'family': 'Grey'},
  };

  late final products = <Map<String, dynamic>>[
    _p('p1', 'essential-oversized-hoodie', 'Essential Oversized Hudi', 'Hoodie', 'hoodies', 119, null, ['BLK', 'FOR', 'CRM'], 0, badges: ['NEW_DROP'], studio: true),
    _p('p2', 'heavyweight-zip-hoodie', 'Heavyweight Zip Hudi', 'ZipHoodie', 'hoodies', 139, 159, ['BLK', 'GRY'], 1, badges: ['BESTSELLER']),
    _p('p3', 'boxy-tee', 'Boxy Futbolka', 'TShirt', 't-shirts', 49, null, ['CRM', 'BLK', 'FOR', 'GRY'], 5, badges: ['NEW'], studio: true),
    _p('p4', 'crew-sweatshirt', 'Crew Svitşot', 'Sweatshirt', 'sweatshirts', 99, null, ['FOR', 'CRM'], 2),
    _p('p5', 'relaxed-sweatpants', 'Relaxed İdman Şalvarı', 'Sweatpants', 'sweatpants', 89, 109, ['BLK', 'GRY'], 3),
    _p('p6', 'logo-shorts', 'Logo Şort', 'Shorts', 'shorts', 59, null, ['BLK'], 4),
  ];

  Map<String, dynamic> _p(String id, String slug, String name, String type, String category, num price, num? compareAt, List<String> colorCodes, int img, {List<String> badges = const [], bool studio = false}) => {
        'id': id,
        'slug': slug,
        'name': name,
        'type': type,
        'category': category,
        'price': price,
        'compareAt': compareAt,
        'image': _img[img % _img.length],
        'colors': colorCodes,
        'sizes': ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        'badges': badges,
        'studio': studio,
      };

  Map<String, dynamic>? bySlug(String slug) => products.where((p) => p['slug'] == slug).firstOrNull;
  Map<String, dynamic>? byId(String id) => products.where((p) => p['id'] == id).firstOrNull;

  /// Variant ids are `<productId>:<colorCode>:<size>`.
  ({Map<String, dynamic> product, Map<String, dynamic> color, String size})? variant(String id) {
    final parts = id.split(':');
    if (parts.length != 3) return null;
    final p = byId(parts[0]);
    final c = colors[parts[1]];
    return p == null || c == null ? null : (product: p, color: c, size: parts[2]);
  }

  Map<String, dynamic> card(Map<String, dynamic> p) => {
        'id': p['id'],
        'slug': p['slug'],
        'name': p['name'],
        'price': p['price'],
        'compareAtPrice': p['compareAt'],
        'discountPercent': p['compareAt'] == null ? null : (100 - (p['price'] as num) * 100 / (p['compareAt'] as num)).round(),
        'badges': [...(p['badges'] as List), if (p['compareAt'] != null) 'SALE'],
        'colorsCount': (p['colors'] as List).length,
        'defaultColor': colors[(p['colors'] as List).first],
        'colorHexes': [for (final c in p['colors'] as List) colors[c]!['hex']],
        'imageUrl': p['image'],
        'rating': 4.6,
        'reviewCount': 24,
        'inStock': true,
      };

  Map<String, dynamic> detail(Map<String, dynamic> p, {bool wishlisted = false}) => {
        ...card(p),
        'description': 'Ağır pambıqdan, sakit və dəqiq kəsimli. Hər gün geyinmək üçün HOO əsası.',
        'fabricAndCare': '100% pambıq, 420 q/m². 30°C-də tərsinə yuyun.',
        'sizeAndFit': 'Oversized kəsim. Model 186 sm-dir və M ölçüsü geyinir.',
        'category': {'id': 'cat-${p['category']}', 'slug': p['category'], 'name': p['category'], 'productCount': 3},
        'collection': {'id': 'col-1', 'slug': 'quiet-strength', 'name': 'Quiet Strength'},
        'productType': p['type'],
        'fit': 'Oversized',
        'fabric': 'Ağır pambıq',
        'tags': ['Minimal'],
        'colors': [
          for (final (i, code) in (p['colors'] as List<String>).indexed)
            {
              'color': colors[code],
              'images': [_img[(i + 1) % _img.length], p['image'], _img[(i + 3) % _img.length]],
              'variants': [
                for (final s in p['sizes'] as List<String>)
                  {'id': '${p['id']}:$code:$s', 'size': s, 'sku': '${p['slug']}-$code-$s', 'price': p['price'], 'inStock': s != 'XS', 'lowStockLeft': s == 'XL' ? 2 : null, 'preorder': s == 'XS'},
              ],
            },
        ],
        'sizeChart': [
          for (final (i, s) in ['XS', 'S', 'M', 'L', 'XL', 'XXL'].indexed)
            {'size': s, 'chestCm': 56 + i * 3, 'lengthCm': 68 + i * 2, 'sleeveCm': 58 + i, 'chestIn': (56 + i * 3) / 2.54, 'lengthIn': (68 + i * 2) / 2.54, 'sleeveIn': (58 + i) / 2.54},
        ],
        'recommendedSize': {'size': 'M', 'basis': 'UsualSize', 'fit': 'Oversized'},
        'deliveryPromise': {'orderWithinMinutes': 200, 'deliveryDate': DateTime.now().add(const Duration(days: 1)).toIso8601String().substring(0, 10), 'zoneCode': 'BAKU'},
        'availableInStudio': p['studio'],
        'isWishlisted': wishlisted,
        'model3D': null,
      };

  List<Map<String, dynamic>> categories(String lang) => [
        {'id': 'cat-hoodies', 'slug': 'hoodies', 'name': 'Hudilər', 'productCount': 2},
        {'id': 'cat-t-shirts', 'slug': 't-shirts', 'name': 'Futbolkalar', 'productCount': 1},
        {'id': 'cat-sweatshirts', 'slug': 'sweatshirts', 'name': 'Svitşotlar', 'productCount': 1},
        {'id': 'cat-sweatpants', 'slug': 'sweatpants', 'name': 'Şalvarlar', 'productCount': 1},
      ];

  final collections = [
    {'id': 'col-1', 'slug': 'quiet-strength', 'name': 'Quiet Strength', 'description': 'Payız 2026 — meşə yaşılı və krem.'},
    {'id': 'col-2', 'slug': 'essentials', 'name': 'Essentials', 'description': 'Hər gün üçün əsaslar.'},
  ];

  late final looks = [
    {'id': 'look-1', 'title': 'Forest layers', 'imageUrl': 'asset:assets/images/look-2.jpg', 'products': products.take(3).map(card).toList()},
    {'id': 'look-2', 'title': 'Monochrome', 'imageUrl': 'asset:assets/images/look-4.jpg', 'products': products.skip(2).take(3).map(card).toList()},
  ];

  final reviews = [
    {'id': 'r1', 'authorName': 'Nərmin', 'rating': 5, 'title': 'Mükəmməl kəsim', 'body': 'Parça ağırdır, oversized kəsim çox yaxşı oturur.', 'createdAt': '2026-09-28T10:00:00Z'},
    {'id': 'r2', 'authorName': 'Elvin', 'rating': 4, 'title': null, 'body': 'Rəngi şəkildəki kimidir. Bir ölçü kiçik götürmək olar.', 'createdAt': '2026-09-15T10:00:00Z'},
  ];

  final facets = {
    'categories': [
      {'value': 'hoodies', 'label': 'Hudilər', 'count': 2},
      {'value': 't-shirts', 'label': 'Futbolkalar', 'count': 1},
    ],
    'sizes': [for (final s in ['XS', 'S', 'M', 'L', 'XL', 'XXL']) {'value': s, 'label': s, 'count': 6}],
    'colors': [
      {'value': 'BLK', 'label': 'Qara', 'count': 5},
      {'value': 'FOR', 'label': 'Meşə yaşılı', 'count': 3},
      {'value': 'CRM', 'label': 'Krem', 'count': 3},
      {'value': 'GRY', 'label': 'Boz', 'count': 3},
    ],
    'fits': [
      {'value': 'Oversized', 'label': 'Oversized', 'count': 4},
      {'value': 'Regular', 'label': 'Regular', 'count': 2},
    ],
    'fabrics': [
      {'value': 'HEAVY', 'label': 'Ağır pambıq', 'count': 4},
    ],
    'minPrice': 49,
    'maxPrice': 159,
  };

  final zones = [
    {'id': 'z-baku', 'code': 'BAKU', 'name': 'Bakı — kuryer', 'kind': 'Courier', 'price': 5, 'freeFrom': 150, 'etaMinDays': 1, 'etaMaxDays': 2, 'supportsTimeSlots': true, 'cashOnDeliveryAllowed': true},
    {'id': 'z-regions', 'code': 'REGIONS', 'name': 'Regionlar — poçt', 'kind': 'Post', 'price': 8, 'etaMinDays': 3, 'etaMaxDays': 5, 'supportsTimeSlots': false, 'cashOnDeliveryAllowed': false},
    {'id': 'z-pickup', 'code': 'PICKUP', 'name': 'Showroom — Nizami küç.', 'kind': 'Pickup', 'price': 0, 'etaMinDays': 0, 'etaMaxDays': 1, 'readyInHours': 3, 'pickupAddress': 'Nizami küç. 10, Bakı', 'supportsTimeSlots': false, 'cashOnDeliveryAllowed': true},
  ];

  final giftOptions = {
    'packaging': [
      {'id': 'pk-1', 'code': 'BOX', 'name': 'HOO qutusu', 'description': 'Qara karton qutu, yaşıl lent', 'price': 0, 'isFree': true},
      {'id': 'pk-2', 'code': 'PREMIUM', 'name': 'Premium qutu', 'description': 'Maqnitli qapaq, toxuma kağız', 'price': 10, 'isFree': false},
    ],
    'cardTypes': [
      {'id': 'ct-0', 'code': 'NONE', 'name': 'Kartsız', 'kind': 'None', 'price': 0, 'requiresMessage': false},
      {'id': 'ct-1', 'code': 'PRINTED', 'name': 'Çap olunmuş kart', 'kind': 'Printed', 'price': 3, 'requiresMessage': true},
    ],
    'cardDesigns': <Object>[],
    'occasions': ['Birthday', 'Anniversary', 'Novruz', 'NewYear', 'JustBecause'],
    'rules': {'enabled': true, 'hidePricesByDefault': true, 'allowForCustomOrders': false, 'maxMessageLength': 300, 'fromNameMaxLength': 60, 'freePackagingThreshold': 100, 'freePackagingOptionId': 'pk-1'},
  };

  final addresses = [
    {'id': 'a1', 'label': 'Ev', 'address': {'city': 'Bakı', 'district': 'Nəsimi', 'street': 'Rəşid Behbudov küç. 12', 'apartment': '24', 'courierNote': null}, 'isDefault': true},
  ];

  List<Map<String, dynamic>> slots() => [
        for (var d = 1; d <= 4; d++)
          {
            'date': DateTime.now().add(Duration(days: d)).toIso8601String().substring(0, 10),
            'windows': [
              {'windowId': 'w1', 'start': '10:00:00', 'end': '14:00:00', 'capacity': 10, 'available': d == 1 ? 0 : 4, 'selectable': d != 1},
              {'windowId': 'w2', 'start': '14:00:00', 'end': '18:00:00', 'capacity': 10, 'available': 6, 'selectable': true},
              {'windowId': 'w3', 'start': '18:00:00', 'end': '22:00:00', 'capacity': 10, 'available': 2, 'selectable': true},
            ],
          },
      ];

  late final studioConfig = {
    'pricingVersionId': 'pv-1',
    'pricingVersion': 1,
    'baseProducts': [
      _base('HOODIE', 'Hoodie', 'HOO Hudi', 79, ['Front', 'Back', 'LeftSleeve', 'RightSleeve', 'Hood']),
      _base('TEE', 'TShirt', 'HOO Futbolka', 39, ['Front', 'Back', 'LeftSleeve', 'RightSleeve']),
      _base('SWEAT', 'Sweatshirt', 'HOO Svitşot', 65, ['Front', 'Back', 'LeftSleeve', 'RightSleeve']),
    ],
    'fits': [
      {'fit': 'Oversized', 'surcharge': 0},
      {'fit': 'Regular', 'surcharge': 0},
      {'fit': 'Boxy', 'surcharge': 5},
    ],
    'features': [
      {'code': 'POCKET', 'name': 'Kenquru cibi', 'surcharge': 6},
      {'code': 'THUMB', 'name': 'Baş barmaq yeri', 'surcharge': 4},
    ],
    'fabrics': [
      {'code': 'STD', 'name': 'Pambıq 320', 'gsm': 320, 'surcharge': 0, 'included': true},
      {'code': 'HEAVY', 'name': 'Ağır pambıq 420', 'gsm': 420, 'surcharge': 8, 'included': false},
    ],
    'sizeSurcharges': [
      {'size': 'XXL', 'surcharge': 5},
    ],
    'printMethods': [
      {'code': 'DTF', 'name': 'DTF', 'maxWidthCm': 40, 'maxHeightCm': 50, 'tiers': [{'label': 'A4', 'maxWidthCm': 21, 'maxHeightCm': 30, 'price': 12}, {'label': 'A3', 'maxWidthCm': 30, 'maxHeightCm': 42, 'price': 18}]},
    ],
    'extras': {'rushFee': 15, 'rushLeadTimeDays': 3, 'customMeasurementsFee': 10, 'setupFee': 5, 'volumeTiers': [{'minQuantity': 5, 'percent': 5}, {'minQuantity': 10, 'percent': 10}]},
    'fonts': ['Inter', 'Archivo', 'Bebas', 'Space', 'Montserrat'],
    'maxUploadMegabytes': 20,
    'recommendedDpi': 150,
    'maxLayers': 10,
  };

  Map<String, dynamic> _base(String code, String type, String name, num price, List<String> placements) {
    const sizes = {'Front': (30, 40), 'Back': (34, 45), 'LeftSleeve': (9, 30), 'RightSleeve': (9, 30), 'Hood': (20, 14)};
    return {
      'code': code,
      'productType': type,
      'name': name,
      'price': price,
      'leadTimeMinDays': 5,
      'leadTimeMaxDays': 7,
      'fits': ['Oversized', 'Regular', 'Boxy'],
      'featureCodes': type == 'Hoodie' ? ['POCKET', 'THUMB'] : ['THUMB'],
      'fabricCodes': ['STD', 'HEAVY'],
      'colors': colors.values.toList(),
      'sizes': ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
      'printAreas': [for (final p in placements) {'placement': p, 'widthCm': sizes[p]!.$1, 'heightCm': sizes[p]!.$2}],
      'model': type,
      'template': null,
      'maxQuantity': 50,
      'variants': [
        for (final c in colors.values)
          for (final s in ['XS', 'S', 'M', 'L', 'XL', 'XXL']) {'colorId': c['id'], 'size': s, 'price': price, 'available': !(c['code'] == 'GRY' && s == 'XS')},
      ],
    };
  }
}
