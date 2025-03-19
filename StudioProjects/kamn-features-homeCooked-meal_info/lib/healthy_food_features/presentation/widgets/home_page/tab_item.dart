import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.isSelected,
    required this.title,
    this.img,
    required this.width,
    required this.color,
  });

  final bool isSelected;
  final String title;
  final String? img;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: isSelected ? color : Colors.transparent,
        border: Border.all(
          width: 2,
          color: const Color(
            0XFFF8F8F8,
          ),
        ),
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (img != null) SvgPicture.asset(img!),
          SizedBox(
            width: width,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'CircularSpotifyTxT',
              color:
                  isSelected ? const Color(0XFFFEFEFE) : AppPallete.darkBlack,
            ),
          ),
        ],
      ),
    );
  }
}
