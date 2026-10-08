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

/// Returns and exchanges requested from the account.
@RoutePage()
class ReturnsPage extends StatelessWidget {
  const ReturnsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider(
      create: (_) => sl<ReturnsListCubit>()..load(),
      child: Scaffold(
        backgroundColor: context.hoo.colors.background,
        appBar: HooAppBar(title: l.ordersReturnsTitle),
        body: BlocBuilder<ReturnsListCubit, ReturnsListState>(
          builder: (context, state) {
            final cubit = context.read<ReturnsListCubit>();
            if (state.status == ListStatus.loading && state.items.isEmpty) return const Center(child: HooLoading());
            if (state.status == ListStatus.failure && state.items.isEmpty) return HooErrorState(error: state.error!, onRetry: cubit.load);
            if (state.items.isEmpty) return HooEmptyState(title: l.ordersReturnsEmptyTitle, message: l.ordersReturnsEmptyMessage, icon: HooIcons.package);
            return RefreshIndicator(
              onRefresh: cubit.load,
              child: HooConstrained(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(HooSpacing.screen),
                  children: [
                    OfflineBanner(visible: state.stale),
                    for (final r in state.items)
                      Padding(
                        padding: const EdgeInsets.only(bottom: HooSpacing.sm),
                        child: HooCard(
                          onTap: () => context.router.push(OrderDetailRoute(number: r.orderNumber)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text(r.orderNumber, style: context.hoo.text.bodyStrong)),
                                  Text(r.status.label(l), style: context.hoo.text.label),
                                ],
                              ),
                              Text(
                                '${r.kind.label(l)} · ${l.commonPieces(r.piecesCount)} · ${HooFormat.date(context, r.createdAt)}',
                                style: context.hoo.text.caption.copyWith(color: context.hoo.colors.textSecondary),
                              ),
                              if (r.resolutionNote != null && r.resolutionNote!.isNotEmpty) Text(r.resolutionNote!, style: context.hoo.text.body),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
