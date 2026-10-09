import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/catalog_models.dart';
import '../../domain/catalog_query.dart';

/// Filter & sort sheet built from the server facets. Edits a draft query; "Show results" applies it.
Future<CatalogQuery?> showFilterSheet(BuildContext context, {required CatalogQuery query, required ProductFacets facets, required List<ColorInfo> palette, required bool lockCategory}) {
  return showHooSheet<CatalogQuery>(
    context,
    title: context.l10n.catalogFilterTitle,
    maxHeightFactor: 0.92,
    builder: (_) => _FilterSheet(initial: query, facets: facets, palette: palette, lockCategory: lockCategory),
  );
}

class _FilterSheet extends StatefulWidget {
  const _FilterSheet({required this.initial, required this.facets, required this.palette, required this.lockCategory});

  final CatalogQuery initial;
  final ProductFacets facets;
  final List<ColorInfo> palette;
  final bool lockCategory;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  late CatalogQuery _q = widget.initial;

  String _sortLabel(ProductSort s) => switch (s) {
        ProductSort.newest => context.l10n.catalogSortNewest,
        ProductSort.priceAsc => context.l10n.catalogSortPriceAsc,
        ProductSort.priceDesc => context.l10n.catalogSortPriceDesc,
        ProductSort.popular => context.l10n.catalogSortPopular,
      };

  Widget _section(String title, Widget child) => Padding(
        padding: const EdgeInsets.only(bottom: HooSpacing.lg),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title.toUpperCase(), style: context.hoo.text.labelSecondary), const SizedBox(height: HooSpacing.sm), child]),
      );

  Widget _chips(List<FacetValue> values, List<String> selected, CatalogFilterKind kind) => Wrap(
        spacing: HooSpacing.xs,
        runSpacing: HooSpacing.xs,
        children: [
          for (final v in values)
            OptionChip(
              label: v.label,
              uppercase: kind == CatalogFilterKind.size,
              style: kind == CatalogFilterKind.size ? OptionChipStyle.primary : OptionChipStyle.tint,
              selected: selected.contains(v.value),
              trailing: '${v.count}',
              unavailable: v.count == 0 && !selected.contains(v.value),
              onTap: () => setState(() => _q = _q.toggle(kind, v.value)),
            ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final f = widget.facets;
    final min = f.minPrice?.floor(), max = f.maxPrice?.ceil();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: ListView(
            shrinkWrap: true,
            children: [
              _section(
                l.commonSort,
                Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
                  for (final s in ProductSort.values)
                    OptionChip(label: _sortLabel(s), uppercase: false, style: OptionChipStyle.tint, selected: _q.sort == s, onTap: () => setState(() => _q = _q.copyWith(sort: s))),
                ]),
              ),
              if (!widget.lockCategory && f.categories.isNotEmpty)
                _section(l.catalogFilterCategory, _chips(f.categories, [?_q.category], CatalogFilterKind.category)),
              if (f.sizes.isNotEmpty) _section(l.catalogFilterSize, _chips(f.sizes, _q.sizes, CatalogFilterKind.size)),
              if (f.colors.isNotEmpty)
                _section(
                  l.catalogFilterColor,
                  Wrap(children: [
                    for (final v in f.colors)
                      HooColorSwatch(
                        hex: widget.palette.where((c) => c.code == v.value).firstOrNull?.hex ?? '#E8E8E5',
                        name: v.label,
                        selected: _q.colors.contains(v.value),
                        available: v.count > 0,
                        onTap: () => setState(() => _q = _q.toggle(CatalogFilterKind.color, v.value)),
                      ),
                  ]),
                ),
              if (f.fits.isNotEmpty) _section(l.catalogFilterFit, _chips(f.fits, _q.fits, CatalogFilterKind.fit)),
              if (f.fabrics.isNotEmpty) _section(l.catalogFilterFabric, _chips(f.fabrics, _q.fabrics, CatalogFilterKind.fabric)),
              if (min != null && max != null && max > min)
                _section(
                  l.catalogFilterPrice,
                  Column(
                    children: [
                      RangeSlider(
                        min: min.toDouble(),
                        max: max.toDouble(),
                        divisions: (max - min).clamp(1, 100),
                        values: RangeValues((_q.minPrice ?? min).clamp(min, max).toDouble(), (_q.maxPrice ?? max).clamp(min, max).toDouble()),
                        onChanged: (v) => setState(() => _q = _q.withPrice(v.start.round() == min ? null : v.start.round(), v.end.round() == max ? null : v.end.round())),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(HooFormat.money(context, _q.minPrice ?? min), style: context.hoo.text.caption),
                          Text(HooFormat.money(context, _q.maxPrice ?? max), style: context.hoo.text.caption),
                        ],
                      ),
                    ],
                  ),
                ),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                value: _q.inStockOnly,
                onChanged: (v) => setState(() => _q = _q.copyWith(inStockOnly: v)),
                title: Text(l.catalogFilterInStock, style: context.hoo.text.body),
              ),
            ],
          ),
        ),
        const SizedBox(height: HooSpacing.md),
        Row(
          children: [
            Expanded(child: SecondaryButton(label: l.commonClearAll, onPressed: () => setState(() => _q = _q.cleared(scope: CatalogQuery(category: widget.lockCategory ? widget.initial.category : null, collection: widget.initial.collection))))),
            const SizedBox(width: HooSpacing.sm),
            Expanded(child: PrimaryButton(label: l.catalogShowResults, onPressed: () => Navigator.of(context).pop(_q))),
          ],
        ),
      ],
    );
  }
}
