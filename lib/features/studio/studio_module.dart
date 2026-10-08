import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../core/session/session_store.dart';
import '../../core/storage/app_database.dart';
import '../../shared/application/contracts.dart';
import 'data/design_save_queue.dart';
import 'data/studio_api.dart';
import 'data/studio_repositories_impl.dart';
import 'data/template_model_loader.dart';
import 'domain/studio_repositories.dart';
import 'presentation/bloc/add_to_bag_cubit.dart';
import 'presentation/bloc/autosave_cubit.dart';
import 'presentation/bloc/designs_cubits.dart';
import 'presentation/bloc/pricing_cubit.dart';
import 'presentation/bloc/studio_editor_bloc.dart';
import 'presentation/bloc/uploads_cubit.dart';
import 'presentation/engine/studio_garment_viewer.dart';
import '../../core/connectivity/connectivity_cubit.dart';

/// Composition of the `studio` feature: config / pricing / uploads / designs, the editor and its helpers, and the
/// [GarmentViewerFactory] other features use to show a 3D product model.
void registerStudioModule(GetIt sl) {
  sl
    ..registerLazySingleton<StudioApi>(() => StudioApi(sl<ApiClient>()))
    ..registerLazySingleton<StudioConfigRepository>(
      () => StudioConfigRepositoryImpl(sl<StudioApi>(), sl<AppDatabase>(), language: () => sl<SessionStore>().language, signedIn: () => sl<AuthGate>().isSignedIn),
    )
    ..registerLazySingleton<StudioPricingRepository>(() => StudioPricingRepositoryImpl(sl<StudioApi>()))
    ..registerLazySingleton<StudioUploadRepository>(() => StudioUploadRepositoryImpl(sl<StudioApi>()))
    ..registerLazySingleton<StudioDesignRepository>(() => StudioDesignRepositoryImpl(sl<StudioApi>()))
    ..registerLazySingleton<DesignSaveQueue>(() => DriftDesignSaveQueue(sl<AppDatabase>()))
    ..registerLazySingleton<TemplateModelLoader>(() => TemplateModelLoader(sl<ApiClient>()))
    ..registerLazySingleton<ImagePickerGateway>(PlatformImagePicker.new)
    ..registerLazySingleton<GarmentViewerFactory>(() => StudioGarmentViewerFactory(sl<ApiClient>()))
    ..registerFactory<StudioEditorBloc>(() => StudioEditorBloc(sl<StudioConfigRepository>(), sl<StudioDesignRepository>()))
    ..registerFactory<PricingCubit>(() => PricingCubit(sl<StudioPricingRepository>()))
    ..registerFactoryParam<AutosaveCubit, String?, void>(
      (designId, _) => AutosaveCubit(sl<StudioDesignRepository>(), sl<DesignSaveQueue>(), online: sl<ConnectivityCubit>().stream, designId: designId),
    )
    ..registerFactory<UploadsCubit>(() => UploadsCubit(sl<StudioUploadRepository>(), sl<ImagePickerGateway>(), sl<ApiClient>()))
    ..registerFactory<AddToBagCubit>(() => AddToBagCubit(sl<StudioDesignRepository>(), sl<BagService>()))
    ..registerFactory<StudioHomeCubit>(() => StudioHomeCubit(sl<StudioConfigRepository>(), sl<StudioDesignRepository>()))
    ..registerFactory<MyDesignsCubit>(() => MyDesignsCubit(sl<StudioDesignRepository>()))
    ..registerFactoryParam<SharedDesignCubit, String, void>((token, _) => SharedDesignCubit(sl<StudioDesignRepository>(), sl<StudioConfigRepository>(), token));
}
