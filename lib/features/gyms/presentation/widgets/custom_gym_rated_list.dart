import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/gyms/presentation/widgets/custom_top_rated_item.dart';

class CustomGymRatedList extends StatelessWidget {
  const CustomGymRatedList({super.key});
  // TODO: Get Item Model
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const CustomTopRatedItem(
        gymDescription:
            'Gold\'s Gym is a world-class fitness center equipped with state-of-the-art facilities...',
        gymDuration: '6-month',
        gymLocation: 'Alexandria, San Stefano',
        gymName: 'Gold’s Gym',
        gymPrice: '10000',
        gymrate: '4.8',
      ),
      separatorBuilder: (context, index) => verticalSpace(10.h),
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
