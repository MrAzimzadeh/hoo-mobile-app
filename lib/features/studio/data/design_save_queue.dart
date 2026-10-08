import 'dart:convert';

import '../../../core/storage/app_database.dart';

/// Offline queue for autosaves, backed by the Drift `PendingDesignSaves` table (one latest payload per design).
abstract interface class DesignSaveQueue {
  Future<void> enqueue(String designId, Map<String, dynamic> payload);
  Future<List<QueuedDesignSave>> pending();
  Future<void> remove(String designId);
  Future<void> markFailedAttempt(String designId);
}

class QueuedDesignSave {
  const QueuedDesignSave(this.designId, this.payload, this.attempts);
  final String designId;
  final Map<String, dynamic> payload;
  final int attempts;
}

class DriftDesignSaveQueue implements DesignSaveQueue {
  DriftDesignSaveQueue(this._db);
  final AppDatabase _db;

  @override
  Future<void> enqueue(String designId, Map<String, dynamic> payload) => _db.enqueueDesignSave(designId, payload);

  @override
  Future<List<QueuedDesignSave>> pending() async => [
        for (final row in await _db.queuedDesignSaves()) QueuedDesignSave(row.designId, (jsonDecode(row.payload) as Map).cast<String, dynamic>(), row.attempts),
      ];

  @override
  Future<void> remove(String designId) => _db.removeDesignSave(designId);

  @override
  Future<void> markFailedAttempt(String designId) => _db.bumpDesignSaveAttempt(designId);
}
