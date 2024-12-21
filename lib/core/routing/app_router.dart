import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/class/custom_splash_screen.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:kamn/features/authentication/presentation/screens/user_type_selection_screen.dart';
import 'package:kamn/features/payment/presentation/cubits/procced_payment_cubit/procced_payment_cubit.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart';
import 'package:kamn/features/admin/presentation/cubits/first_page_cupit/analytics_cubit.dart';
import 'package:kamn/features/admin/presentation/screens/first_analytics_page/first_analytics_page.dart';
import 'package:kamn/features/admin/presentation/cubits/second_page_cubit/second_page_cubit.dart';
import 'package:kamn/features/admin/presentation/screens/second_page/second_page.dart';
import 'package:kamn/features/payment/presentation/screens/debit_credit_card_screen.dart';
import 'package:kamn/features/payment/presentation/cubits/payment_options_cubit/payment_options_cubit.dart';
import 'package:kamn/features/payment/presentation/screens/payment_options_screen.dart';
import 'package:kamn/features/payment/presentation/screens/proceed_payment_screen.dart';
import 'package:kamn/features/sports/presentation/cubits/reservation_details_cubit/reservation_details_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/screens/ground_details_screen.dart';
import 'package:kamn/features/sports/presentation/screens/grounds_screen.dart';
import 'package:kamn/features/sports/presentation/screens/my_profile_screen.dart';
import 'package:kamn/features/sports/presentation/screens/pick_time_for_reservation_screen.dart';
import 'package:kamn/features/sports/presentation/screens/reservation_details_screen.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/add_service.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/choose_service_category_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/edit_service_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_provider_available_dates.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_provider_ground_details_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_provider_grounds_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_selection_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/track_ground_reservation_detail_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/track_ground_reservations_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/success_service_provider_screen.dart';
import 'package:kamn/test_login.dart';

import '../../features/authentication/presentation/screens/on_boarding_screen.dart';
import '../../features/authentication/presentation/screens/sign_in_screen.dart';
import '../../features/authentication/presentation/screens/sign_up_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.analyticsfirstpage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AnalyticsCubit>(
              create: (context) => getIt<AnalyticsCubit>(),
              child: FirstAnalyticsPage()),
        );
      case Routes.userTypeSelectionScreen:
        return MaterialPageRoute(
          builder: (context) => const UserTypeSelectionScreen(),
        );
      case Routes.groundDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => GroundDetailsScreen(
            playgroundModel: settings.arguments as PlaygroundModel,
          ),
        );
      case Routes.debitCreditCardPage:
        return MaterialPageRoute(
            builder: (context) => DebitCreditCardScreen(
                reservationModel: settings.arguments as ReservationModel));
      case Routes.trackGroundResrvations:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<TrackGroundReservationsCubit>(
                  create: (context) => getIt<TrackGroundReservationsCubit>()
                    ..getPlaygroundsByOwnerId('testOwner49'),
                  child: const TrackGroundReservationsScreen(),
                ));
      case Routes.trackGroundResrvationsDetail:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider<TrackGroundReservationsDetailsCubit>(
                  create: (context) =>
                      getIt<TrackGroundReservationsDetailsCubit>()
                        ..getPlaygroundsDetailsById('zuQkYty1ma0ZML7gMGgz'),
                  child: TrackGroundReservationDetail(
                    playgroundModel: settings.arguments as PlaygroundModel,
                  ),
                ));
      case Routes.myProfileScreen:
        return MaterialPageRoute(builder: (context) => const MyProfileScreen());
      case Routes.addServiceScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: getIt<AddServiceProviderCubit>(),
                  child: AddServiceScreen(
                    type: settings.arguments as String,
                  ),
                ));
      case Routes.groundsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SportsGroundsCubit>()
                    ..getPlaygrounds()
                    ..getUserLocation(),
                  child: const GroundsScreen(),
                ));
      case Routes.chooseServiceCategoryScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<ServiceProviderGroundsCubit>(
                  create: (context) => getIt<ServiceProviderGroundsCubit>()
                    ..getPlaygroundsRequests(),
                  child: const ChooseServiceCategoryScreen(),
                ));
      case Routes.serviceProviderGroundsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<ServiceProviderGroundsCubit>(),
                  child: ServiceProviderGroundsScreen(
                    type: settings.arguments as String,
                  ),
                ));
      case Routes.successServiceProviderScreen:
        return MaterialPageRoute(
            builder: (context) => const SuccessServiceProviderScreen());
      case Routes.serviceSelection:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AddServiceProviderCubit>(
                  create: (context) => getIt<AddServiceProviderCubit>(),
                  child: const ServiceSelectionScreen(),
                ));
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: SignUpScreen(
                    userType: settings.arguments as String,
                  ),
                ));
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

      case Routes.editServiceScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<EditServiceProviderCubit>(
                  create: (context) => getIt<EditServiceProviderCubit>(),
                  child: EditServiceScreen(
                    playground: settings.arguments as PlaygroundRequestModel,
                  ),
                ));
      case Routes.serviceProviderGroundDetailsScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider<ServiceProviderGroundDetailsCubit>(
                  create: (context) =>
                      getIt<ServiceProviderGroundDetailsCubit>(),
                  child: ServiceProviderGroundDetailsScreen(
                    playgroundModel:
                        settings.arguments as PlaygroundRequestModel,
                  ),
                ));
      case Routes.serviceProviderAvailableDates:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<AvailableDatesCubit>(),
                  child: ServiceProviderAvailableDates(
                    playgroundId: settings.arguments as String,
                  ),
                ));
      case Routes.pickTimeReservationScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<PickTimeForReservationCubit>()
                    ..getSpecificReservationsByGroundId(
                        (settings.arguments as PlaygroundModel).playgroundId!,
                        DateTime.now()),
                  child: PickTimeForReservationScreen(
                    playground: settings.arguments as PlaygroundModel,
                  ),
                ));

      case Routes.secondPage:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<SecondPageCubit>(
                create: (context) => getIt<SecondPageCubit>()..getChartData(),
                child: const SecondPage()));
      case Routes.paymentOptionsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<PaymentOptionsCubit>(
                  create: (context) => PaymentOptionsCubit(),
                  child: PaymentOptionsScreen(
                      reservationModel: settings.arguments as ReservationModel),
                ));
      case Routes.proceedPaymentScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<ProccedPaymentCubit>(),
                  child: ProceedPaymentScreen(
                    reservationModel: settings.arguments as ReservationModel,
                  ),
                ));
      case Routes.logOut:
        return MaterialPageRoute(builder: (context) => const LogoutScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(
            builder: (context) => const CustomSplashScreen());
      case Routes.reservationScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<ReservationDetailsCubit>(),
                  child: ReservationDetailsScreen(
                    reservation: settings.arguments != null
                        ? settings.arguments as ReservationModel
                        : ReservationModel(),
                  ),
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text(
                      'No route defined for ${settings.name}',
                    ),
                  ),
                ));
    }
  }
}
