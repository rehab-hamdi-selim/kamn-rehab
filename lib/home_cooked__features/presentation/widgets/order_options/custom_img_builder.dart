import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/CustomCircularButton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomImageBuilder extends StatefulWidget {
  const CustomImageBuilder({
    super.key,
    required this.mealImages,
  });

  final List mealImages;

  @override
  State<CustomImageBuilder> createState() => _CustomImageBuilderState();
}

class _CustomImageBuilderState extends State<CustomImageBuilder> {
  final PageController _pageController = PageController();

  int _activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 214.h,
        width: 367.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.mealImages.length,
              onPageChanged: (page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(widget.mealImages[index],
                      fit: BoxFit.cover, width: 367.w),
                );
              },
            ),
            Positioned(
                left: 10.w,
                child: CustomCircularButton(
                  icon: Icons.arrow_back_ios,
                  onTap: _previousPage,
                )),
            Positioned(
                right: 10,
                child: CustomCircularButton(
                  icon: Icons.arrow_forward_ios,
                  onTap: _nextPage,
                )),
            Positioned(
              bottom: 15,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: widget.mealImages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.blueAccent,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _nextPage() {
    if (_activePage < widget.mealImages.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_activePage > 0) {
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
}
