import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

class RadioOption {
  final String text;
  final FeatureType value;
  final Color activeColor;
  final Color inactiveColor;

  const RadioOption({
    required this.text,
    required this.value,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.white,
  });
}

class ReusableRadioButtons<T> extends StatelessWidget {
 final options = const [
    RadioOption(
      text: 'Free',
      value: FeatureType.free,
      activeColor: Colors.black,
    ),
    RadioOption(
      text: '/ Session',
      value: FeatureType.session,
      activeColor: Colors.green,
    ),
    RadioOption(
      text: '/ Month',
      value: FeatureType.month,
      activeColor: Colors.blue,
    ),
  ];
  final T? groupValue;
  final void Function(T?)? onChanged;
  final MainAxisAlignment mainAxisAlignment;

  const ReusableRadioButtons({
    super.key,
    required this.groupValue,
    required this.onChanged,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: options.map((option) => Container(
        height: 37.h,
        padding: EdgeInsets.only(right:12.w),
        decoration: BoxDecoration(
        color: (option.value).getBackgroundColor(groupValue as FeatureType?),
        borderRadius: BorderRadius.circular(8.r)
        ),
        child: Row(
          children: [
            Radio<T>(
              activeColor: Colors.white,
              fillColor: WidgetStateProperty.all((option.value).getTextColor(groupValue as FeatureType?)),
              value: option.value as T,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text(
              option.text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: (option.value).getTextColor(groupValue as FeatureType?),
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }
}