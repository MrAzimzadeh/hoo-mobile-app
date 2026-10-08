import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/catalog_models.dart';
import '../cubit/reviews_cubit.dart';

/// Reviews of one product, newest first, with "Write a review".
@RoutePage()
class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, @PathParam('slug') required this.slug, this.productName});

  final String slug;
  final String? productName;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocProvider(
      create: (_) => sl<ReviewsCubit>(param1: slug)..load(),
      child: Scaffold(
        backgroundColor: context.hoo.colors.background,
        appBar: HooAppBar(title: productName ?? l.catalogReviews),
        body: SafeArea(
          child: HooConstrained(
            child: BlocBuilder<ReviewsCubit, ReviewsState>(
              builder: (context, state) {
                final cubit = context.read<ReviewsCubit>();
                if (state.status == ReviewsStatus.loading) return const Center(child: HooLoading());
                if (state.status == ReviewsStatus.failure) return HooErrorState(error: state.error!, onRetry: cubit.load);
                return RefreshIndicator(
                  onRefresh: cubit.load,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(HooSpacing.screen),
                    children: [
                      SecondaryButton(
                        label: l.catalogWriteReview,
                        icon: HooIcons.star,
                        onPressed: () async {
                          final router = context.router;
                          final ok = await sl<AuthGate>().requireSignIn(context, reason: l.catalogReviewSignIn);
                          if (ok) await router.push(WriteReviewRoute(slug: slug, productName: productName));
                        },
                      ),
                      const SizedBox(height: HooSpacing.lg),
                      if (state.items.isEmpty)
                        HooEmptyState(title: l.catalogNoReviewsTitle, message: l.catalogNoReviewsMessage, icon: HooIcons.star, compact: true)
                      else ...[
                        for (final r in state.items) _ReviewTile(review: r),
                        if (state.hasMore)
                          Padding(
                            padding: const EdgeInsets.only(top: HooSpacing.sm),
                            child: SecondaryButton(label: l.commonShowMore, loading: state.loadingMore, onPressed: cubit.loadMore),
                          ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({required this.review});
  final Review review;

  @override
  Widget build(BuildContext context) {
    final t = context.hoo.text;
    final c = context.hoo.colors;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: HooSpacing.md),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: c.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RatingStars(rating: review.rating.toDouble(), size: 16),
              const Spacer(),
              Text(HooFormat.date(context, review.createdAt), style: t.caption.copyWith(color: c.textSecondary)),
            ],
          ),
          if (review.title?.isNotEmpty ?? false) ...[const SizedBox(height: HooSpacing.xs), Text(review.title!, style: t.bodyStrong)],
          const SizedBox(height: HooSpacing.xs),
          Text(review.body, style: t.body),
          if (review.authorName.isNotEmpty) ...[
            const SizedBox(height: HooSpacing.xs),
            Text(review.authorName, style: t.caption.copyWith(color: c.textSecondary)),
          ],
        ],
      ),
    );
  }
}
