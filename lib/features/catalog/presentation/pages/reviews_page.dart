import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/catalog_models.dart';
import '../../domain/catalog_repositories.dart';

/// Published reviews, paged.
@RoutePage()
class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key, @PathParam('slug') required this.slug, this.productName});

  final String slug;
  final String? productName;

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final _items = <Review>[];
  int _page = 0;
  bool _hasMore = true;
  bool _loading = false;
  Object? _error;
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.extentAfter < 400) _more();
    });
    _more();
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _more() async {
    if (_loading || !_hasMore) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final page = await sl<ReviewRepository>().reviews(widget.slug, page: _page + 1);
      setState(() {
        _items.addAll(page.items);
        _page = page.page;
        _hasMore = page.canLoadMore;
      });
    } catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: HooAppBar(title: widget.productName ?? l.catalogReviews),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.hoo.colors.primaryAction,
        foregroundColor: context.hoo.colors.onPrimaryAction,
        elevation: 0,
        onPressed: () => context.router.push(WriteReviewRoute(slug: widget.slug, productName: widget.productName)),
        icon: const Icon(HooIcons.edit),
        label: Text(l.catalogWriteReview),
      ),
      body: _items.isEmpty && _error != null
          ? HooErrorState(error: _error!, onRetry: _more)
          : _items.isEmpty && !_loading
              ? HooEmptyState(icon: HooIcons.star, title: l.catalogNoReviews, message: l.catalogNoReviewsBody)
              : ListView.separated(
                  controller: _scroll,
                  padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.md, HooSpacing.screen, 96),
                  itemCount: _items.length + (_loading ? 1 : 0),
                  separatorBuilder: (_, _) => Divider(color: context.hoo.colors.border, height: HooSpacing.xl),
                  itemBuilder: (context, i) {
                    if (i >= _items.length) return const Padding(padding: EdgeInsets.all(HooSpacing.lg), child: HooLoading());
                    final r = _items[i];
                    return HooReveal(
                      index: i % 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            RatingStars(rating: r.rating.toDouble()),
                            const Spacer(),
                            Text(HooFormat.date(context, r.createdAt), style: context.hoo.text.caption),
                          ]),
                          if (r.title?.isNotEmpty ?? false) ...[const SizedBox(height: HooSpacing.xs), Text(r.title!, style: context.hoo.text.bodyStrong)],
                          const SizedBox(height: HooSpacing.xxs),
                          Text(r.body, style: context.hoo.text.body),
                          const SizedBox(height: HooSpacing.xs),
                          Text(r.authorName, style: context.hoo.text.caption),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
