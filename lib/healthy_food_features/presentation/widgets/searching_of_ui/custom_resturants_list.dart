import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/restaurant_model.dart';

class CustomResturantsList extends StatelessWidget {
  const CustomResturantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: 116.h,
                      child: Row(
                        children: [
                          Image.asset(
                            restaurants[index].imageUrl,
                            width: 103.w,
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      restaurants[index].name,
                                      style: TextStyles
                                          .fontCircularSpotify12BlackMedium,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/dish_photo.svg",
                                            width: 10.w,
                                            height: 10.h),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "${restaurants[index].deliveryTime} min",
                                          style: TextStyles
                                              .fontCircularSpotify8AccentBlackRegular,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/location_tag.svg"),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "Location",
                                      style: TextStyles
                                          .fontCircularSpotify10Gray2Regular,
                                    ),
                                  ],
                                ),
                                Text(
                                  restaurants[index].description,
                                  style: TextStyles
                                      .fontCircularSpotify8StealGrayRegular,
                                  maxLines: 1,overflow: TextOverflow.fade,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        spacing: 6.w,
                                        children:
                                            restaurants[index].tags.map((tag) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w, vertical: 4.h),
                                            decoration: BoxDecoration(
                                              color: AppPallete.lgWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(29.23.r),
                                            ),
                                            child: Text(
                                              "🥗" + tag,
                                              style: TextStyles
                                                  .fontCircularSpotify8AccentBlackRegular,
                                            ),
                                          );
                                        }).toList(),
                                      )),
                                ),
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
                                          restaurants[index]
                                                  .minPrice
                                                  .toString() +
                                              "-" +
                                              restaurants[index]
                                                  .maxPrice
                                                  .toString() +
                                              " £GP per week",
                                          style: TextStyles
                                              .fontCircularSpotify8StealGrayBold),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.86.w, vertical: 4.57.h),
                                        decoration: BoxDecoration(
                                          color: AppPallete.greenColor,
                                          borderRadius:
                                              BorderRadius.circular(57.17.r),
                                        ),
                                        child: Text("Book Now",
                                            style: TextStyles.fontCircularSpotify8WhiteBold),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
  }
}