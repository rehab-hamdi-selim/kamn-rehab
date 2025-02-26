import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';

class CustomDistanceFilter extends StatelessWidget {
  const CustomDistanceFilter({super.key});
  @override
  Widget build(BuildContext context) {
    final sportsGroundCubit = context.read<SportsGroundsCubit>();

    return BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
      builder: (context, state) {
        final distance = state.distance ?? 0.0;
        final distanceInKm = (distance * 100).round();

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Distance',
                    style: TextStyles.fontRoboto20AccentBlackMedium,
                  ),
                  Text(
                    '$distanceInKm km',
                    style: TextStyles.fontRoboto13SemiBoldGreen,
                  )
                ],
              ),
            ),
            Slider(
              value: distance,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                sportsGroundCubit.changeDistance(value);
              },
              thumbColor: AppPallete.greenColor,
              activeColor: AppPallete.greenColor,
              inactiveColor: AppPallete.ligtGreyColor,
            ),
          ],
        );
      },
    );
  }
}
