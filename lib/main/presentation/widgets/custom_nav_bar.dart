import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppPallete.darkBlackColor,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem("assets/icons/Homme.svg", 'Home', 0),
          _buildNavItem("assets/icons/search.svg", 'Search', 1),
          _buildNavItem("assets/icons/Calendar2.svg", 'Bookings', 2),
          _buildNavItem("assets/icons/profile2.svg", 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    final isActive = widget.currentIndex == index;
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: isActive ? AppPallete.vividViolet : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 5,
              children: [
                SvgPicture.asset(
                  icon,
                  color: isActive ? Colors.white : AppPallete.lgGreyColor,
                  height: 25,
                  width: index == 3 ? 40 : 25,
                  fit: BoxFit.cover,
                ),
                isActive
                    ? Text(
                        label,
                        style: TextStyles.fontCircularSpotify12WhiteExtr2aBold,
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
