import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/Food_details_info/custom_positioned_homeCook_name.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/Food_details_info/custom_positioned_btns.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/Food_details_info/positionesd_homeCook_details.dart';

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
        duration: const Duration(milliseconds: 300),
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
            SizedBox(
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
            customPositionedBtns(
              leftPosition: 10,
              topPosition: 10,
              onTap:() => Navigator.pop(context),
              icon: IconLinks.backArrow,
            ),
            //**** previous btn ***//
            customPositionedBtns(
              leftPosition: 2,
              topPosition: 140,
              onTap: _goToPreviousImage,
              icon: IconLinks.backArrowBTN,
            ),
            //**** next btn ***//
            customPositionedBtns(
              rightPosition: 2,
              topPosition: 140,
              onTap: _goToNextImage,
              icon: IconLinks.nextArrow,
            ),

            //**** details ***//
            Positioned(
                top: 220.h,
                right: 15.w,
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(IconLinks.favorite))),
            //**** resturant name ***//
            customPositionedHomeCookName(),
            /// **Details Container**
            PositionesdHomecookDetails(),
          ],
        ),
      ),
    );
  }
}
