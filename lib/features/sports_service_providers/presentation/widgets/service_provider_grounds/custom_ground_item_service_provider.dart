import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';

class CustomGroundItemServiceProvider extends StatelessWidget {
 final PlaygroundRequestModel playgroundRequest;

  const CustomGroundItemServiceProvider({super.key, required this.playgroundRequest});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppPallete.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPallete.greenColor,
          width: 1.w,
        ),
      ),
      child: Column(children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: CachedNetworkImage(
                  imageUrl: playgroundRequest.groundImages?.isNotEmpty == true
                      ? playgroundRequest.groundImages![0]
                      : '',
                  imageBuilder: (context, imageProvider) => Container(
                        width: double.infinity,
                        height: 191.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  placeholder: (context, url) => SizedBox(
                      width: double.infinity,
                      height: 191.h,
                      child: const Center(child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => SizedBox(
                      width: double.infinity,
                      height: 191.h,
                      child: const Center(
                          child: Icon(Icons.error_outline, size: 40)))),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(2.h.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppPallete.whiteColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_outline,
                      color: AppPallete.darkGrayColor,
                      size: 20.h,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              playgroundRequest.playgroundName ?? '',
              style: TextStyles.font16DartBlackColorW400,
            ),
            horizontalSpace(8),
            Text(
              "2 km",
              style: TextStyles.font10DarkGreenColorW400,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Owner: ${playgroundRequest.owner?.name ?? ''}",
              style: TextStyles.font10BlackColorW400,
            ),
            Text(
              '',
              style: TextStyles.font10DarkGreenColorW400,
            ),
          ],
        ),
       Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Expanded( // Wrap the first Row with Expanded to limit its width
      child: Row(  mainAxisAlignment: MainAxisAlignment.start,
      
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 12.h,
            color: AppPallete.grayColor,
          ),
          horizontalSpace(4),
          Flexible( // Wrap the Text with Expanded to limit its width
            child: IntrinsicWidth(
              child: Text(
                playgroundRequest.address ?? "",
                style: TextStyles.font10GrayColorW400,
                maxLines: 1, // Limit to 1 line`
                overflow: TextOverflow.ellipsis, // Add ellipsis if the text overflows
              ),
            ),
          ),
          horizontalSpace(8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppPallete.whiteColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppPallete.greenColor,
                width: 1.w,
              ),
            ),
            child: Container(
              height: 4.h,
              width: 4.w,
              decoration: const BoxDecoration(
                color: AppPallete.greenColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          horizontalSpace(4),
          Text(
            playgroundRequest.status ?? "",
            style: TextStyles.font7DartBlackColorW400,
          ),
          horizontalSpace(8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: AppPallete.whiteColor,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: AppPallete.greenColor,
                width: 1.w,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${playgroundRequest.rating ?? 0}',
                  style: TextStyles.font10GrayColorW400,
                ),
                Icon(
                  Icons.star,
                  size: 12.h,
                  color: AppPallete.yellowColor,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "250 LE",
          style: TextStyles.font16DartBlackColorW400,
        ),
        Text(
          " / hr",
          style: TextStyles.font10BlackColorW400,
        ),
      ],
    ),
  ],
),
      ]),
    );
  }
}
