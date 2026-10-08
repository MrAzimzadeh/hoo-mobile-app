import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/catalog_models.dart';

/// Size chart (cm / in) from the product's `sizeChart`.
Future<void> showSizeGuide(BuildContext context, List<SizeChartRow> rows) {
  return showHooSheet<void>(
    context,
    title: context.l10n.catalogSizeGuide,
    builder: (_) => _SizeGuide(rows: rows),
  );
}

class _SizeGuide extends StatefulWidget {
  const _SizeGuide({required this.rows});
  final List<SizeChartRow> rows;

  @override
  State<_SizeGuide> createState() => _SizeGuideState();
}

class _SizeGuideState extends State<_SizeGuide> {
  bool _inches = false;

  String _n(double v) => v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final head = t.label.copyWith(color: c.textSecondary);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              OptionChip(label: l.catalogUnitCm, selected: !_inches, minWidth: 0, onTap: () => setState(() => _inches = false)),
              const SizedBox(width: HooSpacing.xs),
              OptionChip(label: l.catalogUnitIn, selected: _inches, minWidth: 0, onTap: () => setState(() => _inches = true)),
            ],
          ),
          const SizedBox(height: HooSpacing.md),
          Table(
            columnWidths: const {0: FixedColumnWidth(56)},
            children: [
              TableRow(
                children: [
                  Text(l.catalogSizeLabel, style: head),
                  Text(l.catalogChest, style: head),
                  Text(l.catalogLength, style: head),
                  Text(l.catalogSleeve, style: head),
                ],
              ),
              for (final r in widget.rows)
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: c.border)),
                  ),
                  children: [
                    for (final cell in [
                      r.size.label,
                      _n(_inches ? r.chestIn : r.chestCm),
                      _n(_inches ? r.lengthIn : r.lengthCm),
                      _n(_inches ? r.sleeveIn : r.sleeveCm),
                    ])
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: HooSpacing.sm),
                        child: Text(cell, style: t.body),
                      ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
