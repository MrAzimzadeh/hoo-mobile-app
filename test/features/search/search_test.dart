import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/storage/app_database.dart';
import 'package:hoo/features/search/data/search_api.dart';
import 'package:hoo/features/search/data/search_repository_impl.dart';
import 'package:hoo/features/search/presentation/bloc/search_bloc.dart';

import '../../helpers/fake_api.dart';

const _card = {'id': 'p1', 'slug': 'hoodie', 'name': 'Black Hoodie', 'price': 89.0};

void main() {
  test('typing is debounced into one suggest request; submit loads results', () async {
    final adapter = FakeApiAdapter({
      'GET /search/suggest': (_) => (200, ['hoodie', 'hoodie zip']),
      'GET /search/recent': (_) => (200, ['tee']),
      'GET /search': (r) => (
        200,
        {
          'items': [_card],
          'totalCount': 1,
          'suggestDesignYourOwn': false,
        },
      ),
      'GET /catalog/bestsellers': (_) => (200, [_card]),
    });
    final api = SearchApi(fakeApiClient({}, adapter: adapter));
    final db = AppDatabase.memory();
    addTearDown(db.close);
    final bloc = SearchBloc(SearchRepositoryImpl(api), SearchDiscoveryRepositoryImpl(api, db, () => 'az'), debounce: const Duration(milliseconds: 20));
    addTearDown(bloc.close);

    bloc
      ..add(const SearchStarted())
      ..add(const SearchQueryChanged('h'))
      ..add(const SearchQueryChanged('ho'))
      ..add(const SearchQueryChanged('hoo'));
    final suggestions = await bloc.stream.firstWhere((s) => s.suggestions.isNotEmpty);
    expect(suggestions.suggestions, ['hoodie', 'hoodie zip']);
    expect(adapter.requests.where((r) => r.path == '/search/suggest').length, 1);

    bloc.add(const SearchSubmitted('hoodie'));
    final results = await bloc.stream.firstWhere((s) => s.resultsStatus == SearchStatus.success);
    expect(results.view, SearchView.results);
    expect(results.items.single.slug, 'hoodie');
  });
}
