import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomeImageSlideShow extends StatelessWidget {
  const CustomeImageSlideShow({required this.imagesPath, super.key});

  final List<dynamic> imagesPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageSlideshow(
          indicatorBottomPadding: 100.h,
          width: double.infinity,
          height: 346.h,
          initialPage: 0,
          indicatorColor: const Color.fromARGB(255, 116, 207, 131),
          indicatorBackgroundColor: AppPallete.lgGreyColor,
          autoPlayInterval: imagesPath.length == 1 ? null : 3000,
          isLoop: true,
          children: imagesPath.isNotEmpty
              ? imagesPath.map((path) {
                  return CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: path,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  );
                }).toList()
              : [
                  SizedBox(
                    width: double.infinity,
                    height: 346.h,
                    child: const Center(
                        child: Icon(Icons.error_outline, size: 40)),
                  ),
                ],
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
                        color: AppPallete.whiteColor,
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppPallete.ofWhiteColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.bookmark_border,
                    color: AppPallete.whiteColor,
                    size: 30.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
