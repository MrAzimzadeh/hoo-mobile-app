import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/address_draft.dart';
import '../cubit/address_form_cubit.dart';
import '../widgets/profile_widgets.dart';

/// Create or edit a saved address.
@RoutePage()
class AddressFormPage extends StatelessWidget {
  const AddressFormPage({super.key, this.address});

  final SavedAddress? address;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<AddressFormCubit>(param1: address),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final Map<AddressField, TextEditingController> _c = {
    for (final f in AddressField.values) f: TextEditingController(text: context.read<AddressFormCubit>().state.draft.value(f)),
  };

  @override
  void dispose() {
    for (final c in _c.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocConsumer<AddressFormCubit, AddressFormState>(
      listenWhen: (a, b) => a.saved == null && b.saved != null,
      listener: (context, state) => context.router.maybePop(state.saved),
      builder: (context, state) {
        final cubit = context.read<AddressFormCubit>();
        Widget field(AddressField f, String label, {bool optional = false, int maxLines = 1, TextInputAction action = TextInputAction.next}) {
          final client = state.clientErrors[f];
          final error =
              state.serverErrors[f] ??
              (client == AddressFieldError.required ? l.fieldRequired : (client == AddressFieldError.tooLong ? l.profileFieldTooLong : null));
          return Padding(
            padding: const EdgeInsets.only(bottom: HooSpacing.md),
            child: HooTextField(
              controller: _c[f],
              label: optional ? '$label (${l.commonOptional.toLowerCase()})' : label,
              maxLines: maxLines,
              textInputAction: action,
              errorText: error,
              onChanged: (v) => cubit.setField(f, v),
            ),
          );
        }

        return Scaffold(
          backgroundColor: context.hoo.colors.background,
          appBar: HooAppBar(title: cubit.isEditing ? l.profileAddressEdit : l.profileAddressAdd),
          bottomNavigationBar: ProfileBottomAction(
            child: PrimaryButton(label: l.commonSave, loading: state.saving, onPressed: state.saving ? null : cubit.submit),
          ),
          body: SafeArea(
            child: HooConstrained(
              child: ListView(
                padding: const EdgeInsets.all(HooSpacing.screen),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  if (state.error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: HooSpacing.md),
                      child: InlineAlert(message: errorMessage(context, state.error!), kind: HooAlertKind.error),
                    ),
                  field(AddressField.label, l.profileAddressLabel),
                  field(AddressField.city, l.checkoutCity),
                  field(AddressField.district, l.checkoutDistrict, optional: true),
                  field(AddressField.street, l.checkoutStreet),
                  field(AddressField.building, l.profileBuilding, optional: true),
                  field(AddressField.apartment, l.checkoutApartment, optional: true),
                  field(AddressField.note, l.checkoutCourierNote, optional: true, maxLines: 3, action: TextInputAction.done),
                  HooCheckboxTile(
                    value: state.draft.isDefault,
                    onChanged: cubit.setDefault,
                    label: Text(l.profileMakeDefault, style: context.hoo.text.body),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
