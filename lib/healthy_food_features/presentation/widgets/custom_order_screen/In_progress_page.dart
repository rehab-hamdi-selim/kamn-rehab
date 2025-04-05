import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class InprogressPage extends StatelessWidget {
  const InprogressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CardInProgress();
  }
}

class CardInProgress extends StatelessWidget {
  const CardInProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 343.w,
      height: 145.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Aug 14 . 8:11 AM',
                style: TextStyles.fontCircularSpotify10BlackMedium,
              ),
              Container(
                  width: 62.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: AppPallete.warmYellow,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Center(
                    child: Text(
                      'in progress',
                      style:
                          TextStyles.fontCircularSpotify10BlackMedium.copyWith(
                        color: AppPallete.goldenbrown,
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                width: 61.w,
                height: 51.h,
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
                  Text(
                    'Quinoa Salad with Grilled Chicken',
                    style: TextStyles.fontCircularSpotify12BlackMedium,
                  ),
                  Text('Kitchen: Sarah’s House',
                      style: TextStyles.fontCircularSpotify10StealGrayMedium),
                  Text('Order-ID: 987654321',
                      style: TextStyles.fontCircularSpotify10StealGrayMedium),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text('£GP ',
                  style: TextStyles.fontCircularSpotify12BlackMedium.copyWith(
                    color: AppPallete.darkGreenColor,
                  )),
              Text(
                '25.00',
                style: TextStyles.fontCircularSpotify12BlackMedium,
              ),
            ],
          ),
          Text(
            'View details',
            style: TextStyles.fontCircularSpotify10StealGrayMedium,
          )
        ],
      ),
    );
    ;
  }
}
