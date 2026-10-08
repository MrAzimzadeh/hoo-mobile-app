import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/product_query.dart';
import '../cubit/product_list_cubit.dart';
import '../widgets/product_list_view.dart';

/// A scoped list (a category, a collection, New / Sale…) opened from Home, deep links or the tab bar.
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
    final query = ProductQuery(
      category: category,
      collection: collection,
      chip: ProductChip.values.firstWhere((c) => c.wire.toLowerCase() == chip?.toLowerCase(), orElse: () => ProductChip.all),
    );
    return BlocProvider(
      create: (_) => sl<ProductListCubit>(param1: query)..load(),
      child: Scaffold(
        backgroundColor: context.hoo.colors.background,
        appBar: HooAppBar(title: title ?? context.l10n.navShop),
        body: SafeArea(
          bottom: false,
          child: HooConstrained(
            child: ProductListView(heroPrefix: 'list', showCategoryFilter: category == null, showCollectionFilter: collection == null),
          ),
        ),
      ),
    );
  }
}
