import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../cubit/list_section_cubit.dart';
import '../cubit/notification_prefs_cubit.dart';

/// Topic × channel switches (orders, delivery, alerts, marketing × email, SMS, WhatsApp, push). Locked cells are
/// required by the server (e.g. order updates).
@RoutePage()
class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<NotificationPrefsCubit>()..load(), child: const _View());
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return BlocConsumer<NotificationPrefsCubit, NotificationPrefsState>(
      listenWhen: (a, b) => a.failureSeq != b.failureSeq,
      listener: (context, state) {
        if (state.failure != null) HooToast.error(context, state.failure!);
      },
      builder: (context, state) {
        final cubit = context.read<NotificationPrefsCubit>();
        Widget body;
        if (state.status == SectionStatus.loading) {
          body = const Center(child: HooLoading());
        } else if (state.status == SectionStatus.error) {
          body = HooErrorState(error: state.error!, onRetry: cubit.load);
        } else {
          body = ListView(
            padding: const EdgeInsets.all(HooSpacing.screen),
            children: [
              for (final topic in state.topics) ...[
                Text(topic.label(l), style: t.h3),
                const SizedBox(height: HooSpacing.xs),
                for (final channel in state.channels)
                  if (state.cell(topic, channel) case final cell?)
                    SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      title: Text(channel.label(l), style: t.body),
                      subtitle: cell.locked ? Text(l.profileNotificationRequired, style: t.caption.copyWith(color: c.textSecondary)) : null,
                      value: cell.enabled,
                      onChanged: cell.locked ? null : (v) => cubit.toggle(topic, channel, v),
                    ),
                const Divider(height: HooSpacing.lg),
              ],
            ],
          );
        }
        return Scaffold(
          backgroundColor: c.background,
          appBar: HooAppBar(title: l.profileNotifications),
          body: HooConstrained(child: body),
        );
      },
    );
  }
}
