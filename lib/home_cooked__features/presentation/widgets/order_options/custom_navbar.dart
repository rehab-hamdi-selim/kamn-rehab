import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomNavBarOrderOptions extends StatefulWidget {
  const CustomNavBarOrderOptions({super.key});

  @override
  _CustomNavBarOrderOptionsState createState() =>
      _CustomNavBarOrderOptionsState();
}

class _CustomNavBarOrderOptionsState extends State<CustomNavBarOrderOptions> {
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 335.w,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppPallete.greyColor2,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppPallete.lightGreyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return GestureDetector(
            onTap: () => _onNavItemTapped(index),
            child: CustomTapItem(
              selectedIndex: _selectedIndex,
              index: index, // Pass index correctly
              labl: "Op ${index + 1}",
            ),
          );
        }),
      ),
    );
  }
}

class CustomTapItem extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String labl;

  const CustomTapItem({
    super.key,
    required this.selectedIndex,
    required this.index,
    required this.labl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: selectedIndex == index ? AppPallete.blackColor : null,
      ),
      child: Text(
        labl,
        style: selectedIndex == index
            ? TextStyles.fontCircularSpotify12WhiteRegular
            : TextStyles.fontCircularSpotify10BlackRegular,
      ),
    );
  }
}
