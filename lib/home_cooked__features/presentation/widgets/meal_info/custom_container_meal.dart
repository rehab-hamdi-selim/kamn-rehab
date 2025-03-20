import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_icon.dart';

class CustomContainerMeal extends StatelessWidget {
  final List<Meal> meals;

  const CustomContainerMeal({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    final List<String> labels = ['🥩 High-Protein', '🥑 Keto', '🌾 Vegan'];

    return Column(
      children: meals.map(
        (meal) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(width: 0.20.w, color: AppPallete.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('🏷️ Labels:',
                        style: TextStyles.fontCircularSpotify10BlackRegular),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: Row(
                        children: labels
                            .map((label) => Container(
                                  margin: EdgeInsets.only(right: 7.w),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                    vertical: 6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppPallete.ofWhiteColor4,
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                      color: AppPallete.lightGreyColor,
                                      width: 0.5.w,
                                    ),
                                  ),
                                  child: Text(label,
                                      style: TextStyles
                                          .fontCircularSpotify8BlackRegular),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    const CustomIcon(icon: IconLinks.pen),
                    SizedBox(width: 4.w),
                    const CustomIcon(icon: IconLinks.trashBin),
                  ],
                ),
                SizedBox(height: 8.h),
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: AppPallete.lightGreyColor,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 51.17.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(meal.imageUrls.isNotEmpty
                              ? meal.imageUrls[0]
                              : 'assets/images/placeholder.png'),
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(meal.name,
                              style:
                                  TextStyles.fontCircularSpotify14BlackRegular),
                          SizedBox(height: 8.h),
                          Row(
                            children: meal.specialtyTags
                                .map((tag) => Padding(
                                      padding: EdgeInsets.only(right: 8.w),
                                      child: Text('#$tag',
                                          style: TextStyles
                                              .fontCircularSpotify12veryLightGray2Medium),
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Container(
                                width: 70.w,
                                height: 24.h,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: ShapeDecoration(
                                  color: AppPallete.offWhite,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.20.w,
                                      color: AppPallete.darkGreyColor,
                                    ),
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(IconLinks.group,
                                        width: 10.w, height: 10.h),
                                    SizedBox(width: 4.w),
                                    Text(
                                      '30 min',
                                      style: TextStyles
                                          .fontCircularSpotify10AccentBlackColorMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  color: AppPallete.ofWhiteColor4,
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      width: 0.20.w, color: AppPallete.grey),
                                ),
                                child: Text('${meal.calories} 🔥Kcal',
                                    style: TextStyles.circularSpotify10Green),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text('£GP ',
                                      style: TextStyles
                                          .circularSpotify12BoldGreen),
                                  Text(meal.price.toStringAsFixed(2),
                                      style: TextStyles
                                          .circularSpotify14RegularDarkBlack),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
