// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/font_weight_helper.dart';

class CustomGeneralButton extends StatefulWidget{
  final String? textButton;
  VoidCallback ontab =() {} ;
  final double buttonWidth;
  final Color buttonColor;
  final Color buttonTextColor;

   CustomGeneralButton({super.key, required this.textButton ,  required this.ontab, required this.buttonWidth, required this.buttonColor, required this.buttonTextColor, });

  @override
  State<CustomGeneralButton> createState() => _CustomGeneralButtonState();
}

class _CustomGeneralButtonState extends State<CustomGeneralButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontab,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),
        color: widget.buttonColor,
        ),
        width: widget.buttonWidth,
        height: 30.h,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 3.4, 0, 0),
          child: Text(widget.textButton!,style: TextStyle(
                fontFamily: "Roboto",
                color: widget.buttonTextColor,
                fontWeight: FontWeightHelper.regular,
                fontSize: 14.h),textAlign: TextAlign.center ,),
        ),
      ),
    );
  }
}