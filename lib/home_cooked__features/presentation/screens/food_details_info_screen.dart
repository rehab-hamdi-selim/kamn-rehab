import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_food_details_footer.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_homecook_ingredients.dart';

List<String> fakeMealsimgs = [
  "assets/images/meal_info_img.png"
      "assets/images/meal_info_img.png"
];

class FoodDetailsInfoScreen extends StatefulWidget {
  const FoodDetailsInfoScreen({super.key});

  @override
  State<FoodDetailsInfoScreen> createState() => _FoodDetailsInfoScreenState();
}

class _FoodDetailsInfoScreenState extends State<FoodDetailsInfoScreen> {
  late PageController _pageController;

  int _currentPage = 0;
  // Track the current page index
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _goToNextImage() {
    if (_currentPage < fakeMeals.length - 1) {
      _pageController.nextPage(


        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _goToPreviousImage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const  Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            //**** meal img ***//
            Container(
              width: 391.w,
              height: 328.h,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: fakeMeals.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    fakeMeals[index].imageUrls[0],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 328.h,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/meal_info_img.png');
                    },
                  );
                },
              ),
              // child: PageView.builder(
              //   itemCount: fakeMeals[index].imageUrls.length,
              //   itemBuilder: (context, imgIndex) {
              //     return Image.network(
              //       fakeMeals[index].imageUrls[imgIndex],
              //       fit: BoxFit.cover,
              //       width: double.infinity,
              //       height: 328.h,
              //       errorBuilder: (context, error, stackTrace) {
              //         return Image.asset('assets/images/meal_info_img.png');
              //       },
              //     );
              //   },
              // ),
            ),
            //**** back btn ***//
            Positioned(
              top: 10.h,
              left: 10.w,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  IconLinks.backArrow,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
            //**** previous btn ***//
            Positioned(
              top: 140.h,
              left: 2.w,
              child: IconButton(
                onPressed: () {
                  _goToPreviousImage();
                },
                icon: SvgPicture.asset(
                  IconLinks.backArrowBTN,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
            //**** next btn ***//
            Positioned(
              top: 140.h,
              right: 2.w,
              child: IconButton(
                onPressed: () {
                  _goToNextImage();
                },
                icon: SvgPicture.asset(
                  IconLinks.nextArrow,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
            //**** details ***//
            Positioned(
                top: 220.h,
                right: 15.w,
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(IconLinks.favorite))),
            Positioned(
              top: 245.h,
              left: 15.w,
              child: Container(
                width: 153.w,
                height: 41.h,
                decoration: BoxDecoration(
                  color: AppPallete.whiteColor,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                    child: Text(
                  "Sarah’s House",
                  style: TextStyles.fontCircularSpotify14AccentBlackMedium,
                )),
              ),
            ),

            /// *Details Container*
            Positioned(
              bottom: 3.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 536.h,
                decoration: BoxDecoration(
                  color: AppPallete.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.r),
                    topRight: Radius.circular(45.r),
                  ),
                ),
                padding: EdgeInsets.all(16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(7.h),
                    Text(
                      fakeMeals[0].name,
                      style: TextStyles.fontCircularSpotify21BlackBold,
                    ),
                    verticalSpace(10.h),
                    fooddetailsInfo(),
                    verticalSpace(10.h),
                    Text(
                      Constants.detailsTitle,
                      style: TextStyles.fontCircularSpotify17BlackRegular,
                    ),
                    verticalSpace(10.h),
                    Text(
                      fakeMeals[0].details,
                      style: TextStyles.fontCircularSpotify14BlackRegular,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 7,
                    ),
                    verticalSpace(10.h),
                    //**** ingredients */
                    Text(
                      Constants.ingredients,
                      style: TextStyles.fontCircularSpotify17BlackRegular,
                    ),
                    verticalSpace(10.h),
                    CustomHomecookIngredients(),
                    const Spacer(),
                    //**** footer */
                    const CustomFoodDetailsFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget fooddetailsInfo() {
  return Row(
    children: [
      Text(
        "4.8 ⭐",
        style: TextStyles.fontCircularSpotify14LightBlackRegular,
      ),
      Text(
        " 120",
        style: TextStyles.fontCircularSpotify10Gray2Regular,
      ),
      horizontalSpace(12.w),
      Text(
        "🔥 ${fakeMeals[0].calories.toString()} ${Constants.kCal}",
        style: TextStyles.fontCircularSpotify14GrayRegular,
      ),
      horizontalSpace(12.w),
      Container(
        width: 78.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppPallete.lightGreen,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              horizontalSpace(1.w),
              Image.asset(
                ImageLinks.cooking,
                width: 15.w,
                height: 15.h,
              ),
              Text(
                "${fakeMeals[0].prepTime} ${Constants.minute}",
                style: TextStyles.fontCircularSpotify12WhiteBold,
              ),
              horizontalSpace(1.w),
            ],
          ),
        ),
      )
    ],
  );
}
