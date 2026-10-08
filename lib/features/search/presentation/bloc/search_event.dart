part of 'search_bloc.dart';

sealed class SearchEvent {
  const SearchEvent();
}

/// Page opened. [initialQuery] comes from `/search?q=` deep links and is searched right away.
final class SearchStarted extends SearchEvent {
  const SearchStarted({this.initialQuery});
  final String? initialQuery;
}

/// The text in the search field changed (every keystroke). Suggestions follow after the debounce.
final class SearchQueryChanged extends SearchEvent {
  const SearchQueryChanged(this.text);
  final String text;
}

/// Debounced + restartable — internal, dispatched by [SearchQueryChanged].
final class _SuggestionsRequested extends SearchEvent {
  const _SuggestionsRequested(this.text);
  final String text;
}

/// Keyboard "search", a tapped suggestion or a tapped recent search.
final class SearchSubmitted extends SearchEvent {
  const SearchSubmitted(this.text);
  final String text;
}

/// The results grid reached its end.
final class SearchMoreRequested extends SearchEvent {
  const SearchMoreRequested();
}

/// Retry after a failed search.
final class SearchRetried extends SearchEvent {
  const SearchRetried();
}

/// "Clear all" recent searches.
final class SearchRecentCleared extends SearchEvent {
  const SearchRecentCleared();
}
