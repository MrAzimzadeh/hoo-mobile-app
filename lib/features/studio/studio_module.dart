import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/preferences.dart';
import '../../shared/application/contracts.dart';
import 'application/garment_viewer.dart';
import 'data/studio_repository.dart';
import 'presentation/bloc/studio_editor_bloc.dart';

/// Composition of the `studio` feature (and the 3D viewer it offers to other features).
void registerStudioModule(GetIt sl) {
  sl
    ..registerLazySingleton<StudioRepository>(() => StudioRepository(sl<ApiClient>()))
    ..registerLazySingleton<GarmentViewerFactory>(() => StudioGarmentViewerFactory(sl<StudioRepository>()))
    ..registerFactory<StudioEditorBloc>(() => StudioEditorBloc(sl<StudioRepository>(), sl<Preferences>()));
}
