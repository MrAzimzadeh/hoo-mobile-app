/// Undo/redo over immutable snapshots (port of web `history.ts`).
///
/// * [commit] records a step; consecutive commits with the same `key` inside [coalesceWindow] share one step
///   (typing, slider drags).
/// * Gestures call [checkpoint] once at the start, then [replacePresent] for every frame — one undo step each.
class History<T> {
  const History._(this.past, this.present, this.future, this.lastKey, this.lastAt);

  History(T present) : this._(const [], present, const [], null, null);

  static const limit = 100;
  static const coalesceWindow = Duration(milliseconds: 900);

  final List<T> past;
  final T present;
  final List<T> future;
  final String? lastKey;
  final DateTime? lastAt;

  bool get canUndo => past.isNotEmpty;
  bool get canRedo => future.isNotEmpty;

  History<T> commit(T next, {String? key, DateTime? at}) {
    if (identical(next, present) || next == present) return this;
    final now = at ?? DateTime.now();
    final last = lastAt;
    final coalesce = key != null && key == lastKey && last != null && now.difference(last) <= coalesceWindow && past.isNotEmpty;
    final nextPast = coalesce ? past : _trim([...past, present]);
    return History._(nextPast, next, const [], key, now);
  }

  /// Replaces the present without recording (mid-gesture, after a [checkpoint]).
  History<T> replacePresent(T next) => identical(next, present) ? this : History._(past, next, future, lastKey, lastAt);

  /// Records the current present as an undo step (gesture start).
  History<T> checkpoint() => History._(_trim([...past, present]), present, const [], null, null);

  /// Drops a checkpoint that turned out to be a no-op (tap without movement).
  History<T> dropCheckpointIfUnchanged() =>
      past.isNotEmpty && (identical(past.last, present) || past.last == present) ? History._(past.sublist(0, past.length - 1), present, future, null, null) : this;

  History<T> undo() {
    if (past.isEmpty) return this;
    return History._(past.sublist(0, past.length - 1), past.last, [present, ...future], null, null);
  }

  History<T> redo() {
    if (future.isEmpty) return this;
    return History._([...past, present], future.first, future.sublist(1), null, null);
  }

  static List<T> _trim<T>(List<T> list) => list.length > limit ? list.sublist(list.length - limit) : list;
}
