import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/profile_models.dart';
import '../../domain/profile_repositories.dart';

/// Profile tab: greeting + counters and the account menu; signed out → sign-in prompt and guest tools.
@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = sl<AuthGate>();
  AccountOverview? _overview;
  late final StreamSubscription<Me?> _sub;

  @override
  void initState() {
    super.initState();
    _sub = _auth.userChanges.listen((_) => _load());
    _load();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    if (!_auth.isSignedIn) {
      if (mounted) setState(() => _overview = null);
      return;
    }
    try {
      final o = await sl<AccountRepository>().overview();
      if (mounted) setState(() => _overview = o);
    } catch (_) {
      if (mounted) setState(() {});
    }
  }

  Future<void> _signOut() async {
    final l = context.l10n;
    if (await showHooConfirm(context, title: l.profileSignOutConfirm, confirmLabel: l.commonSignOut)) {
      await _auth.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final user = _auth.currentUser;
    final r = context.router;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _load,
        child: ListView(
          padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top + HooSpacing.lg, bottom: HooSpacing.xxl),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
              child: user == null ? _SignedOutHeader(onSignIn: () => _auth.requireSignIn(context)) : _Header(user: user, overview: _overview),
            ),
            const SizedBox(height: HooSpacing.xl),
            if (user != null) ...[
              _group(context, l.profileShopping, [
                HooListTile(icon: HooIcons.package, title: l.ordersTitle, onTap: () => r.push(const OrdersRoute())),
                HooListTile(icon: HooIcons.swap, title: l.ordersReturnsTitle, onTap: () => r.push(const ReturnsRoute())),
                HooListTile(icon: HooIcons.studio, title: l.profileMyDesigns, onTap: () => r.push(const MyDesignsRoute())),
                HooListTile(icon: HooIcons.heart, title: l.wishlistTitle, onTap: () => r.push(const WishlistRoute())),
                HooListTile(icon: HooIcons.bell, title: l.wishlistAlertsTitle, onTap: () => r.push(const AlertsRoute())),
              ]),
              _group(context, l.profileAccount, [
                HooListTile(icon: HooIcons.ruler, title: l.profileStyleProfile, onTap: () => r.push(StyleProfileRoute())),
                HooListTile(icon: HooIcons.pin, title: l.profileAddresses, onTap: () => r.push(const AddressesRoute())),
                HooListTile(icon: HooIcons.card, title: l.profileSavedCards, onTap: () => r.push(const SavedCardsRoute())),
                HooListTile(icon: HooIcons.profile, title: l.profilePersonalInfo, onTap: () => r.push(const PersonalInfoRoute())),
                HooListTile(icon: HooIcons.lock, title: l.profileChangePassword, onTap: () => r.push(const ChangePasswordRoute())),
                HooListTile(icon: HooIcons.device, title: l.profileDevices, onTap: () => r.push(const ActiveDevicesRoute())),
                HooListTile(icon: HooIcons.bell, title: l.profileNotifications, onTap: () => r.push(const NotificationSettingsRoute())),
              ]),
            ],
            _group(context, l.profileServices, [
              HooListTile(icon: HooIcons.truck, title: l.ordersTrackTitle, onTap: () => r.push(TrackOrderRoute())),
              HooListTile(icon: HooIcons.gift, title: l.checkoutGiftReceipt, onTap: () => r.push(GiftReceiptRoute())),
              HooListTile(icon: HooIcons.help, title: l.profileHelp, onTap: () => r.push(const HelpRoute())),
              HooListTile(icon: HooIcons.globe, title: l.profileSettings, onTap: () => r.push(const SettingsRoute())),
            ]),
            if (user != null)
              Padding(
                padding: const EdgeInsets.only(top: HooSpacing.md),
                child: HooListTile(icon: HooIcons.signOut, title: l.commonSignOut, destructive: true, showChevron: false, onTap: _signOut),
              ),
          ],
        ),
      ),
    );
  }

  Widget _group(BuildContext context, String title, List<Widget> tiles) => Padding(
        padding: const EdgeInsets.only(bottom: HooSpacing.lg),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: const EdgeInsets.fromLTRB(HooSpacing.screen, 0, HooSpacing.screen, HooSpacing.xs), child: Text(title.toUpperCase(), style: context.hoo.text.labelSecondary)),
          ...tiles,
        ]),
      );
}

class _Header extends StatelessWidget {
  const _Header({required this.user, required this.overview});
  final Me user;
  final AccountOverview? overview;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final o = overview;
    Widget counter(int? value, String label, VoidCallback onTap) => Expanded(
          child: HooPressable(
            onTap: onTap,
            semanticLabel: '$label ${value ?? ''}',
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(value?.toString() ?? '–', style: context.hoo.text.h2),
              Text(label, style: context.hoo.text.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
            ]),
          ),
        );
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HooTextReveal(child: Text(l.profileHello(user.firstName), style: context.hoo.text.h1)),
      if (user.email != null || user.phone != null) Text(user.email ?? user.phone!, style: context.hoo.text.caption),
      const SizedBox(height: HooSpacing.lg),
      HooCard(
        child: Row(children: [
          counter(o?.ordersCount, l.ordersTitle, () => context.router.push(const OrdersRoute())),
          counter(o?.activeOrders, l.profileActiveOrders, () => context.router.push(const OrdersRoute())),
          counter(o?.designsCount, l.profileMyDesigns, () => context.router.push(const MyDesignsRoute())),
          counter(o?.wishlistCount, l.wishlistTitle, () => context.router.push(const WishlistRoute())),
        ]),
      ),
    ]);
  }
}

class _SignedOutHeader extends StatelessWidget {
  const _SignedOutHeader({required this.onSignIn});
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const HooLogo(size: 24),
      const SizedBox(height: HooSpacing.lg),
      HooTextReveal(child: Text(l.profileGuestTitle, style: context.hoo.text.h1)),
      const SizedBox(height: HooSpacing.xs),
      Text(l.profileGuestBody, style: context.hoo.text.bodySecondary),
      const SizedBox(height: HooSpacing.lg),
      PrimaryButton(label: l.commonSignIn, onPressed: onSignIn),
      const SizedBox(height: HooSpacing.sm),
      SecondaryButton(label: l.commonCreateAccount, onPressed: () => context.router.push(SignUpRoute())),
    ]);
  }
}
