import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/common/widget/view_full_image.dart';

class CustomeImageSlideShow extends StatelessWidget {
  const CustomeImageSlideShow({required this.imagesPath, super.key});

  final List<dynamic> imagesPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewFullImage(
                      imageUrl: imagesPath.first,
                    )));
      },
      child: Stack(
        children: [
          // The Image Slideshow
          if (imagesPath.isNotEmpty)
            ImageSlideshow(
              indicatorBottomPadding: 10.h,indicatorRadius: 4.h,
              // Padding for indicators
              width: double.infinity,
              height: 250.h,
              initialPage: 0,
              indicatorColor: AppPallete.greenColor,
              indicatorBackgroundColor: AppPallete.lgGreyColor,
              autoPlayInterval: imagesPath.length == 1 ? null : 3000,
              isLoop: true,
              children: imagesPath.map((path) {
                return CachedNetworkImage(
                 imageUrl:  path,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
          if (imagesPath.isEmpty)
            SizedBox(
              width: double.infinity,
              height: 250.h,
              child: const Center(child: Icon(Icons.error_outline, size: 40)),
            ),
          Positioned(
            top: 20.h,
            left: 20.w,
            right: 20.w,
            child: SizedBox(
              width: 340.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppPallete.greenColor,
                          border: Border.all(
                              color: AppPallete.whiteColor, width: 1)),
                      child: const Icon(Icons.arrow_back,
                          color: AppPallete.ofWhiteColor),
                    ),
                  ),
                  Icon(
                    Icons.bookmark_border,
                    color: AppPallete.whiteColor,
                    size: 30.h,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
