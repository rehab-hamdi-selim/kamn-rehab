import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_state.dart';

class CustomVerifyUtilityBillField extends StatefulWidget {
  const CustomVerifyUtilityBillField(
      {super.key,
      required this.title,
      required this.translation,
      this.fontSize,
      this.index});

  final String title;
  final String translation;
  final double? fontSize;
  final int? index;

  @override
  State<CustomVerifyUtilityBillField> createState() =>
      _CustomUtilityBillFieldState();
}

class _CustomUtilityBillFieldState extends State<CustomVerifyUtilityBillField> {
  @override
  Widget build(BuildContext context) {
    final bool isValid = widget.index != null
        ? context.watch<AddHomeCookCubit>().state.isValid[widget.index!]
        : true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12.r),
          color: isValid ? Colors.grey : Colors.red,
          strokeWidth: 0.5,
          dashPattern: const [16, 16],
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyles.fontCircularSpotify14BlackRegular
                              .copyWith(
                            color: isValid ? null : AppPallete.redColor,
                          ),
                        ),
                        Text("(${widget.translation})",
                            style: TextStyles
                                .fontCircularSpotify8StealGrayRegular
                                .copyWith(fontSize: widget.fontSize)),
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
                      onPressed: () {
                        context
                            .read<AddHomeCookCubit>()
                            .pickUtilityImages(widget.title);
                      },
                      child: Text("Choose file",
                          style: TextStyles
                              .fontCircularSpotify8AccentBlackRegular
                              .copyWith(
                            color: isValid
                                ? AppPallete.grayColor
                                : AppPallete.redColor,
                          )),
                    ),
                  ],
                ),
                if (context
                        .watch<AddHomeCookCubit>()
                        .state
                        .utilityBill
                        ?.getFieldByText(widget.title) !=
                    null)
                  Divider(
                    color: AppPallete.lightGreyColor,
                    thickness: .2,
                    endIndent: 30.h,
                    indent: 30.h,
                  ),
                if (context
                        .watch<AddHomeCookCubit>()
                        .state
                        .utilityBill
                        ?.getFieldByText(widget.title) !=
                    null)
                  Center(
                    child: Image.file(
                      (context
                          .watch<AddHomeCookCubit>()
                          .state
                          .utilityBill
                          ?.getFieldByText(widget.title))!,
                      height: 255.h,
                      width: 200.w,
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (!isValid)
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
