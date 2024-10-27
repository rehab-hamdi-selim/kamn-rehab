// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart'
    as _i1047;
import '../../features/sports_service_providers/data/repository/service_providers_repository.dart'
    as _i542;
import '../../features/sports_service_providers/presentation/cubit/service_provider/service_provider_cubit.dart'
    as _i160;

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
    gh.factory<_i1047.ServiceProvidersRemoteDataSource>(
        () => _i1047.ServiceProvidersRemoteDataSourceImpl(
              firestore: gh<_i974.FirebaseFirestore>(),
              storage: gh<_i457.FirebaseStorage>(),
            ));
    gh.factory<_i542.ServiceProvidersRepository>(() =>
        _i542.ServiceProvidersRepositoryImpl(
            dataSource: gh<_i1047.ServiceProvidersRemoteDataSource>()));
    gh.factory<_i160.ServiceProviderCubit>(() => _i160.ServiceProviderCubit(
        repository: gh<_i542.ServiceProvidersRepository>()));
    return this;
  }
}
