import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/device_descriptor.dart';
import '../../domain/profile_models.dart';
import '../../domain/profile_repositories.dart';

/// Active sessions; sign out any device except this one.
@RoutePage()
class ActiveDevicesPage extends StatelessWidget {
  const ActiveDevicesPage({super.key});

  String _name(BuildContext context, DeviceSession s) {
    final l = context.l10n;
    final d = DeviceDescriptor.parse(s.userAgent);
    if (d.client == DeviceClient.app) return l.profileDeviceApp(d.platform.displayName.isEmpty ? '' : d.platform.displayName).trim();
    final parts = [d.client.displayName, d.platform.displayName].where((p) => p.isNotEmpty);
    return parts.isEmpty ? l.profileDeviceUnknown : parts.join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final repo = sl<SessionsRepository>();
    return BlocProvider(
      create: (_) => LoadCubit<List<DeviceSession>>(repo.list)..load(),
      child: Scaffold(
        appBar: HooAppBar(title: l.profileDevices),
        body: BlocBuilder<LoadCubit<List<DeviceSession>>, LoadState<List<DeviceSession>>>(
          builder: (context, s) {
            final cubit = context.read<LoadCubit<List<DeviceSession>>>();
            final items = s.data;
            if (items == null) return s.error != null ? HooErrorState(error: s.error!, onRetry: cubit.load) : const HooLoading();
            final sorted = [...items]..sort((a, b) => (b.isCurrent ? 1 : 0) - (a.isCurrent ? 1 : 0));
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: HooSpacing.sm),
              children: [
                for (final d in sorted)
                  HooListTile(
                    icon: DeviceDescriptor.parse(d.userAgent).platform.isMobile ? HooIcons.device : HooIcons.globe,
                    title: _name(context, d),
                    subtitle: d.isCurrent ? l.profileThisDevice : l.profileLastSeen(HooFormat.relative(context, d.lastSeenAt)),
                    showChevron: false,
                    trailing: d.isCurrent
                        ? null
                        : HooTextButton(
                            label: l.commonSignOut,
                            style: HooType.caption.copyWith(fontWeight: FontWeight.w600),
                            onPressed: () async {
                              try {
                                await repo.revoke(d.id);
                                cubit.replace(items.where((x) => x.id != d.id).toList());
                              } catch (e) {
                                if (context.mounted) HooToast.error(context, e);
                              }
                            },
                          ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
