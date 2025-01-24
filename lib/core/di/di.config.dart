// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/admin/data/data_source/analytics_data_source.dart'
    as _i418;
import '../../features/admin/data/data_source/second_page_data_source.dart'
    as _i746;
import '../../features/admin/data/repository/analytics_repository.dart'
    as _i724;
import '../../features/admin/data/repository/second_page_repository.dart'
    as _i173;
import '../../features/admin/domain/use_case/second_page_use_case.dart'
    as _i396;
import '../../features/admin/presentation/cubits/first_page_cupit/analytics_cubit.dart'
    as _i209;
import '../../features/admin/presentation/cubits/second_page_cubit/second_page_cubit.dart'
    as _i608;
import '../../features/authentication/data/data_source/auth_remote_data_source.dart'
    as _i21;
import '../../features/authentication/data/repositories/auth_repository.dart'
    as _i935;
import '../../features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart'
    as _i670;
import '../../features/authentication/presentation/cubits/sign_in_cubit/sign_in_view_model.dart'
    as _i361;
import '../../features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart'
    as _i531;
import '../../features/authentication/presentation/cubits/sign_up_cubit/sign_up_view_model.dart'
    as _i22;
import '../../features/payment/presentation/cubits/payment_options_cubit/payment_options_view_model.dart'
    as _i805;
import '../../features/payment/presentation/cubits/procced_payment_cubit/procced_payment_cubit.dart'
    as _i692;
import '../../features/sports/data/data_source/sports_remote_data_source.dart'
    as _i575;
import '../../features/sports/data/repositories/sports_repository.dart'
    as _i379;
import '../../features/sports/domain/usecase/get_sports_from_firebase_usecase.dart'
    as _i213;
import '../../features/sports/domain/usecase/sports_ground_usecase.dart'
    as _i561;
import '../../features/sports/presentation/cubits/ground_details_cubit/ground_details_cubit.dart'
    as _i792;
import '../../features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart'
    as _i137;
import '../../features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_view_model.dart'
    as _i282;
import '../../features/sports/presentation/cubits/reservation_details_cubit/reservation_details_cubit.dart'
    as _i546;
import '../../features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart'
    as _i1033;
import '../../features/sports/presentation/cubits/sports_grounds/sports_ground_view_model.dart'
    as _i16;
import '../../features/sports/presentation/cubits/view_reservation/view_reservation_cubit.dart'
    as _i410;
import '../../features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart'
    as _i1047;
import '../../features/sports_service_providers/data/repository/service_providers_repository.dart'
    as _i542;
import '../../features/sports_service_providers/domain/usecase/filter_search_data_use_case.dart'
    as _i774;
import '../../features/sports_service_providers/domain/usecase/get_services_from_firebase_usecase.dart'
    as _i786;
import '../../features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart'
    as _i252;
import '../../features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_view_model.dart'
    as _i1058;
import '../../features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart'
    as _i731;
import '../../features/sports_service_providers/presentation/cubit/current_reseravaion_order/current_orders_cubit.dart'
    as _i861;
import '../../features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart'
    as _i773;
import '../../features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_cubit.dart'
    as _i718;
import '../../features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart'
    as _i692;
import '../../features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart'
    as _i987;
import '../../features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_view_model.dart'
    as _i1002;
import '../../features/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_cubit.dart'
    as _i38;
import '../../features/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_cubit.dart'
    as _i278;
import '../../features/user/data/data_source/user_remote_data_source.dart'
    as _i677;
import '../../features/user/data/repository/user_repository.dart' as _i812;
import '../../features/user/presentation/cubit/edit_profile/edit_profile_cubit.dart'
    as _i98;
import '../../features/user/presentation/cubit/notification/notifications_cubit.dart'
    as _i566;
import '../common/class/firebase_storage_services.dart' as _i304;
import '../common/class/firestore_services.dart' as _i158;
import '../common/cubit/app_user/app_user_cubit.dart' as _i94;
import '../common/cubit/firebase_remote_config/firebase_remote_config_cubit.dart'
    as _i654;

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
    gh.factory<_i361.SignInViewModel>(() => _i361.SignInViewModel());
    gh.factory<_i22.SignUpViewModel>(() => _i22.SignUpViewModel());
    gh.factory<_i805.PaymentOptionsViewModel>(
        () => _i805.PaymentOptionsViewModel());
    gh.factory<_i561.SportsGroundUsecase>(() => _i561.SportsGroundUsecase());
    gh.factory<_i792.GroundDetailsCubit>(() => _i792.GroundDetailsCubit());
    gh.factory<_i282.PickTimeForReservationViewModel>(
        () => _i282.PickTimeForReservationViewModel());
    gh.factory<_i546.ReservationDetailsCubit>(
        () => _i546.ReservationDetailsCubit());
    gh.factory<_i16.SportsGroundViewModel>(() => _i16.SportsGroundViewModel());
    gh.factory<_i1058.AddServiceProviderViewModel>(
        () => _i1058.AddServiceProviderViewModel());
    gh.factory<_i1002.ServiceProviderGroundsViewModel>(
        () => _i1002.ServiceProviderGroundsViewModel());
    gh.lazySingleton<_i304.FirebaseStorageServices>(
        () => _i304.FirebaseStorageServices());
    gh.lazySingleton<_i158.FirestoreService>(() => _i158.FirestoreService());
    gh.factory<_i746.SecondPageDataSource>(() => _i746.SecondPageDataSourceImpl(
        firestore: gh<_i158.FirestoreService>()));
    gh.factory<_i418.AnalyticsDataSource>(() => _i418.AnalyticsDataSourceImpl(
          firestoreServices: gh<_i158.FirestoreService>(),
          storageServies: gh<_i304.FirebaseStorageServices>(),
        ));
    gh.factory<_i654.FirebaseRemoteConfigCubit>(() =>
        _i654.FirebaseRemoteConfigCubit(
            remoteConfig: gh<_i627.FirebaseRemoteConfig>()));
    gh.factory<_i1047.ServiceProvidersRemoteDataSource>(
        () => _i1047.ServiceProvidersRemoteDataSourceImpl(
              firestoreServices: gh<_i158.FirestoreService>(),
              storageServies: gh<_i304.FirebaseStorageServices>(),
            ));
    gh.factory<_i21.AuthRemoteDataSource>(() =>
        _i21.AuthRemoteDataSourceImpl(firestore: gh<_i158.FirestoreService>()));
    gh.factory<_i173.SecondPageRepository>(() => _i173.SecondPageRepositoryImpl(
        secondPageDataSource: gh<_i746.SecondPageDataSource>()));
    gh.factory<_i542.ServiceProvidersRepository>(() =>
        _i542.ServiceProvidersRepositoryImpl(
            dataSource: gh<_i1047.ServiceProvidersRemoteDataSource>()));
    gh.factory<_i396.SecondPageUseCase>(() => _i396.SecondPageUseCaseImpl(
        repository: gh<_i173.SecondPageRepository>()));
    gh.factory<_i935.AuthRepository>(() => _i935.AuthRepositoryImpl(
        authDataSource: gh<_i21.AuthRemoteDataSource>()));
    gh.factory<_i677.UserRemoteDataSource>(() => _i677.UserRemoteDataSourceImpl(
        firestoreService: gh<_i158.FirestoreService>()));
    gh.factory<_i724.AnalyticsRepository>(() => _i724.AnalyticsRepositoryImpl(
        dataSource: gh<_i418.AnalyticsDataSource>()));
    gh.factory<_i608.SecondPageCubit>(() => _i608.SecondPageCubit(
          repository: gh<_i173.SecondPageRepository>(),
          dataFilter: gh<_i396.SecondPageUseCase>(),
        ));
    gh.factory<_i209.AnalyticsCubit>(() =>
        _i209.AnalyticsCubit(repository: gh<_i724.AnalyticsRepository>()));
    gh.factory<_i575.SportsRemoteDataSource>(() =>
        _i575.SportsRemoteDataSourceImpl(
            firestoreService: gh<_i158.FirestoreService>()));
    gh.factory<_i774.FilterSearchDataUseCase>(() =>
        _i774.FilterSearchDataUseCase(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i786.GetServicesFromFirebaseUsecase>(() =>
        _i786.GetServicesFromFirebaseUsecase(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i731.AvailableDatesCubit>(() => _i731.AvailableDatesCubit(
        repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i861.CurrentOrdersCubit>(() => _i861.CurrentOrdersCubit(
        repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i773.EditServiceProviderCubit>(() =>
        _i773.EditServiceProviderCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i718.FinishedOrdersCubit>(() => _i718.FinishedOrdersCubit(
        repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i692.ServiceProviderGroundDetailsCubit>(() =>
        _i692.ServiceProviderGroundDetailsCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i278.TrackGroundReservationsCubit>(() =>
        _i278.TrackGroundReservationsCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i38.TrackGroundReservationsDetailsCubit>(() =>
        _i38.TrackGroundReservationsDetailsCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i252.AddServiceProviderCubit>(
        () => _i252.AddServiceProviderCubit(
              repository: gh<_i542.ServiceProvidersRepository>(),
              viewModel: gh<_i1058.AddServiceProviderViewModel>(),
            ));
    gh.factory<_i670.SignInCubit>(() => _i670.SignInCubit(
          authRepository: gh<_i935.AuthRepository>(),
          signInViewModel: gh<_i361.SignInViewModel>(),
        ));
    gh.factory<_i812.UserRepository>(() => _i812.UserRepositoryImpl(
        userRemoteDataSource: gh<_i677.UserRemoteDataSource>()));
    gh.factory<_i94.AppUserCubit>(
        () => _i94.AppUserCubit(authRepository: gh<_i935.AuthRepository>()));
    gh.factory<_i98.EditProfileCubit>(
        () => _i98.EditProfileCubit(repository: gh<_i812.UserRepository>()));
    gh.factory<_i531.SignUpCubit>(() => _i531.SignUpCubit(
          authRepository: gh<_i935.AuthRepository>(),
          signUpViewModel: gh<_i22.SignUpViewModel>(),
        ));
    gh.factory<_i379.SportsRepository>(() => _i379.SportsRepositoryImpl(
        remoteDataSource: gh<_i575.SportsRemoteDataSource>()));
    gh.factory<_i213.GetPlaygroundsAndFlittered>(() =>
        _i213.GetPlaygroundsAndFlittered(
            repository: gh<_i379.SportsRepository>()));
    gh.factory<_i987.ServiceProviderGroundsCubit>(
        () => _i987.ServiceProviderGroundsCubit(
              getPlaygroundUsecase: gh<_i786.GetServicesFromFirebaseUsecase>(),
              viewModel: gh<_i1002.ServiceProviderGroundsViewModel>(),
              searchDataUseCase: gh<_i774.FilterSearchDataUseCase>(),
            ));
    gh.factory<_i692.ProccedPaymentCubit>(() => _i692.ProccedPaymentCubit(
        sportsRepository: gh<_i379.SportsRepository>()));
    gh.factory<_i410.ViewReservationCubit>(() => _i410.ViewReservationCubit(
        sportsRepository: gh<_i379.SportsRepository>()));
    gh.factory<_i566.NotificationsCubit>(() =>
        _i566.NotificationsCubit(userRepository: gh<_i812.UserRepository>()));
    gh.factory<_i137.PickTimeForReservationCubit>(
        () => _i137.PickTimeForReservationCubit(
              repository: gh<_i379.SportsRepository>(),
              viewModel: gh<_i282.PickTimeForReservationViewModel>(),
            ));
    gh.lazySingleton<_i1033.SportsGroundsCubit>(() => _i1033.SportsGroundsCubit(
          sportsRepository: gh<_i379.SportsRepository>(),
          sportsGroundUsecase: gh<_i561.SportsGroundUsecase>(),
          getPlaygrouundsUseCase: gh<_i213.GetPlaygroundsAndFlittered>(),
          sportsGroundViewModel: gh<_i16.SportsGroundViewModel>(),
        ));
    return this;
  }
}
