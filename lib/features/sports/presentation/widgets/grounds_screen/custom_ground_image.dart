import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/app_images.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_favorite_button.dart';

class CustomGroundImage extends StatelessWidget {
  const CustomGroundImage(
      {super.key, this.favoriteOnTap, required this.images});
  final void Function()? favoriteOnTap;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: CachedNetworkImage(
            width: 323.w,
            fit: BoxFit.fill,
            height: 170.h,
            imageUrl: images.first,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: AppPallete.greenColor,)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: CustomFavoriteButton(
            favoriteOnTap: favoriteOnTap,
          ),
        ),
      ],
    );
  }
}
