import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/screens/ground_details_screen.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_ground_item.dart';

class CustomGroundList extends StatelessWidget {
  const CustomGroundList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
        builder: (context, state) {
      if (state.isLoading || state.isInitial) {
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(
              color: AppPallete.greenColor,
            ),
          ),
        );
      }
      if (state.playgrounds == null ||
          state.playgrounds!.isEmpty ||
          state.isFailure) {
        return Expanded(
          child: Center(
            child: Text(
              "Opps, No PlayGrounds Found",
              style: Style.font16DartBlackColorW400,
            ),
          ),
        );
      }
      return Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.groundDetailsScreen,
                    arguments: state.playgrounds![index]);
              },
              child: CustomGroundItem(playground: state.playgrounds![index]),
            );
          },
          separatorBuilder: (context, index) {
            return verticalSpace(10);
          },
          itemCount: state.playgrounds?.length ?? 0,
        ),
      );
    });
  }
}
