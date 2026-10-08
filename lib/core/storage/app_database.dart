import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

/// Read-through cache of API responses (catalog, cart, studio config…) used for the explicit offline mode:
/// when the network is down, screens render the last cached copy read-only with an offline banner.
class CacheEntries extends Table {
  TextColumn get key => text()();
  TextColumn get json => text()();
  TextColumn get language => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key, language};
}

/// Offline queue for Studio autosaves (`PATCH /studio/designs/{id}`). Only the latest payload per design is kept.
class PendingDesignSaves extends Table {
  TextColumn get designId => text()();
  TextColumn get payload => text()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get queuedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {designId};
}

@DriftDatabase(tables: [CacheEntries, PendingDesignSaves])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _open());

  /// In-memory database for tests.
  AppDatabase.memory() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _open() => LazyDatabase(() async {
        final dir = await getApplicationSupportDirectory();
        return NativeDatabase.createInBackground(File(p.join(dir.path, 'hoo.sqlite')));
      });

  // ---- cache
  Future<void> putCache(String key, Object? value, {String language = ''}) => into(cacheEntries).insertOnConflictUpdate(
        CacheEntriesCompanion.insert(key: key, json: jsonEncode(value), language: Value(language), updatedAt: DateTime.now()),
      );

  Future<({Object? value, DateTime updatedAt})?> readCache(String key, {String language = ''}) async {
    final row = await (select(cacheEntries)..where((t) => t.key.equals(key) & t.language.equals(language))).getSingleOrNull();
    if (row == null) return null;
    return (value: jsonDecode(row.json), updatedAt: row.updatedAt);
  }

  Future<void> clearCache() => delete(cacheEntries).go();

  // ---- studio autosave queue
  Future<void> enqueueDesignSave(String designId, Map<String, dynamic> payload) => into(pendingDesignSaves).insertOnConflictUpdate(
        PendingDesignSavesCompanion.insert(designId: designId, payload: jsonEncode(payload), queuedAt: DateTime.now()),
      );

  Future<List<PendingDesignSave>> queuedDesignSaves() => (select(pendingDesignSaves)..orderBy([(t) => OrderingTerm.asc(t.queuedAt)])).get();

  Future<void> removeDesignSave(String designId) => (delete(pendingDesignSaves)..where((t) => t.designId.equals(designId))).go();

  Future<void> bumpDesignSaveAttempt(String designId) => customStatement(
        'UPDATE pending_design_saves SET attempts = attempts + 1 WHERE design_id = ?',
        [designId],
      );
}
