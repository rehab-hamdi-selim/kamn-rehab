import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/grounds_screen/custom_filter_item.dart';

class CustomReservationFilterItem extends StatelessWidget {
  const CustomReservationFilterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 23.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomFilterItem(
                    icon: Icons.location_on_rounded,
                    text: 'ALX',
                    onPressed: () {});
              },
              separatorBuilder: (context, index) => horizontalSpace(5),
              itemCount: 5),
        ),
        verticalSpace(21.h),
      ],
    );
  }
}
