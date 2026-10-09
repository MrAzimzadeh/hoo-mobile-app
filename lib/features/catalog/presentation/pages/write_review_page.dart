import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/catalog_repositories.dart';

/// Rating 1–5, title, body. Only customers who received the product can review it, once.
@RoutePage()
class WriteReviewPage extends StatefulWidget {
  const WriteReviewPage({super.key, @PathParam('slug') required this.slug, this.productName});

  final String slug;
  final String? productName;

  @override
  State<WriteReviewPage> createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage> {
  int _rating = 0;
  final _title = TextEditingController();
  final _body = TextEditingController();
  bool _sending = false;
  ApiException? _error;
  bool _done = false;

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _sending = true;
      _error = null;
    });
    try {
      await sl<ReviewRepository>().create(widget.slug, rating: _rating, title: _title.text.trim().isEmpty ? null : _title.text.trim(), body: _body.text.trim());
      setState(() => _done = true);
    } on ApiException catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: HooAppBar(title: l.catalogWriteReview, leading: HooIconButton(icon: HooIcons.close, semanticLabel: l.a11yClose, onPressed: () => context.router.maybePop())),
      body: SafeArea(
        child: _done
            ? HooEmptyState(icon: HooIcons.checkCircle, title: l.catalogReviewThanks, message: l.catalogReviewModeration, actionLabel: l.commonClose, onAction: () => context.router.maybePop())
            : ListView(
                padding: const EdgeInsets.all(HooSpacing.screen),
                children: [
                  if (widget.productName != null) Text(widget.productName!, style: context.hoo.text.h2),
                  const SizedBox(height: HooSpacing.lg),
                  Text(l.catalogYourRating.toUpperCase(), style: context.hoo.text.labelSecondary),
                  RatingInput(value: _rating, onChanged: (v) => setState(() => _rating = v)),
                  const SizedBox(height: HooSpacing.lg),
                  HooTextField(controller: _title, label: '${l.catalogReviewTitle} (${l.commonOptional})', errorText: _error?.fieldError('title')),
                  const SizedBox(height: HooSpacing.md),
                  HooTextField(controller: _body, label: l.catalogReviewBody, maxLines: 6, minLines: 4, maxLength: 2000, errorText: _error?.fieldError('body'), onChanged: (_) => setState(() {})),
                  if (_error != null && _error!.fieldErrors.isEmpty) ...[
                    const SizedBox(height: HooSpacing.md),
                    InlineAlert(kind: HooAlertKind.error, message: errorMessage(context, _error!)),
                  ],
                  const SizedBox(height: HooSpacing.lg),
                  PrimaryButton(label: l.catalogSubmitReview, loading: _sending, onPressed: _rating == 0 || _body.text.trim().length < 3 ? null : _submit),
                ],
              ),
      ),
    );
  }
}
