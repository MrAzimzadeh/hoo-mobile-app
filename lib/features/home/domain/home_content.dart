import '../../../shared/domain/models.dart';

class HomeCategory {
  const HomeCategory({required this.slug, required this.name, this.productCount = 0});

  factory HomeCategory.fromJson(Map<String, dynamic> json) =>
      HomeCategory(slug: json['slug'] as String, name: json['name'] as String, productCount: (json['productCount'] as num?)?.toInt() ?? 0);

  final String slug;
  final String name;
  final int productCount;
}

class HomeCollection {
  const HomeCollection({required this.slug, required this.name, this.description});

  factory HomeCollection.fromJson(Map<String, dynamic> json) =>
      HomeCollection(slug: json['slug'] as String, name: json['name'] as String, description: json['description'] as String?);

  final String slug;
  final String name;
  final String? description;
}

/// `LookResponse` — an editorial image with the products worn in it.
class HomeLook {
  const HomeLook({required this.id, required this.title, required this.imageUrl, required this.products});

  factory HomeLook.fromJson(Map<String, dynamic> json) => HomeLook(
    id: json['id'] as String,
    title: (json['title'] as String?) ?? '',
    imageUrl: (json['imageUrl'] as String?) ?? '',
    products: ((json['products'] as List?) ?? const []).map((e) => ProductCard.fromJson((e as Map).cast<String, dynamic>())).toList(),
  );

  final String id;
  final String title;
  final String imageUrl;
  final List<ProductCard> products;
}

/// What the Home tab shows. Every section loads independently, so one failing never blanks the page.
class HomeContent {
  const HomeContent({
    this.newArrivals = const [],
    this.bestsellers = const [],
    this.categories = const [],
    this.collections = const [],
    this.looks = const [],
    this.recentlyViewed = const [],
  });

  final List<ProductCard> newArrivals;
  final List<ProductCard> bestsellers;
  final List<HomeCategory> categories;
  final List<HomeCollection> collections;
  final List<HomeLook> looks;
  final List<ProductCard> recentlyViewed;

  bool get isEmpty => newArrivals.isEmpty && bestsellers.isEmpty && categories.isEmpty && collections.isEmpty && looks.isEmpty && recentlyViewed.isEmpty;
}
