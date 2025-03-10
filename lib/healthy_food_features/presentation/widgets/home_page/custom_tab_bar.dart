import 'package:flutter/material.dart';
import 'package:kamn/healthy_food_features/data/models/category_data.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/tab_item.dart';

class CustomTabBar extends StatefulWidget {
  final List<Category> categories;

  const CustomTabBar({super.key, required this.categories});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
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
        tabs: widget.categories.map(
          (category) {
            return TabItem(
              title: category.name,
              isSelected:
                  selectedTabIndex == widget.categories.indexOf(category),
              img: category.icon,
              width: category.name == "All" ? 0 : 8,
            );
          },
        ).toList(),
      ),
    );
  }
}
