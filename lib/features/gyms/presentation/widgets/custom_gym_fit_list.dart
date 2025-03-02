import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/gyms/presentation/widgets/custom_gym_fit_list_item.dart';

class CustomGymFitList extends StatelessWidget {
  const CustomGymFitList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: ListView.separated(
        itemBuilder: (context, index) => CustomGymFitListItem(
          image: ImageLinks.fitImage,
          description: '10 Classes This Week',
          name: 'Yoga & Wellness',
          onTap: () {},
        ),
        separatorBuilder: (context, index) => horizontalSpace(10.w),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
