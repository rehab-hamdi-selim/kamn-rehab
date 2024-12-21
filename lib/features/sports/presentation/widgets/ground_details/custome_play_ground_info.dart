import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/utils/custom_star_rating.dart';
import "package:kamn/features/sports/data/models/playground_model.dart";

class CustomePlayGroundInfo extends StatefulWidget {
  const CustomePlayGroundInfo({required this.playgroundModel, super.key});

  final PlaygroundModel? playgroundModel;

  @override
  State<CustomePlayGroundInfo> createState() => _CustomePlayGroundInfoState();
}

class _CustomePlayGroundInfoState extends State<CustomePlayGroundInfo> {
  int maxLines = 10;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(15.h),
          ownerAndDirectionRow(),
          verticalSpace(5.h),
          playGroundNameAndRating(),
          Text(
            widget.playgroundModel?.address ?? "",
            style: TextStyles.font12GreenSemiBold,
          ),
          verticalSpace(10.h),
          playGroundFeatures(),
          verticalSpace(10.h),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Text(
                          " Lorem ipsum dolor sit amet consectetur. Aliquam auctor erat bibendum magna mi. Sed diam cursus quam volutpat faucibus ullamcorper phasellus urna semper. Et eget aliquet odio iaculis viverra aliquet venenatis. Purus malesuada odio enim elit. Non in est faucibus eget nec. Faucibus mauris elit dictum ultricies ut amet purus. Consequat aliquam volutpat quisque auctor tristique elementum nunc. Ultricies diam fermentum ullamcorper egestas aenean fringilla commodo. Semper habitasse mauris ornare imperdiet. Egestas non magna id a. Sollicitudin sodales sit purus volutpat mi aliquam lobortis dictum. Tortor integer ullamcorper orci enim cursus netus sed.Nunc odio consequat morbi dolor pharetra sed proin. Cras nisi malesuada malesuada tristique sit at sit felis. Enim hendrerit eu suscipit vel nibh natoque. Neque at malesuada nunc tortor odio. Vulputate quam egestas nam etiam nec feugiat. Convallis ipsum senectus a tellus.Metus lectus luctus viverra donec. Augue cursus viverra eros in. Nunc, eget aliquet odio iaculis",
                          style: TextStyles.font12blackRegular
                              .copyWith(fontSize: 16.h),
                          maxLines: maxLines,
                          textAlign: TextAlign.center,
                        ),
                        if (isVisible)
                          Positioned(
                            bottom:
                                5, // Ensure the container is aligned to the bottom
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
                    if (!isVisible) showLessButton()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Positioned readMoreButton() {
    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
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
                maxLines = 1000;
                isVisible = false;
              });
            },
            child: Text(
              'Read more',
              style: TextStyles.font16blackRegular,
            ),
          ),
        ),
      ),
    );
  }

  Widget showLessButton() {
    return Align(
      alignment: Alignment.center,
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
              maxLines = 10;
              isVisible = true;
            });
          },
          child: Text(
            'show less',
            style: TextStyles.font16blackRegular,
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

  Row playGroundNameAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.playgroundModel?.name ?? "",
            style: TextStyles.font24BlackRegular.copyWith(height: .85),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
        const Spacer(
          flex: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            decoration: BoxDecoration(
                color: AppPallete.shadeOfGray,
                borderRadius: BorderRadius.circular(23.r)),
            child:
                CustomStarRating(rating: widget.playgroundModel?.rating ?? 0)),
      ],
    );
  }

  Row ownerAndDirectionRow() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13.r)),
            color: AppPallete.shadeOfGray,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                  radius: 10.r, child: Image.asset('assets/images/user.png')),
              horizontalSpace(3.w),
              Text(
                'mahmoudsayed',
                style: TextStyles.font10BlackColorW400,
              )
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        SizedBox(
          height: 25.h,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppPallete.lightGreen.withOpacity(.07),
                side: BorderSide(
                    color: AppPallete.lightGreen.withOpacity(.3), width: 1)),
            onPressed: () {},
            label: Text(
              Constants.directions,
              style: TextStyles.font14GreenRegular,
            ),
            icon: SvgPicture.asset('assets/icons/direction.svg'),
          ),
        ),
      ],
    );
  }
}
