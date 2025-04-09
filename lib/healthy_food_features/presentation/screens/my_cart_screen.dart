import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/custom_app_bar.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/custom_mycart_card.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CustomCartAppBar(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 180.h),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Dismissible(
                    key: Key("A"),
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        border: Border(
                          right: BorderSide(
                            color: const Color(0xffF8DB8A),
                            width: 5.sp,
                          ),
                        ),
                        color: const Color(0xffFFDB81),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: SvgPicture.asset("assets/icons/pen.svg"),
                    ),
                    secondaryBackground: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        border: Border(
                          right: BorderSide(
                            color: AppPallete.redColor,
                            width: 5.sp,
                          ),
                        ),
                        color: const Color(0xffF8C0C0),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: SvgPicture.asset("assets/icons/delete.svg"),
                    ),
                    onDismissed: (direction) {
                      // تنفيذ الحذف أو التعديل هنا
                    },
                    child: const CardMycart(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppPallete.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.sp),
            topRight: Radius.circular(28.sp),
          ),
          boxShadow: [
            BoxShadow(
              color: AppPallete.blackColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        width: double.infinity,
        height: 171.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyles.fontCircularSpotify14AccentBlackMedium,
                  ),
                  SizedBox(width: 188.w),
                  Text(
                    'Edit Address',
                    style: TextStyles.fontCircularSpotify12BlackMedium
                        .copyWith(color: const Color(0xffDAA000)),
                  ),
                  SvgPicture.asset('assets/icons/pen_address.svg')
                ],
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 335.w,
                height: 35.h,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Alexandria, Stanly, 200 Str Behind Elalbd',
                    hintStyle: TextStyles.fontCircularSpotify12BlackMedium
                        .copyWith(color: AppPallete.lightGreyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.sp),
                      borderSide: BorderSide(
                        color: AppPallete.lightGreyColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 158.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      border: Border.all(
                        color: AppPallete.lightGreyColor,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total :',
                            style: TextStyles.fontCircularSpotify12BlackRegular,
                          ),
                          Text(
                            '1500£GP',
                            style: TextStyles.fontCircularSpotify21BlackBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 167.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppPallete.blackColor,
                      borderRadius: BorderRadius.circular(50.sp),
                      border: Border.all(
                        color: AppPallete.lightGreyColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Place Order',
                        style: TextStyles.fontCircularSpotify14AccentBlackMedium
                            .copyWith(color: AppPallete.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
