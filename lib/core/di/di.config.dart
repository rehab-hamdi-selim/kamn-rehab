// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/sports_service_providers/data/data_source/service_provider_ground_details_data_source.dart'
    as _i501;
import '../../features/sports_service_providers/data/data_source/service_provider_grounds_data_source.dart'
    as _i541;
import '../../features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart'
    as _i1047;
import '../../features/sports_service_providers/data/repository/service_provider_ground_details_repository.dart'
    as _i339;
import '../../features/sports_service_providers/data/repository/service_provider_grounds_repository.dart'
    as _i834;
import '../../features/sports_service_providers/data/repository/service_providers_repository.dart'
    as _i542;
import '../../features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart'
    as _i252;
import '../../features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart'
    as _i692;
import '../../features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart'
    as _i987;
import '../common/class/firebase_storage_services.dart' as _i304;
import '../common/class/firestore_services.dart' as _i158;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i304.FirebaseStorageServices>(
        () => _i304.FirebaseStorageServices());
    gh.singleton<_i158.FirestoreService>(() => _i158.FirestoreService());
    gh.factory<_i1047.ServiceProvidersRemoteDataSource>(
        () => _i1047.ServiceProvidersRemoteDataSourceImpl(
              firestoreServices: gh<_i158.FirestoreService>(),
              storageServies: gh<_i304.FirebaseStorageServices>(),
            ));
    gh.factory<_i501.ServiceProviderGroundDetailsDataSource>(() =>
        _i501.ServiceProviderGroundDetailsDataSourceImpl(
            firestoreServices: gh<_i158.FirestoreService>()));
    gh.factory<_i541.ServiceProviderGroundsDataSource>(() =>
        _i541.ServiceProviderGroundsDataSourceImpl(
            firestoreServices: gh<_i158.FirestoreService>()));
    gh.factory<_i542.ServiceProvidersRepository>(() =>
        _i542.ServiceProvidersRepositoryImpl(
            dataSource: gh<_i1047.ServiceProvidersRemoteDataSource>()));
    gh.factory<_i339.ServiceProviderGroundDetailsRepository>(() =>
        _i339.ServiceProviderGroundDetailsRepositoryImpl(
            dataSource: gh<_i501.ServiceProviderGroundDetailsDataSource>()));
    gh.factory<_i252.AddServiceProviderCubit>(() =>
        _i252.AddServiceProviderCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i834.ServiceProviderGroundsRepository>(() =>
        _i834.ServiceProviderGroundsRepositoryImpl(
            dataSource: gh<_i541.ServiceProviderGroundsDataSource>()));
    gh.factory<_i692.ServiceProviderGroundDetailsCubit>(() =>
        _i692.ServiceProviderGroundDetailsCubit(
            repository: gh<_i339.ServiceProviderGroundDetailsRepository>()));
    gh.factory<_i987.ServiceProviderGroundsCubit>(() =>
        _i987.ServiceProviderGroundsCubit(
            repository: gh<_i834.ServiceProviderGroundsRepository>()));
    return this;
  }
}
