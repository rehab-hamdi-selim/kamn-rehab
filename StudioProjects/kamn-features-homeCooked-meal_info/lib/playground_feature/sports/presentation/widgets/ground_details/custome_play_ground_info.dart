import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomePlayGroundInfo extends StatefulWidget {
  const CustomePlayGroundInfo({required this.description, super.key});

  final String description;

  @override
  State<CustomePlayGroundInfo> createState() => _CustomePlayGroundInfoState();
}

class _CustomePlayGroundInfoState extends State<CustomePlayGroundInfo> {
  int maxLines = 3;
  bool isExpanded = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    isVisible = (widget.description.length > 100);
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Column(
              children: [
                Stack(
                  children: [
                    Text(
                      widget.description ,
                      style: TextStyles.fontRoboto12BlackRegular
                          .copyWith(fontSize: 16.h),
                      maxLines: maxLines,
                      textAlign: TextAlign.center,
                    ),
                    if (!isExpanded && isVisible)
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
                  ],
                ),
                if (isVisible) toggleExpandButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget toggleExpandButton() {
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
              if (isExpanded) {
                maxLines = 3;
                isExpanded = false;
              } else {
                maxLines = 1000;
                isExpanded = true;
              }
            });
          },
          child: Text(
            isExpanded ? 'show less' : 'Read more',
            style: TextStyles.fontRoboto16BlackRegular,
          ),
        ),
      ),
    );
  }
}
