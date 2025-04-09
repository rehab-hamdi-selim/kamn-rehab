import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomSearchDropodwn extends StatefulWidget {
  const CustomSearchDropodwn({super.key});

  @override
  State<CustomSearchDropodwn> createState() => _CustomSearchDropodwnState();
}

class _CustomSearchDropodwnState extends State<CustomSearchDropodwn> {
  String selectedValue = "Chicken Grilled";

  final List<String> items = [
    "Chicken Grilled",
    "Beef Steak",
    "Vegan Salad",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: AppPallete.whiteColor,
        borderRadius: BorderRadius.circular(33.sp),
        border: Border.all(color: Color(0xffECF0F4)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.fontCircularSpotify14BlackRegular,
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          icon: Icon(
            Icons.arrow_drop_down,
            color: Color(0xff2A7737),
          ),
        ),
      ),
    );
  }
}
