import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../cubit/addresses_cubit.dart';
import '../cubit/list_section_cubit.dart';
import '../widgets/profile_widgets.dart';

/// Saved delivery addresses: add, edit, delete, make default.
@RoutePage()
class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<AddressesCubit>()..load(), child: const _View());
}

class _View extends StatelessWidget {
  const _View();

  Future<void> _delete(BuildContext context, SavedAddress a) async {
    final cubit = context.read<AddressesCubit>();
    final l = context.l10n;
    final ok = await showHooConfirm(context, title: l.profileAddressDeleteTitle, message: a.address.oneLine, confirmLabel: l.commonDelete, destructive: true);
    if (!ok) return;
    final error = await cubit.delete(a);
    if (error != null && context.mounted) HooToast.error(context, error);
  }

  Future<void> _open(BuildContext context, [SavedAddress? a]) async {
    final cubit = context.read<AddressesCubit>();
    await context.router.push(AddressFormRoute(address: a));
    await cubit.load();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return BlocBuilder<AddressesCubit, ListSectionState<SavedAddress>>(
      builder: (context, state) {
        final cubit = context.read<AddressesCubit>();
        Widget body;
        if (state.status == SectionStatus.loading) {
          body = const ProfileListSkeleton();
        } else if (state.status == SectionStatus.error) {
          body = HooErrorState(error: state.error!, onRetry: cubit.load);
        } else if (state.isEmpty) {
          body = HooEmptyState(
            title: l.profileAddressesEmptyTitle,
            message: l.profileAddressesEmptyMessage,
            icon: HooIcons.pin,
            actionLabel: state.stale ? null : l.profileAddressAdd,
            onAction: () => _open(context),
          );
        } else {
          body = RefreshIndicator(
            onRefresh: cubit.load,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(HooSpacing.screen),
              children: [
                OfflineBanner(visible: state.stale),
                for (final a in state.items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: HooSpacing.sm),
                    child: HooCard(
                      onTap: state.stale ? null : () => _open(context, a),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(a.label, style: t.bodyStrong),
                                    if (a.isDefault) ...[const SizedBox(width: HooSpacing.xs), ProfileTag(l.profileDefault)],
                                  ],
                                ),
                                Text(a.address.oneLine, style: t.body.copyWith(color: c.textSecondary)),
                                if (!a.isDefault && !state.stale) TextButton(onPressed: () => cubit.makeDefault(a), child: Text(l.profileMakeDefault)),
                              ],
                            ),
                          ),
                          if (state.busyIds.contains(a.id))
                            const ProfileRowSpinner()
                          else
                            HooIconButton(icon: HooIcons.trash, semanticLabel: l.commonDelete, onPressed: state.stale ? null : () => _delete(context, a)),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
        return Scaffold(
          backgroundColor: c.background,
          appBar: HooAppBar(title: l.profileAddresses),
          body: HooConstrained(child: body),
          bottomNavigationBar: state.items.isEmpty || state.stale
              ? null
              : ProfileBottomAction(
                  child: SecondaryButton(label: l.profileAddressAdd, icon: HooIcons.plus, onPressed: () => _open(context)),
                ),
        );
      },
    );
  }
}
