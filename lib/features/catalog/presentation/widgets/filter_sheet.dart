import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/catalog_models.dart';
import '../../domain/product_query.dart';

/// Localized label of a sort option.
String sortLabel(AppLocalizations l, ProductSort s) => switch (s) {
  ProductSort.newest => l.catalogSortNewest,
  ProductSort.priceAsc => l.catalogSortPriceAsc,
  ProductSort.priceDesc => l.catalogSortPriceDesc,
  ProductSort.popular => l.catalogSortPopular,
};

/// Fit facet values are enum names (`Oversized`); show the localized label when we know it.
String fitLabel(AppLocalizations l, FacetValue f) {
  final fit = Fit.fromWire(f.value);
  return fit == Fit.unknown ? f.label : fit.label(l);
}

/// Filter & sort sheet built from the API facets. Resolves with the new query, or `null` when dismissed.
Future<ProductQuery?> showFilterSheet(
  BuildContext context, {
  required ProductQuery query,
  required ProductFacets facets,
  required List<CatalogCollection> collections,
  required Map<String, String> palette,
  bool showCategory = true,
  bool showCollection = true,
}) {
  return showHooSheet<ProductQuery>(
    context,
    title: context.l10n.catalogFilterTitle,
    padding: EdgeInsets.zero,
    maxHeightFactor: 0.92,
    builder: (_) =>
        _FilterSheet(query: query, facets: facets, collections: collections, palette: palette, showCategory: showCategory, showCollection: showCollection),
  );
}

class _FilterSheet extends StatefulWidget {
  const _FilterSheet({
    required this.query,
    required this.facets,
    required this.collections,
    required this.palette,
    required this.showCategory,
    required this.showCollection,
  });

  final ProductQuery query;
  final ProductFacets facets;
  final List<CatalogCollection> collections;
  final Map<String, String> palette;
  final bool showCategory;
  final bool showCollection;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  late ProductQuery _draft = widget.query;

  double? get _lo => widget.facets.minPrice;
  double? get _hi => widget.facets.maxPrice;
  bool get _hasPriceRange => _lo != null && _hi != null && _hi! > _lo!;

  void _set(ProductQuery q) => setState(() => _draft = q);

  Set<String> _toggle(Set<String> set, String v) => set.contains(v) ? ({...set}..remove(v)) : {...set, v};

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final f = widget.facets;
    final sections = <Widget>[
      _Section(
        title: l.catalogFilterSort,
        child: _Chips(
          children: [
            for (final s in ProductSort.values)
              OptionChip(
                label: sortLabel(l, s),
                uppercase: false,
                style: OptionChipStyle.tint,
                selected: _draft.sort == s,
                onTap: () => _set(_draft.copyWith(sort: s)),
              ),
          ],
        ),
      ),
      if (widget.showCategory && f.categories.isNotEmpty)
        _Section(
          title: l.catalogFilterCategory,
          child: _Chips(
            children: [
              for (final c in f.categories)
                OptionChip(
                  label: c.label,
                  trailing: '${c.count}',
                  uppercase: false,
                  style: OptionChipStyle.tint,
                  selected: _draft.category == c.value,
                  onTap: () => _set(_draft.copyWith(category: _draft.category == c.value ? null : c.value)),
                ),
            ],
          ),
        ),
      if (widget.showCollection && widget.collections.isNotEmpty)
        _Section(
          title: l.catalogFilterCollection,
          child: _Chips(
            children: [
              for (final c in widget.collections)
                OptionChip(
                  label: c.name,
                  uppercase: false,
                  style: OptionChipStyle.tint,
                  selected: _draft.collection == c.slug,
                  onTap: () => _set(_draft.copyWith(collection: _draft.collection == c.slug ? null : c.slug)),
                ),
            ],
          ),
        ),
      if (f.sizes.isNotEmpty)
        _Section(
          title: l.catalogFilterSize,
          child: _Chips(
            children: [
              for (final s in f.sizes)
                OptionChip(
                  label: s.label,
                  selected: _draft.sizes.contains(s.value),
                  onTap: () => _set(_draft.copyWith(sizes: _toggle(_draft.sizes, s.value))),
                ),
            ],
          ),
        ),
      if (f.colors.isNotEmpty)
        _Section(
          title: l.catalogFilterColor,
          child: Wrap(
            spacing: HooSpacing.xs,
            runSpacing: HooSpacing.xs,
            children: [
              for (final c in f.colors)
                SizedBox(
                  width: HooSize.touchTarget + HooSpacing.md,
                  child: Column(
                    children: [
                      HooColorSwatch(
                        hex: widget.palette[c.value] ?? '',
                        name: c.label,
                        selected: _draft.colors.contains(c.value),
                        onTap: () => _set(_draft.copyWith(colors: _toggle(_draft.colors, c.value))),
                      ),
                      Text(c.label, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: context.hoo.text.caption),
                    ],
                  ),
                ),
            ],
          ),
        ),
      if (f.fits.isNotEmpty)
        _Section(
          title: l.catalogFilterFit,
          child: _Chips(
            children: [
              for (final fit in f.fits)
                OptionChip(
                  label: fitLabel(l, fit),
                  uppercase: false,
                  style: OptionChipStyle.tint,
                  selected: _draft.fits.contains(fit.value),
                  onTap: () => _set(_draft.copyWith(fits: _toggle(_draft.fits, fit.value))),
                ),
            ],
          ),
        ),
      if (_hasPriceRange) _Section(title: l.catalogFilterPrice, child: _priceSlider(context)),
      _Section(
        title: l.catalogFilterAvailability,
        child: SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          value: _draft.inStockOnly,
          onChanged: (v) => _set(_draft.copyWith(inStockOnly: v)),
          title: Text(l.catalogFilterInStockOnly, style: context.hoo.text.body),
        ),
      ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(HooSpacing.screen, 0, HooSpacing.screen, HooSpacing.md),
            children: [for (var i = 0; i < sections.length; i++) HooReveal(index: i, child: sections[i])],
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: context.hoo.colors.border)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.md, HooSpacing.screen, HooSpacing.md),
            child: Row(
              children: [
                Expanded(
                  child: SecondaryButton(label: l.commonClearAll, onPressed: () => _set(_draft.cleared())),
                ),
                const SizedBox(width: HooSpacing.sm),
                Expanded(
                  child: PrimaryButton(label: l.commonApply, onPressed: () => Navigator.of(context).pop(_draft)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _priceSlider(BuildContext context) {
    final lo = _lo!, hi = _hi!;
    final values = RangeValues((_draft.minPrice ?? lo).clamp(lo, hi), (_draft.maxPrice ?? hi).clamp(lo, hi));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(HooFormat.money(context, values.start), style: context.hoo.text.bodyStrong),
            Text(HooFormat.money(context, values.end), style: context.hoo.text.bodyStrong),
          ],
        ),
        RangeSlider(
          min: lo,
          max: hi,
          values: values,
          activeColor: context.hoo.colors.primaryAction,
          inactiveColor: context.hoo.colors.border,
          onChanged: (v) {
            // whole manats; untouched ends are sent as "no bound"
            final start = v.start.roundToDouble(), end = v.end.roundToDouble();
            _set(_draft.copyWith(minPrice: start <= lo ? null : start, maxPrice: end >= hi ? null : end));
          },
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: HooSpacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(header: true, child: Text(title.toUpperCase(), style: context.hoo.text.labelSecondary)),
        const SizedBox(height: HooSpacing.sm),
        child,
      ],
    ),
  );
}

class _Chips extends StatelessWidget {
  const _Chips({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: children);
}
