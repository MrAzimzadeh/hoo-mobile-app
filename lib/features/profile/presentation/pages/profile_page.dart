import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/profile_widgets.dart';

/// Profile tab. Signed out: sign in / create account, track an order, settings, help. Signed in: account hub.
@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<ProfileCubit>(), child: const _ProfileView());
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: context.hoo.colors.background,
      appBar: HooAppBar(title: l.navProfile, showBack: false),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => HooConstrained(child: state.isSignedIn ? _SignedIn(state: state) : const _SignedOut()),
      ),
    );
  }
}

class _SignedOut extends StatelessWidget {
  const _SignedOut();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final router = context.router;
    return ListView(
      padding: const EdgeInsets.only(bottom: HooSpacing.xl),
      children: [
        Padding(
          padding: const EdgeInsets.all(HooSpacing.screen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l.profileSignedOutTitle, style: context.hoo.text.h1),
              const SizedBox(height: HooSpacing.xs),
              Text(l.profileSignedOutBody, style: context.hoo.text.body.copyWith(color: context.hoo.colors.textSecondary)),
              const SizedBox(height: HooSpacing.lg),
              PrimaryButton(label: l.commonSignIn, onPressed: () => router.push(SignInRoute())),
              const SizedBox(height: HooSpacing.sm),
              SecondaryButton(label: l.commonCreateAccount, onPressed: () => router.push(SignUpRoute())),
            ],
          ),
        ),
        HooListTile(title: l.profileTrackOrder, icon: HooIcons.package, onTap: () => router.push(TrackOrderRoute())),
        HooListTile(title: l.profileSettings, icon: HooIcons.appearance, onTap: () => router.push(const SettingsRoute())),
        HooListTile(title: l.profileHelp, icon: HooIcons.help, onTap: () => router.push(const HelpRoute())),
      ],
    );
  }
}

class _SignedIn extends StatelessWidget {
  const _SignedIn({required this.state});
  final ProfileState state;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final router = context.router;
    final cubit = context.read<ProfileCubit>();
    final o = state.overview;
    return RefreshIndicator(
      onRefresh: cubit.loadOverview,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: HooSpacing.xl),
        children: [
          OfflineBanner(visible: state.stale),
          Padding(
            padding: const EdgeInsets.all(HooSpacing.screen),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: c.accentTint,
                  child: Text(state.displayName.isEmpty ? '?' : state.displayName.characters.first.toUpperCase(), style: t.h2),
                ),
                const SizedBox(width: HooSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l.profileGreeting(state.user!.firstName), style: t.h2),
                      Text(state.user!.email ?? state.user!.phone ?? '', style: t.caption.copyWith(color: c.textSecondary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: HooSpacing.screen),
            child: Row(
              children: [
                Expanded(
                  child: _Stat(label: l.profileOrders, value: o?.ordersCount, onTap: () => router.push(const OrdersRoute())),
                ),
                const SizedBox(width: HooSpacing.sm),
                Expanded(
                  child: _Stat(label: l.profileDesigns, value: o?.designsCount, onTap: () => router.push(const MyDesignsRoute())),
                ),
                const SizedBox(width: HooSpacing.sm),
                Expanded(
                  child: _Stat(label: l.profileWishlist, value: o?.wishlistCount, onTap: () => router.push(const WishlistRoute())),
                ),
              ],
            ),
          ),
          ProfileGroupLabel(l.profileGroupShopping),
          HooListTile(
            title: l.ordersTitle,
            icon: HooIcons.package,
            subtitle: (o?.activeOrders ?? 0) > 0 ? l.profileActiveOrders(o!.activeOrders) : null,
            onTap: () => router.push(const OrdersRoute()),
          ),
          HooListTile(title: l.ordersReturnsTitle, icon: HooIcons.package, onTap: () => router.push(const ReturnsRoute())),
          HooListTile(title: l.wishlistAlertsTitle, icon: HooIcons.bell, onTap: () => router.push(const AlertsRoute())),
          ProfileGroupLabel(l.profileGroupAccount),
          HooListTile(title: l.profilePersonalInfo, icon: HooIcons.profile, onTap: () => router.push(const PersonalInfoRoute())),
          HooListTile(title: l.profileAddresses, icon: HooIcons.pin, onTap: () => router.push(const AddressesRoute())),
          HooListTile(title: l.profileSavedCards, icon: HooIcons.card, onTap: () => router.push(const SavedCardsRoute())),
          HooListTile(
            title: l.profileStyleProfile,
            icon: HooIcons.ruler,
            subtitle: state.user!.hasStyleProfile ? null : l.profileStyleProfileHint,
            onTap: () => router.push(StyleProfileRoute()),
          ),
          HooListTile(title: l.profileNotifications, icon: HooIcons.bell, onTap: () => router.push(const NotificationSettingsRoute())),
          HooListTile(title: l.profileChangePassword, icon: HooIcons.eyeOff, onTap: () => router.push(const ChangePasswordRoute())),
          HooListTile(title: l.profileActiveDevices, icon: HooIcons.device, onTap: () => router.push(const ActiveDevicesRoute())),
          ProfileGroupLabel(l.profileGroupMore),
          HooListTile(title: l.profileSettings, icon: HooIcons.appearance, onTap: () => router.push(const SettingsRoute())),
          HooListTile(title: l.profileHelp, icon: HooIcons.help, onTap: () => router.push(const HelpRoute())),
          HooListTile(
            title: l.commonSignOut,
            icon: HooIcons.signOut,
            destructive: true,
            showChevron: false,
            trailing: state.signingOut ? const ProfileRowSpinner() : null,
            onTap: state.signingOut
                ? null
                : () async {
                    final ok = await showHooConfirm(
                      context,
                      title: l.profileSignOutTitle,
                      message: l.profileSignOutMessage,
                      confirmLabel: l.commonSignOut,
                      destructive: true,
                    );
                    if (ok) await cubit.signOut();
                  },
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value, required this.onTap});

  final String label;
  final int? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HooCard(
      onTap: onTap,
      child: Column(
        children: [
          Text(value?.toString() ?? '–', style: context.hoo.text.h2),
          Text(
            label,
            style: context.hoo.text.caption.copyWith(color: context.hoo.colors.textSecondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
