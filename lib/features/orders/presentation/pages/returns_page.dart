import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../cubit/orders_list_cubit.dart';
import '../cubit/returns_cubit.dart';

/// My return / exchange requests.
@RoutePage()
class ReturnsPage extends StatelessWidget {
  const ReturnsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider(
      create: (_) => sl<ReturnsCubit>()..load(),
      child: Scaffold(
        appBar: HooAppBar(title: l.ordersReturnsTitle),
        body: BlocBuilder<ReturnsCubit, ReturnsState>(
          builder: (context, s) {
            final cubit = context.read<ReturnsCubit>();
            if (s.status == ListStatus.loading) return const HooLoading();
            if (s.status == ListStatus.failure) return HooErrorState(error: s.error!, onRetry: cubit.load);
            if (s.items.isEmpty) return HooEmptyState(icon: HooIcons.swap, title: l.ordersReturnsEmpty, message: l.ordersReturnsEmptyBody);
            return RefreshIndicator(
              onRefresh: cubit.load,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: HooSpacing.sm),
                itemCount: s.items.length,
                separatorBuilder: (_, _) => Divider(color: context.hoo.colors.border, height: 1, indent: HooSpacing.screen),
                itemBuilder: (context, i) {
                  final r = s.items[i];
                  return HooListTile(
                    title: '${r.kind.label(l)} · ${r.orderNumber}',
                    subtitle: [r.status.label(l), HooFormat.date(context, r.createdAt), ?r.resolutionNote].join(' · '),
                    onTap: () => context.router.push(OrderDetailRoute(number: r.orderNumber)),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
