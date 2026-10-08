import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/profile_models.dart';
import '../cubit/active_devices_cubit.dart';
import '../cubit/list_section_cubit.dart';
import '../widgets/profile_widgets.dart';

/// Where the account is signed in; sign out of other devices.
@RoutePage()
class ActiveDevicesPage extends StatelessWidget {
  const ActiveDevicesPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<ActiveDevicesCubit>()..load(), child: const _View());
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return BlocBuilder<ActiveDevicesCubit, ListSectionState<ActiveSession>>(
      builder: (context, state) {
        final cubit = context.read<ActiveDevicesCubit>();
        Widget body;
        if (state.status == SectionStatus.loading) {
          body = const ProfileListSkeleton();
        } else if (state.status == SectionStatus.error) {
          body = HooErrorState(error: state.error!, onRetry: cubit.load);
        } else {
          body = RefreshIndicator(
            onRefresh: cubit.load,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(HooSpacing.screen),
              children: [
                OfflineBanner(visible: state.stale),
                for (final s in state.items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: HooSpacing.sm),
                    child: HooCard(
                      child: Row(
                        children: [
                          const Icon(HooIcons.device),
                          const SizedBox(width: HooSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(s.userAgent ?? l.profileUnknownDevice, style: t.bodyStrong, maxLines: 1, overflow: TextOverflow.ellipsis),
                                    ),
                                    if (s.isCurrent) ...[const SizedBox(width: HooSpacing.xs), ProfileTag(l.profileThisDevice)],
                                  ],
                                ),
                                Text('${s.ipAddress ?? ''} · ${HooFormat.dateTime(context, s.lastSeenAt)}', style: t.caption.copyWith(color: c.textSecondary)),
                              ],
                            ),
                          ),
                          if (state.busyIds.contains(s.id))
                            const ProfileRowSpinner()
                          else if (!s.isCurrent)
                            TextButton(
                              onPressed: () async {
                                final error = await cubit.revoke(s);
                                if (error != null && context.mounted) HooToast.error(context, error);
                              },
                              child: Text(l.profileSignOutDevice),
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
        final others = state.items.where((s) => !s.isCurrent).length;
        return Scaffold(
          backgroundColor: c.background,
          appBar: HooAppBar(title: l.profileActiveDevices),
          body: HooConstrained(child: body),
          bottomNavigationBar: others == 0 || state.stale
              ? null
              : ProfileBottomAction(
                  child: SecondaryButton(
                    label: l.profileSignOutOthers,
                    onPressed: () async {
                      final ok = await showHooConfirm(context, title: l.profileSignOutOthers, confirmLabel: l.commonSignOut, destructive: true);
                      if (!ok) return;
                      final error = await cubit.revokeOthers();
                      if (error != null && context.mounted) HooToast.error(context, error);
                    },
                  ),
                ),
        );
      },
    );
  }
}
