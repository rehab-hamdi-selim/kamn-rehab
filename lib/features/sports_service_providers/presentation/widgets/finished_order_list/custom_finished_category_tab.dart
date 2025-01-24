import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/current_reservation_order_screen.dart';

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
        context
            .read<FinishedOrdersCubit>()
            .fetchOrdersForCategory(SportsTabs.values[index].displayName);
      },
      tabs: [
        for (var category in SportsTabs.values)
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: category.sportColor.withOpacity(0.25),
              ),
              child: Text(
                category.displayName,
                style: TextStyles.fontCircularSpotify10Medium
                    .copyWith(color: category.sportColor),
              ),
            ),
          ),
      ],
      // Responsive tab text size
    );
  }
}
