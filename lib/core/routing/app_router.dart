import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/features/sports/presentation/screens/ground_details_screen.dart';
import 'package:kamn/features/sports/presentation/screens/grounds_screen.dart';
import 'package:kamn/features/sports/presentation/screens/my_profile_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/add_service.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_provider_grounds_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.myProfileScreen:
        return MaterialPageRoute(builder: (context) => const MyProfileScreen());
      case Routes.addServiceScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<AddServiceProviderCubit>(),
                  child: const AddServiceScreen(),
                ));
      case Routes.groundDetailsScreen:
        return MaterialPageRoute(
            builder: (context) => const GroundDetailsScreen());
      case Routes.groundsScreen:
        return MaterialPageRoute(builder: (context) => const GroundsScreen());
      case Routes.serviceProviderGroundsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<ServiceProviderGroundsCubit>(),
                  child: const ServiceProviderGroundsScreen(),
                ));
      case Routes.successServiceProviderScreen:
        return MaterialPageRoute(
            builder: (context) => const ServiceProviderGroundsScreen());
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
