import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/profile_models.dart';
import '../../domain/profile_repositories.dart';
import 'list_section_cubit.dart';

/// Measurement input of the style profile.
enum Measurement { height, weight, chest, waist }

class StyleProfileState extends Equatable {
  const StyleProfileState({
    this.status = SectionStatus.loading,
    this.profile = const StyleProfile(),
    this.loadError,
    this.saving = false,
    this.saveError,
    this.saved = false,
    this.colorLimitHit = 0,
    this.dirty = false,
  });

  final SectionStatus status;
  final StyleProfile profile;
  final Object? loadError;
  final bool saving;
  final ApiException? saveError;

  /// Set after a successful save — the page pops / continues.
  final bool saved;

  /// Incremented each time the user tries to pick a 4th color (the page nudges once per attempt).
  final int colorLimitHit;
  final bool dirty;

  /// Measurement → out-of-range flag, mirroring the server ranges.
  Map<Measurement, bool> get rangeErrors => {
    for (final m in Measurement.values)
      if (_outOfRange(m)) m: true,
  };

  bool get canSave => rangeErrors.isEmpty && !saving;

  int? value(Measurement m) => switch (m) {
    Measurement.height => profile.heightCm,
    Measurement.weight => profile.weightKg,
    Measurement.chest => profile.chestCm,
    Measurement.waist => profile.waistCm,
  };

  static ({int min, int max}) range(Measurement m) => switch (m) {
    Measurement.height => StyleProfile.heightRange,
    Measurement.weight => StyleProfile.weightRange,
    Measurement.chest => StyleProfile.chestRange,
    Measurement.waist => StyleProfile.waistRange,
  };

  bool _outOfRange(Measurement m) {
    final v = value(m);
    if (v == null) return false;
    final r = range(m);
    return v < r.min || v > r.max;
  }

  StyleProfileState copyWith({
    SectionStatus? status,
    StyleProfile? profile,
    Object? loadError,
    bool? saving,
    ApiException? saveError,
    bool clearSaveError = false,
    bool? saved,
    int? colorLimitHit,
    bool? dirty,
  }) => StyleProfileState(
    status: status ?? this.status,
    profile: profile ?? this.profile,
    loadError: loadError ?? this.loadError,
    saving: saving ?? this.saving,
    saveError: clearSaveError ? null : (saveError ?? this.saveError),
    saved: saved ?? this.saved,
    colorLimitHit: colorLimitHit ?? this.colorLimitHit,
    dirty: dirty ?? this.dirty,
  );

  @override
  List<Object?> get props => [status, profile, loadError, saving, saveError, saved, colorLimitHit, dirty];
}

/// Style profile editor (`GET/PUT /account/style-profile`). After saving, the session is refreshed so
/// `Me.hasStyleProfile` and size defaults elsewhere pick it up.
class StyleProfileCubit extends Cubit<StyleProfileState> {
  StyleProfileCubit(this._repo, this._auth) : super(const StyleProfileState());

  final StyleProfileRepository _repo;
  final AuthGate _auth;

  Future<void> load() async {
    emit(const StyleProfileState());
    try {
      final p = await _repo.get();
      if (!isClosed) emit(state.copyWith(status: SectionStatus.ready, profile: p ?? const StyleProfile()));
    } on ApiException catch (e) {
      if (!isClosed) emit(StyleProfileState(status: SectionStatus.error, loadError: e));
    }
  }

  void _update(StyleProfile p) => emit(state.copyWith(profile: p, dirty: true, saved: false, clearSaveError: true));

  /// Raw text from a numeric field; empty clears the value.
  void setMeasurement(Measurement m, String raw) {
    final v = int.tryParse(raw.trim());
    final p = state.profile;
    _update(switch (m) {
      Measurement.height => p.copyWith(heightCm: v),
      Measurement.weight => p.copyWith(weightKg: v),
      Measurement.chest => p.copyWith(chestCm: v),
      Measurement.waist => p.copyWith(waistCm: v),
    });
  }

  /// Tapping the selected size/fit again clears it (every field is optional).
  void setUsualSize(Size size) => _update(state.profile.copyWith(usualSize: state.profile.usualSize == size ? null : size));

  void setPreferredFit(Fit fit) => _update(state.profile.copyWith(preferredFit: state.profile.preferredFit == fit ? null : fit));

  void toggleColor(ColorFamily family) {
    final colors = state.profile.favoriteColors;
    if (colors.contains(family)) {
      _update(state.profile.copyWith(favoriteColors: colors.where((c) => c != family).toList()));
    } else if (colors.length >= StyleProfile.maxFavoriteColors) {
      emit(state.copyWith(colorLimitHit: state.colorLimitHit + 1));
    } else {
      _update(state.profile.copyWith(favoriteColors: [...colors, family]));
    }
  }

  void toggleStyle(StyleTag tag) {
    final styles = state.profile.styles;
    _update(state.profile.copyWith(styles: styles.contains(tag) ? styles.where((s) => s != tag).toList() : [...styles, tag]));
  }

  Future<void> save() async {
    if (!state.canSave) return;
    emit(state.copyWith(saving: true, clearSaveError: true));
    try {
      final saved = await _repo.save(state.profile);
      await _auth.refreshUser().catchError((Object _) {});
      if (!isClosed) emit(state.copyWith(saving: false, profile: saved, saved: true, dirty: false));
    } on ApiException catch (e) {
      if (!isClosed) emit(state.copyWith(saving: false, saveError: e));
    }
  }
}
