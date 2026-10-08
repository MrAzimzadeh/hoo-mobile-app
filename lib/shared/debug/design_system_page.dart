import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../design_system/design_system.dart';
import '../domain/models.dart';

/// Hidden screen showing every design-system component in light and dark mode
/// (Profile → Settings → long-press the version label, or `/debug/design-system`).
@RoutePage()
class DesignSystemPage extends StatefulWidget {
  const DesignSystemPage({super.key});

  @override
  State<DesignSystemPage> createState() => _DesignSystemPageState();
}

class _DesignSystemPageState extends State<DesignSystemPage> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    final theme = _dark ? HooThemeData.dark() : HooThemeData.light();
    return Theme(
      data: theme,
      child: Builder(
        builder: (context) => Scaffold(
          appBar: HooAppBar(
            title: context.l10n.dsTitle,
            actions: [
              HooIconButton(
                icon: _dark ? HooIcons.sun : HooIcons.moon,
                semanticLabel: context.l10n.dsLightDark,
                onPressed: () => setState(() => _dark = !_dark),
              ),
            ],
          ),
          body: const _Gallery(),
        ),
      ),
    );
  }
}

class _Gallery extends StatefulWidget {
  const _Gallery();

  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  int _qty = 1;
  String _size = 'M';
  int _swatch = 0;
  bool _check = true;
  int _rating = 4;
  final _phone = TextEditingController();

  static const _demo = ProductCard(
    id: '1',
    slug: 'essential-hoodie',
    name: 'Essential Oversized Hoodie',
    price: 89,
    compareAtPrice: 109,
    discountPercent: 18,
    badges: ['NEW_DROP'],
    colorsCount: 4,
    colorHexes: ['#121212', '#1C3829', '#EDE6D6', '#9A9A9A'],
    imageUrl: 'asset:assets/images/cat-hoodies.jpg',
    rating: 4.6,
    reviewCount: 32,
  );

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  Widget _section(String title, Widget child) => Padding(
        padding: const EdgeInsets.only(bottom: HooSpacing.section),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title.toUpperCase(), style: context.hoo.text.labelSecondary), const SizedBox(height: HooSpacing.sm), child],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final t = context.hoo.text;
    return ListView(
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        _section(
          'Logo',
          Wrap(spacing: HooSpacing.md, runSpacing: HooSpacing.md, children: [
            Container(color: HooPalette.white, padding: const EdgeInsets.all(HooSpacing.md), child: const HooLogo(variant: HooLogoVariant.dark)),
            Container(color: HooPalette.black, padding: const EdgeInsets.all(HooSpacing.md), child: const HooLogo(variant: HooLogoVariant.light)),
            Container(color: HooPalette.green, padding: const EdgeInsets.all(HooSpacing.md), child: const HooLogo(variant: HooLogoVariant.onGreen)),
          ]),
        ),
        _section(
          'Colors',
          Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
            for (final (name, color) in [
              ('background', c.background), ('surface', c.surface), ('border', c.border), ('text', c.textPrimary),
              ('secondary', c.textSecondary), ('tertiary', c.textTertiary), ('accent', c.accent), ('tint', c.accentTint), ('error', c.error),
            ])
              Column(children: [
                Container(width: 56, height: 40, decoration: BoxDecoration(color: color, borderRadius: HooRadius.cardAll, border: Border.all(color: c.border))),
                Text(name, style: t.caption.copyWith(fontSize: 10)),
              ]),
          ]),
        ),
        _section(
          'Typography',
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Display 40', style: t.display),
            Text('H1 · Ekran başlığı', style: t.h1),
            Text('H2 · Bölmə başlığı', style: t.h2),
            Text('H3 · Məhsul adı', style: t.h3),
            Text('Body · Ərəb, ğ, ı, ö, ş, ü, ç · Кириллица', style: t.body),
            Text('Body strong · 89,00 ₼', style: t.bodyStrong),
            Text('Caption · helper text', style: t.caption),
            Text('LABEL · TAG', style: t.label),
          ]),
        ),
        _section(
          'Buttons',
          Column(children: [
            PrimaryButton(label: 'Add to bag', onPressed: () {}),
            const SizedBox(height: HooSpacing.sm),
            PrimaryButton.accent(label: 'Checkout', onPressed: () {}),
            const SizedBox(height: HooSpacing.sm),
            const PrimaryButton(label: 'Loading', loading: true),
            const SizedBox(height: HooSpacing.sm),
            const PrimaryButton(label: 'Disabled'),
            const SizedBox(height: HooSpacing.sm),
            SecondaryButton(label: 'Secondary', onPressed: () {}),
            HooTextButton(label: 'Text link', trailingArrow: true, onPressed: () {}),
          ]),
        ),
        _section(
          'Product card',
          Row(children: [
            Expanded(child: ProductCardTile(product: _demo, onTap: () {}, onWishlistTap: () {}, isWishlisted: true, heroTagPrefix: 'ds')),
            const SizedBox(width: HooSpacing.md),
            const Expanded(child: ProductCardSkeleton()),
          ]),
        ),
        _section(
          'Swatches & chips',
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Wrap(children: [
              for (final (i, (hex, name)) in [('#121212', 'Black'), ('#1C3829', 'Forest'), ('#EDE6D6', 'Cream'), ('#B83636', 'Red')].indexed)
                HooColorSwatch(hex: hex, name: name, selected: _swatch == i, available: i != 3, onTap: () => setState(() => _swatch = i)),
            ]),
            const SizedBox(height: HooSpacing.sm),
            Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
              for (final s in ['XS', 'S', 'M', 'L', 'XL'])
                OptionChip(label: s, selected: _size == s, unavailable: s == 'XS', onTap: () => setState(() => _size = s)),
              const OptionChip(label: 'Oversized', selected: true, style: OptionChipStyle.tint, trailing: '+5 ₼'),
            ]),
          ]),
        ),
        _section(
          'Inputs',
          Column(children: [
            const HooTextField(label: 'Full name', hint: 'Aysel Məmmədova'),
            const SizedBox(height: HooSpacing.md),
            HooPhoneField(controller: _phone, label: 'Phone'),
            const SizedBox(height: HooSpacing.md),
            const HooTextField.password(label: 'Password', errorText: 'At least 8 characters'),
            const SizedBox(height: HooSpacing.md),
            HooOtpField(onCompleted: (_) {}, autofocus: false),
            HooCheckboxTile(value: _check, onChanged: (v) => setState(() => _check = v), label: const Text('I accept the terms')),
          ]),
        ),
        _section(
          'Steppers & rating',
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const HooStepper(current: 2, total: 5, title: 'Fabric & features'),
            const SizedBox(height: HooSpacing.md),
            QuantityStepper(value: _qty, max: 5, onChanged: (v) => setState(() => _qty = v)),
            const SizedBox(height: HooSpacing.md),
            const RatingStars(rating: 4.5, count: 32),
            RatingInput(value: _rating, onChanged: (v) => setState(() => _rating = v)),
          ]),
        ),
        _section(
          'Alerts',
          const Column(children: [
            InlineAlert(message: 'Delivered in 1–2 days in Baku.'),
            SizedBox(height: HooSpacing.sm),
            InlineAlert(message: 'Only 2 left in L.', kind: HooAlertKind.warning),
            SizedBox(height: HooSpacing.sm),
            InlineAlert(message: 'Cash on delivery is limited to 300 ₼.', kind: HooAlertKind.error),
            SizedBox(height: HooSpacing.sm),
            InlineAlert(message: 'Design approved.', kind: HooAlertKind.success),
            SizedBox(height: HooSpacing.sm),
            OfflineBanner(),
          ]),
        ),
        _section(
          'Accordion & timeline',
          const Column(children: [
            HooAccordion(title: 'Fabric & care', child: Text('100% cotton, 420 gsm. Wash cold, inside out.')),
            SizedBox(height: HooSpacing.md),
            StatusTimeline(entries: [
              TimelineEntry(label: 'Out for delivery', timestamp: 'Today, 14:20', highlighted: true),
              TimelineEntry(label: 'Packed', timestamp: 'Today, 10:02'),
              TimelineEntry(label: 'Payment captured', timestamp: 'Yesterday, 18:40'),
              TimelineEntry(label: 'Placed', timestamp: 'Yesterday, 18:39'),
            ]),
          ]),
        ),
        _section(
          'States',
          SizedBox(
            height: 220,
            child: HooEmptyState(icon: HooIcons.bag, title: 'Your bag is empty', message: 'Discover the new drop.', actionLabel: 'Shop now', onAction: () {}),
          ),
        ),
        _section(
          'Sheets & toast',
          Wrap(spacing: HooSpacing.sm, children: [
            SecondaryButton(
              label: 'Bottom sheet',
              expand: false,
              onPressed: () => showHooSheet<void>(context, title: 'Size guide', builder: (_) => const Text('Chest · Length · Sleeve')),
            ),
            SecondaryButton(label: 'Toast', expand: false, onPressed: () => HooToast.success(context, 'Added to bag')),
            SecondaryButton(label: 'Success', expand: false, onPressed: () => showHooSheet<void>(context, builder: (_) => const Center(child: HooSuccessCheck()))),
          ]),
        ),
        _section(
          'Price summary bar',
          const PriceSummaryBar(
            total: 214.5,
            ctaLabel: 'Checkout',
            caption: '2 items',
            breakdown: [
              PriceLine(label: 'Subtotal', amount: 230),
              PriceLine(label: 'Promo HOO10', amount: -23, signed: true),
              PriceLine(label: 'Delivery', amount: 7.5),
            ],
          ),
        ),
        _section(
          'Bottom navigation',
          HooBottomNav(
            currentIndex: 0,
            onTap: (_) {},
            items: [
              HooNavItem(icon: HooIcons.home, label: context.l10n.navHome),
              HooNavItem(icon: HooIcons.shop, label: context.l10n.navShop),
              HooNavItem(icon: HooIcons.studio, label: context.l10n.navStudio, highlighted: true),
              HooNavItem(icon: HooIcons.bag, label: context.l10n.navBag, badge: 2),
              HooNavItem(icon: HooIcons.profile, label: context.l10n.navProfile),
            ],
          ),
        ),
      ],
    );
  }
}
