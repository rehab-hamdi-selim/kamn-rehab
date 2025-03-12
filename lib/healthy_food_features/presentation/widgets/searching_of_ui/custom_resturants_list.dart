import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/restaurant_model.dart';

class CustomResturantsList extends StatelessWidget {
  const CustomResturantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: const Offset(0, 2), // Bottom shadow
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: const Offset(-2, 0), // Left shadow
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: const Offset(2, 0), // Right shadow
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: const Offset(0, -1), // Top shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: SizedBox(
                  height: 116.h,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 103.w,
                        height: 116.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(restaurants[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 116.h,
                          decoration: BoxDecoration(
                            color: AppPallete.whiteColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 13.w, right: 9.w, top: 8.h, bottom: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        restaurants[index].name,
                                        style: TextStyles
                                            .fontCircularSpotify12BlackMedium,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/dish_photo.svg",
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "${restaurants[index].deliveryTime} ${Constants.minute}",
                                          style: TextStyles
                                              .fontCircularSpotify8AccentBlackRegular,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(IconLinks.location),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "Location",
                                      style: TextStyles
                                          .fontCircularSpotify10Gray2Regular,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  restaurants[index].description,
                                  style: TextStyles
                                      .fontCircularSpotify8StealGrayRegular,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 3.h),
                                SizedBox(
                                  height: 25.h,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children:
                                        restaurants[index].tags.map((tag) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 4.h),
                                          decoration: BoxDecoration(
                                            color: AppPallete.lgWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(29.23.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "🥗$tag",
                                              style: TextStyles
                                                  .fontCircularSpotify8AccentBlackRegular,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.w, vertical: 5.h),
                                      decoration: BoxDecoration(
                                        color: AppPallete.lgWhiteColor,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Text(
                                        "${restaurants[index].minPrice}-${restaurants[index].maxPrice} £GP per week",
                                        style: TextStyles
                                            .fontCircularSpotify8StealGrayBold,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.86.w,
                                            vertical: 4.57.h),
                                        decoration: BoxDecoration(
                                          color: AppPallete.greenColor,
                                          borderRadius:
                                              BorderRadius.circular(57.17.r),
                                        ),
                                        child: Text(
                                          Constants.bookNow,
                                          style: TextStyles
                                              .fontCircularSpotify8WhiteBold,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
