import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_review_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_review_state.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_Container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_button.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_img_builder.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_screen_header.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_tittle_text.dart';

class MealReviewScreen extends StatefulWidget {
  MealReviewScreen({super.key});

  @override
  State<MealReviewScreen> createState() => _MealReviewScreenState();
}

class _MealReviewScreenState extends State<MealReviewScreen> {
  // Meal mealRecap = fakeMeals[0];
  @override
  void initState() {
    super.initState();
    // Call getMeal with the appropriate meal ID
    context
        .read<MealReviewCubit>()
        .getMeal(1); // Replace 1 with the actual meal ID
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(right: 12.w, left: 13.w, top: 30.h),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                const CustomScreenHeader(
                  title: Constants.mealRecap,
                  subTitle: Constants.letReviewYourMeal,
                ),
                const customTittleTextMealReview(
                  title: Constants.mealImages,
                ),

                // CustomImageBuilder(mealImages: mealRecap.imageUrls),
                BlocBuilder<MealReviewCubit, MealReviewState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state.isSuccess) {
                      return CustomImageBuilder(
                          mealImages: state.meal!.imageUrls);
                    } else if (state.isError) {
                      return Center(
                          child: Text(state.error ?? 'An error occurred'));
                    } else {
                      return Container();
                    }
                  },
                ),
                verticalSpace(15),
                //mealDetails
                CustomContainer(
                    heigh: 197.h,
                    content: BlocBuilder<MealReviewCubit, MealReviewState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state.isSuccess) {
                          return MealDetailsWidget(mealRecap: state.meal!);
                        } else {
                          return Center(child: Text(state.error!));
                        }
                      },
                    )),

                verticalSpace(20),
                //states
                CustomContainer(
                  heigh: 88.h,
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Constants.profileVerification,
                            style: TextStyles
                                .fontCircularSpotify14mediumGrayRegular,
                          ),
                          const CustomViewMealState(
                            state: "Pending",
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Constants.utilityBill,
                            style: TextStyles
                                .fontCircularSpotify14mediumGrayRegular,
                          ),
                          const CustomViewMealState(
                            state: "Under Review",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpace(20),

                // buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onTap: () {},
                      backcolor: AppPallete.ofWhiteColor,
                      content: [
                        Text(
                          Constants.editMealDetails,
                          style: TextStyles.fontCircularSpotify14BlackRegular,
                        ),
                      ],
                    ),
                    horizontalSpace(10),
                    CustomButton(
                        onTap: () {},
                        backcolor: AppPallete.blackColor,
                        content: [
                          Text(
                            Constants.saveDraft,
                            style: TextStyles.fontCircularSpotify14WhiteMedium,
                          ),
                        ])
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MealDetailsWidget extends StatelessWidget {
  const MealDetailsWidget({
    super.key,
    required this.mealRecap,
  });

  final Meal mealRecap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Constants.mealName,
          style: TextStyles.fontCircularSpotify14mediumGrayRegular,
        ),
        customTittleTextMealReview(title: mealRecap.name),
        verticalSpace(10),
        Row(
          children: [
            Column(
              children: [
                Text(
                  Constants.cookingTime,
                  style: TextStyles.fontCircularSpotify14mediumGrayRegular,
                ),
                customTittleTextMealReview(
                    title: formatDuration(mealRecap.prepTime)),
              ],
            ),
            horizontalSpace(50),
            Column(
              children: [
                Text(
                  Constants.mealPrice,
                  style: TextStyles.fontCircularSpotify14mediumGrayRegular,
                ),
                customTittleTextMealReview(
                    title: mealRecap.price.toString() + " " + Constants.eGP),
              ],
            )
          ],
        ),
        Text(
          Constants.specialtyTags,
          style: TextStyles.fontCircularSpotify14mediumGrayRegular,
        ),
        customListView(list: mealRecap.specialtyTags),
      ],
    );
  }
}

class CustomViewMealState extends StatelessWidget {
  const CustomViewMealState({
    super.key,
    required this.state,
  });
  final String state;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30.h,
        // width: 92.w,
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: getColorState(state: state),
          border: Border.all(
            color: AppPallete.lightGreyColor,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(29.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
          child: Text(
            state,
            style: TextStyles.fontCircularSpotify12WhiteRegular,
          ),
        ));
  }
}

class customListView extends StatelessWidget {
  const customListView({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: list.map((tag) {
          return CustomTagItem(
            tagTitle: tag,
          );
        }).toList(),
      ),
    );
  }
}

class CustomTagItem extends StatelessWidget {
  const CustomTagItem({
    super.key,
    required this.tagTitle,
  });
  final String tagTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      // width: 92.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppPallete.ofWhiteColor4,
        border: Border.all(
          color: AppPallete.lightGreyColor,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(29.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.w),
            child: Text(
              tagTitle,
              style: TextStyles.fontCircularSpotify10BlackRegular,
            ),
          )
        ],
      ),
    );
  }
}

String formatDuration(int minutes) {
  if (minutes < 60) {
    return '$minutes min';
  } else {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;
    if (remainingMinutes == 0) {
      return '$hours hr';
    } else {
      return '$hours hr $remainingMinutes min';
    }
  }
}

Color getColorState({required String state}) {
  switch (state) {
    case 'Pending':
      return AppPallete.orangeAccentColor;
    case 'Under Review':
      return AppPallete.greenAccentColor;
    case 'Approved':
      return AppPallete.greenAccentColor;
    default:
      return AppPallete.greyColor;
  }
}
