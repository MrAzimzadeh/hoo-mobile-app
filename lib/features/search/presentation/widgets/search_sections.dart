import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';

/// One tappable row of the suggestions / recent searches lists. [highlight] is shown in bold where it matches.
class SearchTermRow extends StatelessWidget {
  const SearchTermRow({super.key, required this.text, required this.icon, required this.onTap, this.highlight, this.onFill});

  final String text;
  final IconData icon;
  final String? highlight;
  final VoidCallback onTap;

  /// Copies the term into the field without searching (the ↖ affordance).
  final VoidCallback? onFill;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: HooSize.touchTarget),
        child: Padding(
          padding: const EdgeInsets.only(left: HooSpacing.screen, right: HooSpacing.xs),
          child: Row(
            children: [
              Icon(icon, size: HooSize.iconSmall, color: c.textTertiary),
              const SizedBox(width: HooSpacing.md),
              Expanded(
                child: _HighlightedText(text: text, highlight: highlight),
              ),
              if (onFill != null)
                HooIconButton(
                  icon: HooIcons.arrowLeft,
                  size: HooSize.iconSmall,
                  color: c.textTertiary,
                  semanticLabel: context.l10n.searchFillA11y(text),
                  onPressed: onFill,
                )
              else
                const SizedBox(width: HooSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}

class _HighlightedText extends StatelessWidget {
  const _HighlightedText({required this.text, this.highlight});

  final String text;
  final String? highlight;

  @override
  Widget build(BuildContext context) {
    final base = context.hoo.text.body;
    final h = highlight?.trim().toLowerCase() ?? '';
    final index = h.isEmpty ? -1 : text.toLowerCase().indexOf(h);
    if (index < 0) return Text(text, style: base, maxLines: 1, overflow: TextOverflow.ellipsis);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text.substring(0, index)),
          TextSpan(
            text: text.substring(index, index + h.length),
            style: base.copyWith(fontWeight: FontWeight.w600),
          ),
          TextSpan(text: text.substring(index + h.length)),
        ],
      ),
      style: base.copyWith(color: context.hoo.colors.textSecondary),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// "Didn't find it? Design your own in 3D" — dark green promo leading into the Studio.
class DesignYourOwnCard extends StatelessWidget {
  const DesignYourOwnCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    return Semantics(
      button: true,
      child: HooPressable(
        onTap: onTap,
        scale: 0.985,
        child: Container(
          padding: const EdgeInsets.all(HooSpacing.lg),
          decoration: BoxDecoration(color: c.accent, borderRadius: HooRadius.cardAll),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.searchDesignYourOwnTitle, style: context.hoo.text.h3.copyWith(color: c.onAccent)),
                    const SizedBox(height: HooSpacing.xxs),
                    Text(l.searchDesignYourOwnBody, style: context.hoo.text.caption.copyWith(color: c.onAccent.withValues(alpha: 0.8))),
                  ],
                ),
              ),
              const SizedBox(width: HooSpacing.md),
              Icon(HooIcons.arrowRight, color: c.onAccent),
            ],
          ),
        ),
      ),
    );
  }
}
