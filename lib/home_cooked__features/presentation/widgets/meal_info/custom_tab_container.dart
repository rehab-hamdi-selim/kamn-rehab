import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/tab_item.dart';
import 'package:kamn/home_cooked__features/data/models/tabs_model.dart';

class CustomTabContainer extends StatefulWidget {
  const CustomTabContainer({super.key, required this.tabNames});
  final List<TabsName> tabNames;

  @override
  State<CustomTabContainer> createState() => _CustomTabContainerState();
}

class _CustomTabContainerState extends State<CustomTabContainer> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: ShapeDecoration(
        color: Colors.white30,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.20.w,
            color: AppPallete.lightGreyColor,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: DefaultTabController(
        length: widget.tabNames.length,
        child: TabBar(
          physics: const BouncingScrollPhysics(),
          onTap: (index) {
            if (index == selectedTabIndex) return;
            setState(() {
              selectedTabIndex = index;
            });
          },
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          tabs: widget.tabNames.map((tabNames) {
            return TabItem(
              isSelected: selectedTabIndex == widget.tabNames.indexOf(tabNames),
              title: tabNames.name,
              width: 4,
              //color: AppPallete.accentBlackColor,
            );
          }).toList(),
        ),
      ),
    );
  }
}
