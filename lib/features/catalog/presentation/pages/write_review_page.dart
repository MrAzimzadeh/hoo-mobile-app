import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../cubit/reviews_cubit.dart';

/// Rating (1–5), optional title and a body. Reviews are published after moderation.
@RoutePage()
class WriteReviewPage extends StatelessWidget {
  const WriteReviewPage({super.key, @PathParam('slug') required this.slug, this.productName});

  final String slug;
  final String? productName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<WriteReviewCubit>(param1: slug),
      child: _WriteReviewView(productName: productName),
    );
  }
}

class _WriteReviewView extends StatefulWidget {
  const _WriteReviewView({this.productName});
  final String? productName;

  @override
  State<_WriteReviewView> createState() => _WriteReviewViewState();
}

class _WriteReviewViewState extends State<_WriteReviewView> {
  final _title = TextEditingController();
  final _body = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final router = context.router;
    final l = context.l10n;
    final cubit = context.read<WriteReviewCubit>();
    final ok = await cubit.submit(title: _title.text.trim().isEmpty ? null : _title.text.trim(), body: _body.text.trim());
    if (!ok || !mounted) return;
    unawaited(HooHaptics.success());
    HooToast.success(context, l.catalogReviewThanks);
    await router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    return Scaffold(
      backgroundColor: context.hoo.colors.background,
      appBar: HooAppBar(title: l.catalogWriteReview),
      body: SafeArea(
        child: HooConstrained(
          child: BlocBuilder<WriteReviewCubit, WriteReviewState>(
            builder: (context, state) {
              final cubit = context.read<WriteReviewCubit>();
              final submitting = state.status == WriteReviewStatus.submitting;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(HooSpacing.screen),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.productName != null) Text(widget.productName!, style: t.h2),
                    const SizedBox(height: HooSpacing.lg),
                    FormErrorLine(error: state.error),
                    Text(l.catalogYourRating, style: t.bodyStrong),
                    const SizedBox(height: HooSpacing.xs),
                    RatingInput(value: state.rating, onChanged: cubit.setRating),
                    if (state.showErrors && state.rating < 1)
                      Padding(
                        padding: const EdgeInsets.only(top: HooSpacing.xs),
                        child: Text(l.catalogRatingRequired, style: t.caption.copyWith(color: context.hoo.colors.error)),
                      ),
                    const SizedBox(height: HooSpacing.lg),
                    HooTextField(
                      controller: _title,
                      label: '${l.catalogReviewTitle} (${l.commonOptional.toLowerCase()})',
                      maxLength: WriteReviewCubit.maxTitle,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: HooSpacing.md),
                    HooTextField(
                      controller: _body,
                      label: l.catalogReviewBody,
                      minLines: 4,
                      maxLines: 8,
                      maxLength: WriteReviewCubit.maxBody,
                      errorText: state.showErrors && !WriteReviewCubit.bodyValid(_body.text) ? l.catalogReviewBodyShort(WriteReviewCubit.minBody) : null,
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: HooSpacing.sm),
                    Text(l.catalogReviewModeration, style: t.caption.copyWith(color: context.hoo.colors.textSecondary)),
                    const SizedBox(height: HooSpacing.lg),
                    PrimaryButton(label: l.catalogReviewSubmit, loading: submitting, onPressed: submitting ? null : _submit),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Server failure above a form.
class FormErrorLine extends StatelessWidget {
  const FormErrorLine({super.key, required this.error});
  final Object? error;

  @override
  Widget build(BuildContext context) {
    if (error == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: HooSpacing.md),
      child: InlineAlert(message: errorMessage(context, error!), kind: HooAlertKind.error),
    );
  }
}
