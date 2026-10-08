// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ActiveDevicesPage]
class ActiveDevicesRoute extends PageRouteInfo<void> {
  const ActiveDevicesRoute({List<PageRouteInfo>? children})
    : super(ActiveDevicesRoute.name, initialChildren: children);

  static const String name = 'ActiveDevicesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ActiveDevicesPage();
    },
  );
}

/// generated route for
/// [AddressFormPage]
class AddressFormRoute extends PageRouteInfo<AddressFormRouteArgs> {
  AddressFormRoute({
    Key? key,
    SavedAddress? address,
    List<PageRouteInfo>? children,
  }) : super(
         AddressFormRoute.name,
         args: AddressFormRouteArgs(key: key, address: address),
         initialChildren: children,
       );

  static const String name = 'AddressFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddressFormRouteArgs>(
        orElse: () => const AddressFormRouteArgs(),
      );
      return AddressFormPage(key: args.key, address: args.address);
    },
  );
}

class AddressFormRouteArgs {
  const AddressFormRouteArgs({this.key, this.address});

  final Key? key;

  final SavedAddress? address;

  @override
  String toString() {
    return 'AddressFormRouteArgs{key: $key, address: $address}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddressFormRouteArgs) return false;
    return key == other.key && address == other.address;
  }

  @override
  int get hashCode => key.hashCode ^ address.hashCode;
}

/// generated route for
/// [AddressesPage]
class AddressesRoute extends PageRouteInfo<void> {
  const AddressesRoute({List<PageRouteInfo>? children})
    : super(AddressesRoute.name, initialChildren: children);

  static const String name = 'AddressesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddressesPage();
    },
  );
}

/// generated route for
/// [AlertsPage]
class AlertsRoute extends PageRouteInfo<void> {
  const AlertsRoute({List<PageRouteInfo>? children})
    : super(AlertsRoute.name, initialChildren: children);

  static const String name = 'AlertsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AlertsPage();
    },
  );
}

/// generated route for
/// [BagPage]
class BagRoute extends PageRouteInfo<void> {
  const BagRoute({List<PageRouteInfo>? children})
    : super(BagRoute.name, initialChildren: children);

  static const String name = 'BagRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BagPage();
    },
  );
}

/// generated route for
/// [CatalogListPage]
class CatalogListRoute extends PageRouteInfo<CatalogListRouteArgs> {
  CatalogListRoute({
    Key? key,
    String? category,
    String? collection,
    String? chip,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
         CatalogListRoute.name,
         args: CatalogListRouteArgs(
           key: key,
           category: category,
           collection: collection,
           chip: chip,
           title: title,
         ),
         rawQueryParams: {
           'category': category,
           'collection': collection,
           'chip': chip,
           'title': title,
         },
         initialChildren: children,
       );

  static const String name = 'CatalogListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<CatalogListRouteArgs>(
        orElse: () => CatalogListRouteArgs(
          category: queryParams.optString('category'),
          collection: queryParams.optString('collection'),
          chip: queryParams.optString('chip'),
          title: queryParams.optString('title'),
        ),
      );
      return CatalogListPage(
        key: args.key,
        category: args.category,
        collection: args.collection,
        chip: args.chip,
        title: args.title,
      );
    },
  );
}

class CatalogListRouteArgs {
  const CatalogListRouteArgs({
    this.key,
    this.category,
    this.collection,
    this.chip,
    this.title,
  });

  final Key? key;

  final String? category;

  final String? collection;

  final String? chip;

  final String? title;

  @override
  String toString() {
    return 'CatalogListRouteArgs{key: $key, category: $category, collection: $collection, chip: $chip, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CatalogListRouteArgs) return false;
    return key == other.key &&
        category == other.category &&
        collection == other.collection &&
        chip == other.chip &&
        title == other.title;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      category.hashCode ^
      collection.hashCode ^
      chip.hashCode ^
      title.hashCode;
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePasswordPage();
    },
  );
}

/// generated route for
/// [CheckoutConfirmationPage]
class CheckoutConfirmationRoute
    extends PageRouteInfo<CheckoutConfirmationRouteArgs> {
  CheckoutConfirmationRoute({
    Key? key,
    required String number,
    String? giftReceiptCode,
    List<PageRouteInfo>? children,
  }) : super(
         CheckoutConfirmationRoute.name,
         args: CheckoutConfirmationRouteArgs(
           key: key,
           number: number,
           giftReceiptCode: giftReceiptCode,
         ),
         rawPathParams: {'number': number},
         initialChildren: children,
       );

  static const String name = 'CheckoutConfirmationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CheckoutConfirmationRouteArgs>(
        orElse: () => CheckoutConfirmationRouteArgs(
          number: pathParams.getString('number'),
        ),
      );
      return CheckoutConfirmationPage(
        key: args.key,
        number: args.number,
        giftReceiptCode: args.giftReceiptCode,
      );
    },
  );
}

class CheckoutConfirmationRouteArgs {
  const CheckoutConfirmationRouteArgs({
    this.key,
    required this.number,
    this.giftReceiptCode,
  });

  final Key? key;

  final String number;

  final String? giftReceiptCode;

  @override
  String toString() {
    return 'CheckoutConfirmationRouteArgs{key: $key, number: $number, giftReceiptCode: $giftReceiptCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CheckoutConfirmationRouteArgs) return false;
    return key == other.key &&
        number == other.number &&
        giftReceiptCode == other.giftReceiptCode;
  }

  @override
  int get hashCode => key.hashCode ^ number.hashCode ^ giftReceiptCode.hashCode;
}

/// generated route for
/// [CheckoutPage]
class CheckoutRoute extends PageRouteInfo<void> {
  const CheckoutRoute({List<PageRouteInfo>? children})
    : super(CheckoutRoute.name, initialChildren: children);

  static const String name = 'CheckoutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CheckoutPage();
    },
  );
}

/// generated route for
/// [ComingSoonPage]
class ComingSoonRoute extends PageRouteInfo<void> {
  const ComingSoonRoute({List<PageRouteInfo>? children})
    : super(ComingSoonRoute.name, initialChildren: children);

  static const String name = 'ComingSoonRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ComingSoonPage();
    },
  );
}

/// generated route for
/// [DesignSystemPage]
class DesignSystemRoute extends PageRouteInfo<void> {
  const DesignSystemRoute({List<PageRouteInfo>? children})
    : super(DesignSystemRoute.name, initialChildren: children);

  static const String name = 'DesignSystemRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DesignSystemPage();
    },
  );
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [GiftReceiptPage]
class GiftReceiptRoute extends PageRouteInfo<GiftReceiptRouteArgs> {
  GiftReceiptRoute({Key? key, String? code, List<PageRouteInfo>? children})
    : super(
        GiftReceiptRoute.name,
        args: GiftReceiptRouteArgs(key: key, code: code),
        rawPathParams: {'code': code},
        initialChildren: children,
      );

  static const String name = 'GiftReceiptRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<GiftReceiptRouteArgs>(
        orElse: () => GiftReceiptRouteArgs(code: pathParams.optString('code')),
      );
      return GiftReceiptPage(key: args.key, code: args.code);
    },
  );
}

class GiftReceiptRouteArgs {
  const GiftReceiptRouteArgs({this.key, this.code});

  final Key? key;

  final String? code;

  @override
  String toString() {
    return 'GiftReceiptRouteArgs{key: $key, code: $code}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GiftReceiptRouteArgs) return false;
    return key == other.key && code == other.code;
  }

  @override
  int get hashCode => key.hashCode ^ code.hashCode;
}

/// generated route for
/// [HelpPage]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
    : super(HelpRoute.name, initialChildren: children);

  static const String name = 'HelpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HelpPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [MainShellPage]
class MainShellRoute extends PageRouteInfo<void> {
  const MainShellRoute({List<PageRouteInfo>? children})
    : super(MainShellRoute.name, initialChildren: children);

  static const String name = 'MainShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainShellPage();
    },
  );
}

/// generated route for
/// [MyDesignsPage]
class MyDesignsRoute extends PageRouteInfo<void> {
  const MyDesignsRoute({List<PageRouteInfo>? children})
    : super(MyDesignsRoute.name, initialChildren: children);

  static const String name = 'MyDesignsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyDesignsPage();
    },
  );
}

/// generated route for
/// [NotificationSettingsPage]
class NotificationSettingsRoute extends PageRouteInfo<void> {
  const NotificationSettingsRoute({List<PageRouteInfo>? children})
    : super(NotificationSettingsRoute.name, initialChildren: children);

  static const String name = 'NotificationSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationSettingsPage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [OrderDetailPage]
class OrderDetailRoute extends PageRouteInfo<OrderDetailRouteArgs> {
  OrderDetailRoute({
    Key? key,
    required String number,
    String? phone,
    List<PageRouteInfo>? children,
  }) : super(
         OrderDetailRoute.name,
         args: OrderDetailRouteArgs(key: key, number: number, phone: phone),
         rawPathParams: {'number': number},
         initialChildren: children,
       );

  static const String name = 'OrderDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<OrderDetailRouteArgs>(
        orElse: () =>
            OrderDetailRouteArgs(number: pathParams.getString('number')),
      );
      return OrderDetailPage(
        key: args.key,
        number: args.number,
        phone: args.phone,
      );
    },
  );
}

class OrderDetailRouteArgs {
  const OrderDetailRouteArgs({this.key, required this.number, this.phone});

  final Key? key;

  final String number;

  final String? phone;

  @override
  String toString() {
    return 'OrderDetailRouteArgs{key: $key, number: $number, phone: $phone}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrderDetailRouteArgs) return false;
    return key == other.key && number == other.number && phone == other.phone;
  }

  @override
  int get hashCode => key.hashCode ^ number.hashCode ^ phone.hashCode;
}

/// generated route for
/// [OrdersPage]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
    : super(OrdersRoute.name, initialChildren: children);

  static const String name = 'OrdersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrdersPage();
    },
  );
}

/// generated route for
/// [OtpPage]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    Key? key,
    String? phone,
    OtpPurpose purpose = OtpPurpose.login,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(
           key: key,
           phone: phone,
           purpose: purpose,
           onResult: onResult,
         ),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>(
        orElse: () => const OtpRouteArgs(),
      );
      return OtpPage(
        key: args.key,
        phone: args.phone,
        purpose: args.purpose,
        onResult: args.onResult,
      );
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    this.phone,
    this.purpose = OtpPurpose.login,
    this.onResult,
  });

  final Key? key;

  final String? phone;

  final OtpPurpose purpose;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phone: $phone, purpose: $purpose, onResult: $onResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpRouteArgs) return false;
    return key == other.key && phone == other.phone && purpose == other.purpose;
  }

  @override
  int get hashCode => key.hashCode ^ phone.hashCode ^ purpose.hashCode;
}

/// generated route for
/// [PersonalInfoPage]
class PersonalInfoRoute extends PageRouteInfo<void> {
  const PersonalInfoRoute({List<PageRouteInfo>? children})
    : super(PersonalInfoRoute.name, initialChildren: children);

  static const String name = 'PersonalInfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PersonalInfoPage();
    },
  );
}

/// generated route for
/// [ProductPage]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    Key? key,
    required String slug,
    ProductCard? preview,
    String heroTagPrefix = 'product',
    List<PageRouteInfo>? children,
  }) : super(
         ProductRoute.name,
         args: ProductRouteArgs(
           key: key,
           slug: slug,
           preview: preview,
           heroTagPrefix: heroTagPrefix,
         ),
         rawPathParams: {'slug': slug},
         initialChildren: children,
       );

  static const String name = 'ProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProductRouteArgs>(
        orElse: () => ProductRouteArgs(slug: pathParams.getString('slug')),
      );
      return ProductPage(
        key: args.key,
        slug: args.slug,
        preview: args.preview,
        heroTagPrefix: args.heroTagPrefix,
      );
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.slug,
    this.preview,
    this.heroTagPrefix = 'product',
  });

  final Key? key;

  final String slug;

  final ProductCard? preview;

  final String heroTagPrefix;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, slug: $slug, preview: $preview, heroTagPrefix: $heroTagPrefix}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductRouteArgs) return false;
    return key == other.key &&
        slug == other.slug &&
        preview == other.preview &&
        heroTagPrefix == other.heroTagPrefix;
  }

  @override
  int get hashCode =>
      key.hashCode ^ slug.hashCode ^ preview.hashCode ^ heroTagPrefix.hashCode;
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    Key? key,
    String? identifier,
    String? token,
    List<PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(
           key: key,
           identifier: identifier,
           token: token,
         ),
         rawQueryParams: {'identifier': identifier, 'token': token},
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<ResetPasswordRouteArgs>(
        orElse: () => ResetPasswordRouteArgs(
          identifier: queryParams.optString('identifier'),
          token: queryParams.optString('token'),
        ),
      );
      return ResetPasswordPage(
        key: args.key,
        identifier: args.identifier,
        token: args.token,
      );
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key, this.identifier, this.token});

  final Key? key;

  final String? identifier;

  final String? token;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, identifier: $identifier, token: $token}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return key == other.key &&
        identifier == other.identifier &&
        token == other.token;
  }

  @override
  int get hashCode => key.hashCode ^ identifier.hashCode ^ token.hashCode;
}

/// generated route for
/// [ReturnRequestPage]
class ReturnRequestRoute extends PageRouteInfo<ReturnRequestRouteArgs> {
  ReturnRequestRoute({
    Key? key,
    required String number,
    String? phone,
    List<PageRouteInfo>? children,
  }) : super(
         ReturnRequestRoute.name,
         args: ReturnRequestRouteArgs(key: key, number: number, phone: phone),
         rawPathParams: {'number': number},
         initialChildren: children,
       );

  static const String name = 'ReturnRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ReturnRequestRouteArgs>(
        orElse: () =>
            ReturnRequestRouteArgs(number: pathParams.getString('number')),
      );
      return ReturnRequestPage(
        key: args.key,
        number: args.number,
        phone: args.phone,
      );
    },
  );
}

class ReturnRequestRouteArgs {
  const ReturnRequestRouteArgs({this.key, required this.number, this.phone});

  final Key? key;

  final String number;

  final String? phone;

  @override
  String toString() {
    return 'ReturnRequestRouteArgs{key: $key, number: $number, phone: $phone}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReturnRequestRouteArgs) return false;
    return key == other.key && number == other.number && phone == other.phone;
  }

  @override
  int get hashCode => key.hashCode ^ number.hashCode ^ phone.hashCode;
}

/// generated route for
/// [ReturnsPage]
class ReturnsRoute extends PageRouteInfo<void> {
  const ReturnsRoute({List<PageRouteInfo>? children})
    : super(ReturnsRoute.name, initialChildren: children);

  static const String name = 'ReturnsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReturnsPage();
    },
  );
}

/// generated route for
/// [ReviewsPage]
class ReviewsRoute extends PageRouteInfo<ReviewsRouteArgs> {
  ReviewsRoute({
    Key? key,
    required String slug,
    String? productName,
    List<PageRouteInfo>? children,
  }) : super(
         ReviewsRoute.name,
         args: ReviewsRouteArgs(key: key, slug: slug, productName: productName),
         rawPathParams: {'slug': slug},
         initialChildren: children,
       );

  static const String name = 'ReviewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ReviewsRouteArgs>(
        orElse: () => ReviewsRouteArgs(slug: pathParams.getString('slug')),
      );
      return ReviewsPage(
        key: args.key,
        slug: args.slug,
        productName: args.productName,
      );
    },
  );
}

class ReviewsRouteArgs {
  const ReviewsRouteArgs({this.key, required this.slug, this.productName});

  final Key? key;

  final String slug;

  final String? productName;

  @override
  String toString() {
    return 'ReviewsRouteArgs{key: $key, slug: $slug, productName: $productName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReviewsRouteArgs) return false;
    return key == other.key &&
        slug == other.slug &&
        productName == other.productName;
  }

  @override
  int get hashCode => key.hashCode ^ slug.hashCode ^ productName.hashCode;
}

/// generated route for
/// [SavedCardsPage]
class SavedCardsRoute extends PageRouteInfo<void> {
  const SavedCardsRoute({List<PageRouteInfo>? children})
    : super(SavedCardsRoute.name, initialChildren: children);

  static const String name = 'SavedCardsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SavedCardsPage();
    },
  );
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({Key? key, String? query, List<PageRouteInfo>? children})
    : super(
        SearchRoute.name,
        args: SearchRouteArgs(key: key, query: query),
        rawQueryParams: {'q': query},
        initialChildren: children,
      );

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<SearchRouteArgs>(
        orElse: () => SearchRouteArgs(query: queryParams.optString('q')),
      );
      return SearchPage(key: args.key, query: args.query);
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key, this.query});

  final Key? key;

  final String? query;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, query: $query}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchRouteArgs) return false;
    return key == other.key && query == other.query;
  }

  @override
  int get hashCode => key.hashCode ^ query.hashCode;
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [SharedWishlistPage]
class SharedWishlistRoute extends PageRouteInfo<SharedWishlistRouteArgs> {
  SharedWishlistRoute({
    Key? key,
    required String token,
    List<PageRouteInfo>? children,
  }) : super(
         SharedWishlistRoute.name,
         args: SharedWishlistRouteArgs(key: key, token: token),
         rawPathParams: {'token': token},
         initialChildren: children,
       );

  static const String name = 'SharedWishlistRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<SharedWishlistRouteArgs>(
        orElse: () =>
            SharedWishlistRouteArgs(token: pathParams.getString('token')),
      );
      return SharedWishlistPage(key: args.key, token: args.token);
    },
  );
}

class SharedWishlistRouteArgs {
  const SharedWishlistRouteArgs({this.key, required this.token});

  final Key? key;

  final String token;

  @override
  String toString() {
    return 'SharedWishlistRouteArgs{key: $key, token: $token}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SharedWishlistRouteArgs) return false;
    return key == other.key && token == other.token;
  }

  @override
  int get hashCode => key.hashCode ^ token.hashCode;
}

/// generated route for
/// [ShopPage]
class ShopRoute extends PageRouteInfo<void> {
  const ShopRoute({List<PageRouteInfo>? children})
    : super(ShopRoute.name, initialChildren: children);

  static const String name = 'ShopRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ShopPage();
    },
  );
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(key: key, onResult: onResult),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>(
        orElse: () => const SignInRouteArgs(),
      );
      return SignInPage(key: args.key, onResult: args.onResult);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, this.onResult});

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onResult: $onResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
         SignUpRoute.name,
         args: SignUpRouteArgs(key: key, onResult: onResult),
         initialChildren: children,
       );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => const SignUpRouteArgs(),
      );
      return SignUpPage(key: args.key, onResult: args.onResult);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key, this.onResult});

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, onResult: $onResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignUpRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [StudioHomePage]
class StudioHomeRoute extends PageRouteInfo<void> {
  const StudioHomeRoute({List<PageRouteInfo>? children})
    : super(StudioHomeRoute.name, initialChildren: children);

  static const String name = 'StudioHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StudioHomePage();
    },
  );
}

/// generated route for
/// [StudioPage]
class StudioRoute extends PageRouteInfo<StudioRouteArgs> {
  StudioRoute({
    Key? key,
    String? productSlug,
    String? designId,
    List<PageRouteInfo>? children,
  }) : super(
         StudioRoute.name,
         args: StudioRouteArgs(
           key: key,
           productSlug: productSlug,
           designId: designId,
         ),
         rawQueryParams: {'product': productSlug, 'design': designId},
         initialChildren: children,
       );

  static const String name = 'StudioRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<StudioRouteArgs>(
        orElse: () => StudioRouteArgs(
          productSlug: queryParams.optString('product'),
          designId: queryParams.optString('design'),
        ),
      );
      return StudioPage(
        key: args.key,
        productSlug: args.productSlug,
        designId: args.designId,
      );
    },
  );
}

class StudioRouteArgs {
  const StudioRouteArgs({this.key, this.productSlug, this.designId});

  final Key? key;

  final String? productSlug;

  final String? designId;

  @override
  String toString() {
    return 'StudioRouteArgs{key: $key, productSlug: $productSlug, designId: $designId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StudioRouteArgs) return false;
    return key == other.key &&
        productSlug == other.productSlug &&
        designId == other.designId;
  }

  @override
  int get hashCode => key.hashCode ^ productSlug.hashCode ^ designId.hashCode;
}

/// generated route for
/// [StudioSharedPage]
class StudioSharedRoute extends PageRouteInfo<StudioSharedRouteArgs> {
  StudioSharedRoute({
    Key? key,
    required String token,
    List<PageRouteInfo>? children,
  }) : super(
         StudioSharedRoute.name,
         args: StudioSharedRouteArgs(key: key, token: token),
         rawPathParams: {'token': token},
         initialChildren: children,
       );

  static const String name = 'StudioSharedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<StudioSharedRouteArgs>(
        orElse: () =>
            StudioSharedRouteArgs(token: pathParams.getString('token')),
      );
      return StudioSharedPage(key: args.key, token: args.token);
    },
  );
}

class StudioSharedRouteArgs {
  const StudioSharedRouteArgs({this.key, required this.token});

  final Key? key;

  final String token;

  @override
  String toString() {
    return 'StudioSharedRouteArgs{key: $key, token: $token}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StudioSharedRouteArgs) return false;
    return key == other.key && token == other.token;
  }

  @override
  int get hashCode => key.hashCode ^ token.hashCode;
}

/// generated route for
/// [StyleProfilePage]
class StyleProfileRoute extends PageRouteInfo<StyleProfileRouteArgs> {
  StyleProfileRoute({
    Key? key,
    bool onboarding = false,
    List<PageRouteInfo>? children,
  }) : super(
         StyleProfileRoute.name,
         args: StyleProfileRouteArgs(key: key, onboarding: onboarding),
         initialChildren: children,
       );

  static const String name = 'StyleProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StyleProfileRouteArgs>(
        orElse: () => const StyleProfileRouteArgs(),
      );
      return StyleProfilePage(key: args.key, onboarding: args.onboarding);
    },
  );
}

class StyleProfileRouteArgs {
  const StyleProfileRouteArgs({this.key, this.onboarding = false});

  final Key? key;

  final bool onboarding;

  @override
  String toString() {
    return 'StyleProfileRouteArgs{key: $key, onboarding: $onboarding}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StyleProfileRouteArgs) return false;
    return key == other.key && onboarding == other.onboarding;
  }

  @override
  int get hashCode => key.hashCode ^ onboarding.hashCode;
}

/// generated route for
/// [TrackOrderPage]
class TrackOrderRoute extends PageRouteInfo<TrackOrderRouteArgs> {
  TrackOrderRoute({Key? key, String? number, List<PageRouteInfo>? children})
    : super(
        TrackOrderRoute.name,
        args: TrackOrderRouteArgs(key: key, number: number),
        rawQueryParams: {'number': number},
        initialChildren: children,
      );

  static const String name = 'TrackOrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<TrackOrderRouteArgs>(
        orElse: () =>
            TrackOrderRouteArgs(number: queryParams.optString('number')),
      );
      return TrackOrderPage(key: args.key, number: args.number);
    },
  );
}

class TrackOrderRouteArgs {
  const TrackOrderRouteArgs({this.key, this.number});

  final Key? key;

  final String? number;

  @override
  String toString() {
    return 'TrackOrderRouteArgs{key: $key, number: $number}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TrackOrderRouteArgs) return false;
    return key == other.key && number == other.number;
  }

  @override
  int get hashCode => key.hashCode ^ number.hashCode;
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomePage();
    },
  );
}

/// generated route for
/// [WishlistPage]
class WishlistRoute extends PageRouteInfo<void> {
  const WishlistRoute({List<PageRouteInfo>? children})
    : super(WishlistRoute.name, initialChildren: children);

  static const String name = 'WishlistRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WishlistPage();
    },
  );
}

/// generated route for
/// [WriteReviewPage]
class WriteReviewRoute extends PageRouteInfo<WriteReviewRouteArgs> {
  WriteReviewRoute({
    Key? key,
    required String slug,
    String? productName,
    List<PageRouteInfo>? children,
  }) : super(
         WriteReviewRoute.name,
         args: WriteReviewRouteArgs(
           key: key,
           slug: slug,
           productName: productName,
         ),
         rawPathParams: {'slug': slug},
         initialChildren: children,
       );

  static const String name = 'WriteReviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WriteReviewRouteArgs>(
        orElse: () => WriteReviewRouteArgs(slug: pathParams.getString('slug')),
      );
      return WriteReviewPage(
        key: args.key,
        slug: args.slug,
        productName: args.productName,
      );
    },
  );
}

class WriteReviewRouteArgs {
  const WriteReviewRouteArgs({this.key, required this.slug, this.productName});

  final Key? key;

  final String slug;

  final String? productName;

  @override
  String toString() {
    return 'WriteReviewRouteArgs{key: $key, slug: $slug, productName: $productName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WriteReviewRouteArgs) return false;
    return key == other.key &&
        slug == other.slug &&
        productName == other.productName;
  }

  @override
  int get hashCode => key.hashCode ^ slug.hashCode ^ productName.hashCode;
}
