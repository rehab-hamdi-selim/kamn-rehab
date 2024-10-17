import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/commen/widgets/sized_box_style.dart';
import 'package:kamn/core/constant/constant_string.dart';
import 'package:kamn/core/theme_data/app_palette.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/core/utils/app_images.dart';
import 'package:kamn/features/grounds/presentation/widgets/custom_filter_item.dart';
import 'package:kamn/features/grounds/presentation/widgets/custom_ground_item.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom.dart';
import '../widgets/custom_text_form_field.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppPalette.backgroundColor,
      appBar: CustomAppBar.appBar(
        arrowFunction: () {},
        notificationIconFunction: () {},
        profileFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ConstantString.groundsScreenTitle,
              style: Style.font30DarkGreenColorBold,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  controller: controller,
                )),
                SizedBoxStyle.horizontal(5.w),
                CustomBottom(
                  iconVisible: true,
                  iconWidget: Image.asset(
                    AppImages.filterImage,
                    width: 15.w,
                    height: 15.h,
                  ),
                  onPressed: () {},
                  textBottom: 'Filter',
                  textStyle: Style.font12WhiteColorW400,
                ),
              ],
            ),
            SizedBoxStyle.vertical(
              10.h,
            ),
            SizedBox(
              height: 30.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomFilterItem(
                        icon: Icons.location_on_outlined,
                        text: "Alexandria, Hadra",
                        onPressed: () {});
                  },
                  separatorBuilder: (context, index) {
                    return SizedBoxStyle.horizontal(5.w);
                  },
                  itemCount: 5),
            ),
            SizedBoxStyle.vertical(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ConstantString.reservation,
                  style: Style.font15BlackColorBold,
                ),
                Text(
                  ConstantString.showAll,
                  style: Style.font10GrayColorW400,
                ),
              ],
            ),
            SizedBoxStyle.vertical(10.h),
            Container(
              height: 30.h,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              decoration: BoxDecoration(
                color: AppPalette.lightGreenColor,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: AppPalette.greenColor,
                  width: 1.w,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ConstantString.nextMatch,
                    style: Style.font15DarkGreenColorBold,
                  ),
                  Text(
                    "00 : 52 : 36",
                    style: Style.font15DarkGreenColorBold,
                  ),
                ],
              ),
            ),
            SizedBoxStyle.vertical(20.h),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index){
                    return CustomGroundItem(
                        imageUrl: "",
                        favoriteOnTap: (){},
                      placeText: "Hadra Stadium East .1",
                      km: "2.7",
                      owner: "mahmoud sayed",
                      location: "Alexandria, Hadra",
                      available: "Available",
                      rates: "4.5",
                      price: "250",
                    );
                  },
                  separatorBuilder: (context,index){
                    return SizedBoxStyle.vertical(10.h);
                  },
                  itemCount: 5)
            )
          ],
        ),
      ),
    );
  }
}
