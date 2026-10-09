import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/catalog_query.dart';
import '../../domain/catalog_repositories.dart';
import '../browse/catalog_browse_cubit.dart';
import '../widgets/catalog_browse_view.dart';

/// A browse grid preset to a category, collection or quick chip (home sections, deep links).
@RoutePage()
class CatalogListPage extends StatelessWidget {
  const CatalogListPage({
    super.key,
    @QueryParam('category') this.category,
    @QueryParam('collection') this.collection,
    @QueryParam('chip') this.chip,
    @QueryParam('title') this.title,
  });

  final String? category;
  final String? collection;
  final String? chip;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final scope = CatalogQuery(
      category: category,
      collection: collection,
      chip: ProductChip.values.firstWhere((c) => c.wire.toLowerCase() == chip?.toLowerCase(), orElse: () => ProductChip.all),
    );
    return BlocProvider(
      create: (_) => CatalogBrowseCubit(sl<ProductBrowseRepository>(), scope: scope)..load(),
      child: Scaffold(
        appBar: HooAppBar(titleWidget: _Title(title: title, collection: collection, category: category)),
        body: CatalogBrowseView(heroPrefix: 'list-${collection ?? category ?? chip ?? ''}', lockCategory: category != null),
      ),
    );
  }
}

/// Uses the given title, else resolves the collection/category name.
class _Title extends StatelessWidget {
  const _Title({this.title, this.collection, this.category});
  final String? title;
  final String? collection;
  final String? category;

  @override
  Widget build(BuildContext context) {
    if (title != null) return Text(title!);
    final taxonomy = sl<TaxonomyRepository>();
    return FutureBuilder<String?>(
      future: () async {
        if (collection != null) return (await taxonomy.collections()).data.where((c) => c.slug == collection).firstOrNull?.name;
        if (category != null) return (await taxonomy.categories()).data.where((c) => c.slug == category).firstOrNull?.name;
        return null;
      }(),
      builder: (context, s) => Text(s.data ?? context.l10n.navShop),
    );
  }
}
