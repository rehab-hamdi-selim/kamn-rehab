import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomMealTypeSelection extends StatefulWidget {
  final Function(String) onMealTypeSelected;
  final String selectedMealType;

  const CustomMealTypeSelection({
    Key? key,
    required this.onMealTypeSelected,
    required this.selectedMealType,
  }) : super(key: key);

  @override
  _CustomMealTypeSelectionState createState() => _CustomMealTypeSelectionState();
}

class _CustomMealTypeSelectionState extends State<CustomMealTypeSelection> {
  late String _selectedMealType;

  @override
  void initState() {
    super.initState();
    _selectedMealType = widget.selectedMealType;
  }

  void _onSelect(String mealType) {
    setState(() {
      _selectedMealType = mealType;
    });
    widget.onMealTypeSelected(mealType);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mealTypeButton("🥗Breakfast", _selectedMealType == "Breakfast", () => _onSelect("Breakfast")),
          horizontalSpace(7.w),
          mealTypeButton("🍽 Lunch", _selectedMealType == "Lunch", () => _onSelect("Lunch")),
          horizontalSpace(7.w),
          mealTypeButton("🌿 Dinner", _selectedMealType == "Dinner", () => _onSelect("Dinner")),
          horizontalSpace(7.w),
          mealTypeButton("🥐 Snacks", _selectedMealType == "Snack", () => _onSelect("Snack")),
        ],
      ),
    );
  }
}


Widget mealTypeButton(String title, bool isSelected, VoidCallback onTap) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? AppPallete.lightOrangeColor : Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33.r)),
    ),
    child: Text(
      title,
      style: TextStyles.fontCircularSpotify14BlackRegular,
),
);
}