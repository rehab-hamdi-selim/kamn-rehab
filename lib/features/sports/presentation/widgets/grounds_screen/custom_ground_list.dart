import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/screens/ground_details_screen.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_ground_item.dart';
import 'package:animations/animations.dart';

import '../../../../../core/common/widget/loader.dart';
import '../../../../../core/di/di.dart';

class CustomGroundList extends StatelessWidget {
  const CustomGroundList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
      builder: (context, state) {
        if (state.isLoading || state.isInitial ) {
          return const Loader();
        }
        if (state.playgrounds == null ||
            state.playgrounds!.isEmpty ||
            state.isFailure) {
          return const Expanded(
            child: Center(
              child: Text(
                "Oops, No Playgrounds Found",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          );
        }
        return Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return OpenContainer(
                closedBuilder: (context, action) {
                  return InkWell(
                    onTap: action,
                    child: BlocProvider(
                      create: (context) => context.read<SportsGroundsCubit>(),
                      child: index % 2 == 0
                          ? ZoomIn(
                              duration: const Duration(seconds: 2),
                              child: FadeInLeft(
                                duration:
                                    Duration(milliseconds: 1300 * (index + 1)),
                                child: CustomGroundItem(
                                  playground: state.playgrounds![index],
                                ),
                              ))
                          : ZoomIn(
                              duration: const Duration(seconds: 2),
                              child: FadeInRight(
                                duration:
                                    Duration(milliseconds: 1300 * (index + 1)),
                                child: CustomGroundItem(
                                  playground: state.playgrounds![index],
                                ),
                              )),
                    ),
                  );
                },
                openBuilder: (context, action) {
                  return BlocProvider(
                    create: (context) =>
                        getIt<SportsGroundsCubit>()..initScrollListner(),
                    child: GroundDetailsScreen(
                      playgroundModel: state.playgrounds![index],
                    ),
                  );
                },
                transitionDuration: const Duration(milliseconds: 2000),
                closedElevation: 0,
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemCount: state.playgrounds?.length ?? 0,
          ),
        );
      },
    );
  }
}
