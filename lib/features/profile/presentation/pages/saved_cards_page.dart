import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/profile_repositories.dart';

/// Cards saved at EPoint (masks only).
@RoutePage()
class SavedCardsPage extends StatelessWidget {
  const SavedCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final repo = sl<SavedCardsRepository>();
    return BlocProvider(
      create: (_) => LoadCubit<List<SavedCard>>(repo.list)..load(),
      child: Scaffold(
        appBar: HooAppBar(title: l.profileSavedCards),
        body: BlocBuilder<LoadCubit<List<SavedCard>>, LoadState<List<SavedCard>>>(
          builder: (context, s) {
            final cubit = context.read<LoadCubit<List<SavedCard>>>();
            final cards = s.data;
            if (cards == null) return s.error != null ? HooErrorState(error: s.error!, onRetry: cubit.load) : const HooLoading();
            if (cards.isEmpty) return HooEmptyState(icon: HooIcons.card, title: l.profileNoCards, message: l.profileNoCardsBody);
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: HooSpacing.sm),
              children: [
                for (final c in cards)
                  HooListTile(
                    icon: HooIcons.card,
                    title: '${c.brand} ${c.maskedPan}',
                    showChevron: false,
                    trailing: HooIconButton(
                      icon: HooIcons.trash,
                      semanticLabel: l.commonDelete,
                      onPressed: () async {
                        if (!await showHooConfirm(context, title: l.profileDeleteCard, confirmLabel: l.commonDelete, destructive: true)) return;
                        try {
                          await repo.delete(c.id);
                          cubit.replace(cards.where((x) => x.id != c.id).toList());
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
