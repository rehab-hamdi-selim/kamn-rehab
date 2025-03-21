import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_tittle_text.dart';

class CustomCheckbox extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isChecked;
  final void Function(bool?)? onChanged;

  const CustomCheckbox({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: BorderSide(width: 1.5, color: AppPallete.lightGreenColor),
            splashRadius: 0),

        // CheckboxThemeData(
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(50),
        //       side: BorderSide(
        //           style: BorderStyle.solid,
        //           color: AppPallete.lightGreenColor,
        //           width: 30.w,
        //           strokeAlign: 20) // Fully rounded checkbox
        //       ),
        // ),
      ),
      child: CheckboxListTile(
        title: Row(
          children: [
            customTittleText(title: widget.title)
            // Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
            // if (widget.isChecked) Icon(Icons.check_circle, color: Colors.green),
          ],
        ),

        subtitle: Text(
          widget.subtitle,
          style: TextStyles.fontCircularSpotify10BlackRegular,
        ),
        // checkboxShape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0.r),
        //   // side: BorderSide(
        //   //     style: BorderStyle.solid,
        //   //     color: AppPallete.lightGreenColor,
        //   //     width: 30.w,
        //   //     strokeAlign: 20)
        // ),
        // side: BorderSide(
        //     style: BorderStyle.solid,
        //     color: AppPallete.lightGreenColor,
        //     width: 30.w,
        //     strokeAlign: 20),
        // materialTapTargetSize:
        //     MaterialTapTargetSize.shrinkWrap, // Reduces default padding
        // visualDensity: VisualDensity(horizontal: 1, vertical: 1),
        value: widget.isChecked,
        onChanged: widget.onChanged,
        // controlAffinity: ListTileControlAffinity
        //     .leading, // Moves default checkbox to the start
        // activeColor:
        //     Colors.green, // Makes the default checkbox green when checked
        // secondary: Icon(Icons.import_contacts),
      ),
    );
  }
}
