import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:kamn/features/sports/data/models/playground_model.dart";

class CustomePlayGroundInfo extends StatefulWidget {
  CustomePlayGroundInfo({required this.playgroundModel, super.key});

  PlaygroundModel? playgroundModel;

  @override
  State<CustomePlayGroundInfo> createState() => _CustomePlayGroundInfoState();
}

class _CustomePlayGroundInfoState extends State<CustomePlayGroundInfo> {
  int maxLines = 10;
  bool isVisible = true;
  PlaygroundModel? playgroundModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          verticalSpace(38.h),
          playGroundName(),
          verticalSpace(5.h),
          playGroundDirection(),
          verticalSpace(21.h),
          playGroundFeatures(),
          verticalSpace(12.h),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Text(
                        "  ${widget.playgroundModel?.description}",
                        style: TextStyles.font12blackRegular
                            .copyWith(fontSize: 16.h),
                        maxLines: maxLines,
                      ),
                      if (isVisible)
                        Positioned(
                          bottom:
                              0, // Ensure the container is aligned to the bottom
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 200.h,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(0, 255, 255, 255),
                                  Colors.white,
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (isVisible) readMoreButton()
                    ],
                  ),
                  if (!isVisible) readMoreButton()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Positioned readMoreButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: SizedBox(
            height: 30.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: AppPallete.lightGreenColor,
                  width: 1,
                ),
                backgroundColor: const Color(0xffF6F6F6).withOpacity(0.65),
                elevation: 0,
              ),
              onPressed: () {
                setState(() {
                  if (maxLines <= 10) {
                    maxLines = 1000;
                    isVisible = false;
                  } else {
                    maxLines = 10;
                    isVisible = true;
                  }
                });
              },
              child: Text(
                maxLines > 10 ? "Show Less" : "Read More",
                style: TextStyles.font16blackRegular,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row playGroundFeatures() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Constants.playGroundFeatures,
          style: TextStyles.font20BlackBold,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: AppPallete.greenColor.withOpacity(.3),
                ),
              ),
              child: CircleAvatar(
                radius: 5.sp,
                backgroundColor: AppPallete.lightGreen,
              ),
            ),
            horizontalSpace(6.w),
            Text(
              Constants.available,
              style: TextStyles.font13BlackRegular,
            )
          ],
        )
      ],
    );
  }

  Row playGroundDirection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              playgroundModel?.address ?? "",
              style: TextStyles.font12GreenSemiBold,
            ),
            horizontalSpace(8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppPallete.greenColor.withOpacity(.3),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Text(
                    '4.5',
                    style: TextStyles.font12GreyRegular,
                  ),
                  horizontalSpace(6.w),
                  Icon(
                    Icons.star,
                    color: AppPallete.yellowColor,
                    size: 15.sp,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 32.h,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppPallete.greenColor.withOpacity(.07),
                side: BorderSide(
                    color: AppPallete.greenColor.withOpacity(.3), width: 1)),
            onPressed: () {},
            label: Text(
              Constants.directions,
              style: TextStyles.font14GreenRegular,
            ),
            icon: SvgPicture.asset('assets/icons/direction.svg'),
          ),
        )
      ],
    );
  }

  Row playGroundName() {
    return Row(
      children: [
        Expanded(
          child: Text('Hadra Stadium East .1',
              style: TextStyles.font24BlackRegular.copyWith(height: .85),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/user.png'),
              horizontalSpace(3.w),
              Text(
                'mahmoudsayed',
                style: TextStyles.font13BlackRegular,
              )
            ],
          ),
        )
      ],
    );
  }
}
