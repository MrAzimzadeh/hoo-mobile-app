import 'package:flutter/material.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/wishlist_models.dart';

/// Colour + size picker for "Move to bag". Resolves with the chosen variant id, or null when dismissed.
Future<String?> showSizePicker(BuildContext context, {required Future<PickerProduct> Function() load}) {
  return showHooSheet<String>(
    context,
    title: context.l10n.wishlistChooseSize,
    builder: (sheetContext) => _SizePicker(load: load),
  );
}

class _SizePicker extends StatefulWidget {
  const _SizePicker({required this.load});
  final Future<PickerProduct> Function() load;

  @override
  State<_SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<_SizePicker> {
  late Future<PickerProduct> _future = widget.load();
  int _color = 0;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return FutureBuilder<PickerProduct>(
      future: _future,
      builder: (context, snap) {
        if (snap.hasError) {
          final e = snap.error;
          return HooErrorState(
            error: e is ApiException ? e : const ApiException(statusCode: 0, code: 'general.unknown'),
            compact: true,
            onRetry: () => setState(() => _future = widget.load()),
          );
        }
        final product = snap.data;
        if (product == null) {
          return const Padding(
            padding: EdgeInsets.all(HooSpacing.lg),
            child: Center(child: HooLoading()),
          );
        }
        final color = product.colors[_color.clamp(0, product.colors.length - 1)];
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: context.hoo.text.h3),
            const SizedBox(height: HooSpacing.md),
            if (product.colors.length > 1) ...[
              Wrap(
                spacing: HooSpacing.sm,
                children: [
                  for (final (i, c) in product.colors.indexed)
                    HooColorSwatch(
                      hex: c.color.hex,
                      name: c.color.name,
                      selected: i == _color,
                      available: c.variants.any((v) => v.purchasable),
                      onTap: () => setState(() => _color = i),
                    ),
                ],
              ),
              const SizedBox(height: HooSpacing.md),
            ],
            Text(l.catalogSize, style: context.hoo.text.bodyStrong),
            const SizedBox(height: HooSpacing.xs),
            Wrap(
              spacing: HooSpacing.sm,
              runSpacing: HooSpacing.sm,
              children: [
                for (final v in color.variants)
                  OptionChip(label: v.size.label, unavailable: !v.purchasable, onTap: v.purchasable ? () => Navigator.of(context).pop(v.id) : null),
              ],
            ),
          ],
        );
      },
    );
  }
}
