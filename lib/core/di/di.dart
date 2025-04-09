import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/healthy_food_features/data/data_sources/test_meals_data_source.dart';
import 'package:kamn/healthy_food_features/data/data_sources/user_cart_data_source.dart';
import 'package:kamn/healthy_food_features/data/repositories/test_meals_repository_impl.dart';
import 'package:kamn/healthy_food_features/data/repositories/user_cart_repository_impl.dart'
    as impl;
import 'package:kamn/healthy_food_features/domain/repositories/test_meals_repository.dart';
import 'package:kamn/healthy_food_features/domain/repositories/user_cart_repository.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/test_meals_cubit.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.init();

  // Register Firebase instances
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseRemoteConfig>(
      () => FirebaseRemoteConfig.instance);

  // Register Data Sources
  getIt.registerLazySingleton<UserCartDataSource>(
      () => UserCartDataSourceImpl(getIt<FirebaseFirestore>()));

  // Register Repositories
  getIt.registerLazySingleton<UserCartRepository>(() =>
      impl.UserCartRepositoryImpl(dataSource: getIt<UserCartDataSource>()));
}
