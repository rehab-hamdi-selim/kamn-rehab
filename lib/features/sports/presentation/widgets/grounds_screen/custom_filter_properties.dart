import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_view_model.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_item.dart';

class CustomFilterProperties extends StatelessWidget {
  const CustomFilterProperties({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: SportsGroundViewModel.filterItem.isEmpty ? 0 : 30.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (SportsGroundViewModel.filterItem[index] != null) {
                      return CustomFilterItem(
                          icon: SportsGroundViewModel.filterItem[index]!.icon,
                          text: SportsGroundViewModel.filterItem[index]!.title,
                          onPressed: () {
                            SportsGroundsCubit.get(context)
                                .deleteFilterItem(index: index);
                          });
                    }
                    return Container();
                  },
                  separatorBuilder: (context, index) => horizontalSpace(5),
                  itemCount: SportsGroundViewModel.filterItem.length),
            ),
            SportsGroundViewModel.filterItem.isEmpty
                ? verticalSpace(0.h)
                : verticalSpace(21.h)
          ],
        );
      },
    );
  }
}
