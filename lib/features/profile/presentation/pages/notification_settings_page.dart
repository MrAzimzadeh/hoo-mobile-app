import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/push/push_service.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../domain/profile_models.dart';
import '../../domain/profile_repositories.dart';

/// Topic × channel switches (Orders, Delivery, Alerts, Marketing × Email, SMS, WhatsApp, Push). Locked ones are
/// required (e.g. order SMS) and can't be turned off.
@RoutePage()
class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final repo = sl<NotificationPreferencesRepository>();
    return BlocProvider(
      create: (_) => LoadCubit<List<NotificationPreference>>(repo.load)..load(),
      child: Scaffold(
        appBar: HooAppBar(title: l.profileNotifications),
        body: BlocBuilder<LoadCubit<List<NotificationPreference>>, LoadState<List<NotificationPreference>>>(
          builder: (context, s) {
            final cubit = context.read<LoadCubit<List<NotificationPreference>>>();
            final prefs = s.data?.where((p) => p.isKnown).toList();
            if (prefs == null) return s.error != null ? HooErrorState(error: s.error!, onRetry: cubit.load) : const HooLoading();
            final topics = NotificationTopic.values.where((t) => prefs.any((p) => p.topic == t)).toList();
            Future<void> toggle(NotificationPreference p, bool v) async {
              final before = s.data!;
              final next = [for (final x in before) x.topic == p.topic && x.channel == p.channel ? x.copyWith(enabled: v) : x];
              cubit.replace(next);
              try {
                cubit.replace(await repo.save(next));
                if (v && p.channel == NotificationChannel.push) await sl<PushService>().enable();
              } catch (e) {
                cubit.replace(before);
                if (context.mounted) HooToast.error(context, e);
              }
            }

            return ListView(
              padding: const EdgeInsets.all(HooSpacing.screen),
              children: [
                for (final t in topics) ...[
                  Text(t.label(l), style: context.hoo.text.h3),
                  const SizedBox(height: HooSpacing.xs),
                  for (final p in prefs.where((p) => p.topic == t))
                    SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      value: p.enabled,
                      onChanged: p.locked ? null : (v) => toggle(p, v),
                      title: Text(p.channel.label(l), style: context.hoo.text.body),
                      subtitle: p.locked ? Text(l.profileRequiredNotification, style: context.hoo.text.caption) : null,
                    ),
                  Divider(color: context.hoo.colors.border, height: HooSpacing.xl),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
