import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_item.dart';

class CustomFilterProperties extends StatelessWidget {
  const CustomFilterProperties({super.key});
  @override
  Widget build(BuildContext context) {
    final sportsGroundViewModel =
        SportsGroundsCubit.get(context).sportsGroundViewModel;
    return BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: sportsGroundViewModel.filterItem.isEmpty ? 0 : 30.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (sportsGroundViewModel.filterItem[index] != null) {
                      return CustomFilterItem(
                          icon: sportsGroundViewModel.filterItem[index]!.icon,
                          text: sportsGroundViewModel.filterItem[index]!.title,
                          onPressed: () {
                            SportsGroundsCubit.get(context)
                                .deleteFilterItem(index: index);
                          });
                    }
                    return Container();
                  },
                  separatorBuilder: (context, index) => horizontalSpace(5),
                  itemCount: sportsGroundViewModel.filterItem.length),
            ),
            sportsGroundViewModel.filterItem.isEmpty
                ? verticalSpace(0.h)
                : verticalSpace(21.h)
          ],
        );
      },
    );
  }
}
