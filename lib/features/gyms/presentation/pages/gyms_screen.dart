import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

import 'package:kamn/features/gyms/presentation/widgets/custom_gym_appbar.dart';
import 'package:kamn/features/gyms/presentation/widgets/custom_gym_fit_list.dart';
import 'package:kamn/features/gyms/presentation/widgets/custom_gym_fit_list_item.dart';
import 'package:kamn/features/gyms/presentation/widgets/custom_gym_head_title.dart';

class GymsScreen extends StatelessWidget {
  const GymsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomGymAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            CustomGymHeadTitle(
              title: 'Find Your Fit',
              onTap: () {},
            ),
            verticalSpace(10.h),
            const CustomGymFitList(),
          ],
        ),
      ),
    );
  }
}
