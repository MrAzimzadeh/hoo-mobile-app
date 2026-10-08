import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../domain/catalog_models.dart';
import '../../domain/catalog_repository.dart';

enum ReviewsStatus { loading, success, failure }

class ReviewsState extends Equatable {
  const ReviewsState({
    this.status = ReviewsStatus.loading,
    this.items = const [],
    this.page = 0,
    this.totalCount = 0,
    this.hasMore = false,
    this.loadingMore = false,
    this.error,
  });

  final ReviewsStatus status;
  final List<Review> items;
  final int page;
  final int totalCount;
  final bool hasMore;
  final bool loadingMore;
  final Object? error;

  @override
  List<Object?> get props => [status, items, page, totalCount, hasMore, loadingMore, error];
}

/// Paged published reviews of one product.
class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this._repo, this.slug, {this.pageSize = 10}) : super(const ReviewsState());

  final ProductRepository _repo;
  final String slug;
  final int pageSize;

  Future<void> load() async {
    emit(ReviewsState(items: state.items, status: state.items.isEmpty ? ReviewsStatus.loading : ReviewsStatus.success));
    try {
      final r = await _repo.reviews(slug, pageSize: pageSize);
      if (isClosed) return;
      emit(ReviewsState(status: ReviewsStatus.success, items: r.items, page: r.page, totalCount: r.totalCount, hasMore: r.canLoadMore));
    } on ApiException catch (e) {
      if (!isClosed) emit(ReviewsState(status: ReviewsStatus.failure, error: e));
    }
  }

  Future<void> loadMore() async {
    final s = state;
    if (!s.hasMore || s.loadingMore || s.status != ReviewsStatus.success) return;
    emit(ReviewsState(status: s.status, items: s.items, page: s.page, totalCount: s.totalCount, hasMore: s.hasMore, loadingMore: true));
    try {
      final r = await _repo.reviews(slug, page: s.page + 1, pageSize: pageSize);
      if (isClosed) return;
      emit(ReviewsState(status: ReviewsStatus.success, items: [...s.items, ...r.items], page: r.page, totalCount: r.totalCount, hasMore: r.canLoadMore));
    } on ApiException catch (e) {
      if (!isClosed) emit(ReviewsState(status: s.status, items: s.items, page: s.page, totalCount: s.totalCount, hasMore: s.hasMore, error: e));
    }
  }
}

enum WriteReviewStatus { editing, submitting, submitted }

class WriteReviewState extends Equatable {
  const WriteReviewState({this.rating = 0, this.status = WriteReviewStatus.editing, this.error, this.showErrors = false});

  final int rating;
  final WriteReviewStatus status;
  final ApiException? error;

  /// Field validation is shown after the first submit attempt.
  final bool showErrors;

  WriteReviewState copyWith({int? rating, WriteReviewStatus? status, ApiException? error, bool clearError = false, bool? showErrors}) => WriteReviewState(
    rating: rating ?? this.rating,
    status: status ?? this.status,
    error: clearError ? null : (error ?? this.error),
    showErrors: showErrors ?? this.showErrors,
  );

  @override
  List<Object?> get props => [rating, status, error, showErrors];
}

/// Write a review (1–5, optional title, body). Only customers with a delivered order can post, once.
class WriteReviewCubit extends Cubit<WriteReviewState> {
  WriteReviewCubit(this._repo, this.slug) : super(const WriteReviewState());

  final ProductRepository _repo;
  final String slug;

  static const minBody = 10;
  static const maxBody = 2000;
  static const maxTitle = 120;

  void setRating(int rating) => emit(state.copyWith(rating: rating.clamp(1, 5), clearError: true));

  static bool bodyValid(String body) => body.trim().length >= minBody;

  Future<bool> submit({String? title, required String body}) async {
    if (state.status == WriteReviewStatus.submitting) return false;
    if (state.rating < 1 || !bodyValid(body)) {
      emit(state.copyWith(showErrors: true));
      return false;
    }
    emit(state.copyWith(status: WriteReviewStatus.submitting, clearError: true, showErrors: true));
    try {
      await _repo.writeReview(slug, rating: state.rating, title: title, body: body);
      if (!isClosed) emit(state.copyWith(status: WriteReviewStatus.submitted));
      return true;
    } on ApiException catch (e) {
      if (!isClosed) emit(state.copyWith(status: WriteReviewStatus.editing, error: e));
      return false;
    }
  }
}
