import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/counter.dart';

class CardMycart extends StatelessWidget {
  const CardMycart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.w),
      width: 343.w,
      height: 134.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 82.w,
                height: 68.h,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/food.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16.sp)),
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 165.w,
                    child: Text(
                      'Quinoa Salad with Grilled Chicken',
                      style: TextStyles.fontCircularSpotify14AccentBlackMedium,
                      softWrap: true,
                    ),
                  ),
                  Text('Kitchen: Sarah’s House',
                      style: TextStyles.fontCircularSpotify10StealGrayMedium),
                ],
              ),
              SizedBox(
                width: 47.w,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: SvgPicture.asset('assets/icons/delete.svg',
                    width: 25.w, height: 25.h),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 13.h),
                    child: Row(
                      children: [
                        Text('£GP ',
                            style: TextStyles.fontCircularSpotify21BlackRegular
                                .copyWith(
                              color: AppPallete.darkGreenColor,
                            )),
                        Text(
                          '25.00',
                          style: TextStyles.fontCircularSpotify21BlackRegular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 120.w),
              Counter()
            ],
          ),
        ],
      ),
    );
  }
}
