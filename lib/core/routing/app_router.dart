import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/features/admin/presentation/cubits/first_page_cupit/analytics_cubit.dart';
import 'package:kamn/features/admin/presentation/screens/first_analytics_page/first_analytics_page.dart';
import 'package:kamn/features/admin/data/data_source/second_page_data_source.dart';
import 'package:kamn/features/admin/data/repository/second_page_repository.dart';
import 'package:kamn/features/admin/presentation/cubits/second_page_cubit/second_page_cubit.dart';
import 'package:kamn/features/admin/presentation/screens/second_page/second_page.dart';
import 'package:kamn/features/payment/presentation/screens/debit_credit_card_screen.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/screens/grounds_screen.dart';
import 'package:kamn/features/sports/presentation/screens/my_profile_screen.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/add_service.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/edit_service_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_provider_ground_details_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_provider_grounds_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_selection_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/track_ground_reservation_detail_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/track_ground_reservations_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.analyticsfirstpage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AnalyticsCubit>(
              create: (context) => getIt<AnalyticsCubit>(),
              child: FirstAnalyticsPage()),
        );
      case Routes.debitCreditCardPage:
        return MaterialPageRoute(builder: (context) => DebitCreditCardScreen());
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
            builder: (context) => BlocProvider<AddServiceProviderCubit>(
                  create: (context) => getIt<AddServiceProviderCubit>(),
                  child: const AddServiceScreen(
                    type: '',
                  ),
                ));
      // case Routes.groundDetailsScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const GroundDetailsScreen());
      case Routes.groundsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SportsGroundsCubit>(),
                  child: const GroundsScreen(),
                ));
      case Routes.serviceProviderGroundsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<ServiceProviderGroundsCubit>(
                  create: (context) => getIt<ServiceProviderGroundsCubit>()
                    ..getPlaygroundsRequests(),
                  child: const ServiceProviderGroundsScreen(),
                ));
      case Routes.successServiceProviderScreen:
        return MaterialPageRoute(
            builder: (context) => const ServiceProviderGroundsScreen());
      case Routes.serviceSelection:
        return MaterialPageRoute(
            builder: (context) => const ServiceSelectionScreen());
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
      case Routes.secondPage:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<SecondPageCubit>(
                create: (context) => getIt<SecondPageCubit>()..getChartData(),
                child: const SecondPage()));
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
