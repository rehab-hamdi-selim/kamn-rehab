import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 30,
      decoration: BoxDecoration(
          color: AppPallete.shadeOfGray,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 10,
          ),
          Text(
            "Alexendria, San Stefano",
            style: TextStyles.fontCircularSpotify8AccentBlackRegular,
          ),
        ],
      ),
    );
  }
}
