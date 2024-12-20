import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/utils/navigation.dart';
import 'package:kamn/core/utils/custom_app_bar_service_provider.dart';
import '../../../../core/const/constants.dart';
import '../../../../core/const/image_links.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/style.dart';
import '../widgets/service_provider_grounds/custom_bottom_service_provider.dart';

class SuccessServiceProviderScreen extends StatelessWidget {
  const SuccessServiceProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBarServiceProvider.appBar(
        color: AppPallete.whiteColor,
        arrowFunction: () {},
        notificationIconFunction: () {},
        profileFunction: () {},
        badgesIconFunction: () {},
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Constants.serviceSuccessfullyAdded,
              style: TextStyles.font32BlackColormedium,
              textAlign: TextAlign.center,
            ),
            verticalSpace(16),
            Image.asset(ImageLinks.serviceSuccessfullyAdded),
            verticalSpace(38),
            SizedBox(
              height: 40.06.h,
              width: 159.w,
              child: CustomBottomServiceProvider(
                iconVisible: true,
                iconWidget: Row(
                  children: [
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 20.h,
                      color: AppPallete.whiteColor,
                    ),
                    horizontalSpace(7.1)
                  ],
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(Routes.chooseServiceCategoryScreen);
                },
                textBottom: 'Check',
                textStyle: TextStyles.font12WhiteColorW400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
