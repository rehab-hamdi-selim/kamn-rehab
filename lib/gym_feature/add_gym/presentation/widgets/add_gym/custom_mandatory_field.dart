import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomMandatoryField extends StatefulWidget {
  const CustomMandatoryField({super.key, required this.title, required this.translation, this.fontSize});
  final String title;
  final String translation;
  final double? fontSize;

  @override
  _CustomMandatoryFieldState createState() => _CustomMandatoryFieldState();
}

class _CustomMandatoryFieldState extends State<CustomMandatoryField> {
  bool _isValid = true;
  String? _selectedFile;

  void _pickFile() {
    // Simulate file selection (replace with actual file picker)
    setState(() {
      _selectedFile = null; // Set to null to simulate no selection
      _isValid = _selectedFile != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12.r),
          color: _isValid ? Colors.grey : Colors.red,
          strokeWidth: 0.5,
          dashPattern: const [16, 16],
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     widget.title,
                      style:
                          TextStyles.fontCircularSpotify14BlackRegular.copyWith(
                        color: _isValid ? null : AppPallete.redColor,
                      ),
                    ),
                    Text(
                      "(${widget.translation})",
                      style: TextStyles.fontCircularSpotify8StealGrayRegular.copyWith(
                        fontSize: widget.fontSize
                      )
                        
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: AppPallete.grayColor,
                      width: 0.27,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.5),
                    ),
                    minimumSize: Size(113.w, 15.h),
                  ),
                  onPressed: _pickFile,
                  child: Text("Choose file",
                      style: TextStyles.fontCircularSpotify8AccentBlackRegular
                          .copyWith(
                        color: _isValid
                            ? AppPallete.grayColor
                            : AppPallete.redColor,
                      )),
                ),
              ],
            ),
          ),
        ),
        if (!_isValid)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text("You must add this file",
                style: TextStyles.fontCircularSpotify8AccentBlackRegular
                    .copyWith(color: AppPallete.redColor)),
          ),
      ],
    );
  }
}
