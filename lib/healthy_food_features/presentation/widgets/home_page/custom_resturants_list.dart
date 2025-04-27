import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/restaurant_model.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/test_meals_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/screens/res_view_screen.dart';

class CustomResturantsList extends StatelessWidget {
  const CustomResturantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestMealsCubit, TestMealsState>(
      builder: (context, state) {
        if (state.status == TestMealsStatus.loading) {
          return SizedBox(
            height: 200.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.status == TestMealsStatus.error) {
          return SizedBox(
            height: 200.h,
            child: Center(
              child: Text(
                'Error: ${state.errorMessage}',
                style: TextStyles.fontCircularSpotify14BlackRegular,
              ),
            ),
          );
        } else if (state.status == TestMealsStatus.initial) {
          return SizedBox(height: 200.h);
        }
        return ListView.builder(
          itemCount: state.meals.length,
          itemBuilder: (context, index) {
            return ResturantCard(
              meals: state.meals[index],
            );
          },
        );
      },
    );
  }
}

class ResturantCard extends StatelessWidget {
  ResturantCard({super.key, required this.meals});
  final TestMealModel meals;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetails(
              meal: meals,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: SizedBox(
          height: 116.h,
          child: Row(
            children: [
              Image.network(
                meals.imageUrls.first,
                width: 70.w,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          meals.name,
                          style: TextStyles.fontCircularSpotify12BlackMedium,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/dish_photo.svg",
                                width: 10.w, height: 10.h),
                            SizedBox(width: 4.w),
                            Text(
                              "${meals.prepTime} min",
                              style: TextStyles
                                  .fontCircularSpotify8AccentBlackRegular,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/location_tag.svg"),
                        SizedBox(width: 4.w),
                        Text(
                          "Location",
                          style: TextStyles.fontCircularSpotify10Gray2Regular,
                        ),
                      ],
                    ),
                    Text(
                      meals.details,
                      style: TextStyles.fontCircularSpotify8StealGrayRegular,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            spacing: 6.w,
                            children: meals.ingredients.map((tag) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: AppPallete.lgWhiteColor,
                                  borderRadius: BorderRadius.circular(29.23.r),
                                ),
                                child: Text(
                                  "🥗$tag",
                                  style: TextStyles
                                      .fontCircularSpotify8AccentBlackRegular,
                                ),
                              );
                            }).toList(),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: AppPallete.lgWhiteColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                              "${meals.price}-${meals.price} £GP per week",
                              style:
                                  TextStyles.fontCircularSpotify10BlackMedium),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(),
                            child: Container(
                              // padding: EdgeInsets.all(8.w),
                              height: 30.225.h,
                              width: 79.08.w,
                              decoration: BoxDecoration(
                                color: AppPallete.greenColor,
                                borderRadius: BorderRadius.circular(57.17.r),
                              ),
                              child: Center(
                                child: Text(
                                  "Book Now",
                                  style: TextStyles.circularSpotify10BoldWhite,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
