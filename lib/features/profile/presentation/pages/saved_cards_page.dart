import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../cubit/list_section_cubit.dart';
import '../cubit/saved_cards_cubit.dart';
import '../widgets/profile_widgets.dart';

/// Cards saved at checkout ("Save this card"). Only brand + masked number are shown; new cards are added by paying.
@RoutePage()
class SavedCardsPage extends StatelessWidget {
  const SavedCardsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => sl<SavedCardsCubit>()..load(), child: const _View());
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: context.hoo.colors.background,
      appBar: HooAppBar(title: l.profileSavedCards),
      body: BlocBuilder<SavedCardsCubit, ListSectionState<SavedCard>>(
        builder: (context, state) {
          final cubit = context.read<SavedCardsCubit>();
          if (state.status == SectionStatus.loading) return const ProfileListSkeleton();
          if (state.status == SectionStatus.error) return HooErrorState(error: state.error!, onRetry: cubit.load);
          if (state.isEmpty) return HooEmptyState(title: l.profileCardsEmptyTitle, message: l.profileCardsEmptyMessage, icon: HooIcons.card);
          return HooConstrained(
            child: ListView(
              padding: const EdgeInsets.all(HooSpacing.screen),
              children: [
                OfflineBanner(visible: state.stale),
                for (final card in state.items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: HooSpacing.sm),
                    child: HooCard(
                      child: Row(
                        children: [
                          const Icon(HooIcons.card),
                          const SizedBox(width: HooSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${card.brand} ${card.maskedPan}', style: context.hoo.text.bodyStrong),
                                if (card.createdAt != null)
                                  Text(
                                    l.profileCardAdded(HooFormat.date(context, card.createdAt!)),
                                    style: context.hoo.text.caption.copyWith(color: context.hoo.colors.textSecondary),
                                  ),
                              ],
                            ),
                          ),
                          if (state.busyIds.contains(card.id))
                            const ProfileRowSpinner()
                          else
                            HooIconButton(
                              icon: HooIcons.trash,
                              semanticLabel: l.commonDelete,
                              onPressed: () async {
                                final ok = await showHooConfirm(
                                  context,
                                  title: l.profileCardDeleteTitle,
                                  message: '${card.brand} ${card.maskedPan}',
                                  confirmLabel: l.commonDelete,
                                  destructive: true,
                                );
                                if (!ok) return;
                                final error = await cubit.delete(card);
                                if (error != null && context.mounted) HooToast.error(context, error);
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
