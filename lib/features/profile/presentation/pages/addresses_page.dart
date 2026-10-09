import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/profile_repositories.dart';

/// Saved addresses (default first).
@RoutePage()
class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final repo = sl<AddressRepository>();
    return BlocProvider(
      create: (_) => LoadCubit<List<SavedAddress>>(repo.list)..load(),
      child: BlocBuilder<LoadCubit<List<SavedAddress>>, LoadState<List<SavedAddress>>>(
        builder: (context, s) {
          final cubit = context.read<LoadCubit<List<SavedAddress>>>();
          Future<void> edit([SavedAddress? a]) async {
            await context.router.push(AddressFormRoute(address: a));
            await cubit.refresh();
          }

          final items = [...?s.data]..sort((a, b) => (b.isDefault ? 1 : 0) - (a.isDefault ? 1 : 0));
          return Scaffold(
            appBar: HooAppBar(title: l.profileAddresses, actions: [HooIconButton(icon: HooIcons.plus, semanticLabel: l.profileAddAddress, onPressed: edit)]),
            body: s.data == null
                ? (s.error != null ? HooErrorState(error: s.error!, onRetry: cubit.load) : const HooLoading())
                : items.isEmpty
                    ? HooEmptyState(icon: HooIcons.pin, title: l.profileNoAddresses, actionLabel: l.profileAddAddress, onAction: edit)
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: HooSpacing.sm),
                        itemCount: items.length,
                        separatorBuilder: (_, _) => Divider(color: context.hoo.colors.border, height: 1, indent: HooSpacing.screen),
                        itemBuilder: (context, i) {
                          final a = items[i];
                          return HooListTile(
                            icon: HooIcons.pin,
                            title: a.isDefault ? '${a.label} · ${l.profileDefault}' : a.label,
                            subtitle: a.address.oneLine,
                            onTap: () => edit(a),
                          );
                        },
                      ),
          );
        },
      ),
    );
  }
}
