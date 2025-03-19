import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_cubit.dart';

class CustomFinishedOrdersTabs extends StatelessWidget {
  const CustomFinishedOrdersTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          return Colors.transparent;
        },
      ),
      indicatorColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      onTap: (index) {
        context.read<FinishedOrdersCubit>().fetchOrdersForCategory(
            Sport.values[index].displayName,
            context.read<AppUserCubit>().state.user!.uid);
      },
      tabs: [
        for (var category in Sport.values)
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: category.sportColor.withOpacity(0.25),
              ),
              child: Text(
                category.displayName,
                style: TextStyles.fontCircularSpotify10BlackMedium
                    .copyWith(color: category.sportColor),
              ),
            ),
          ),
      ],
      // Responsive tab text size
    );
  }
}
