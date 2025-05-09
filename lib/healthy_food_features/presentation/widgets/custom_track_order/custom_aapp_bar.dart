import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/style.dart';

class CustomAppBarTrackOrder extends StatelessWidget {
  CustomAppBarTrackOrder(
      {super.key, required this.onTap, required this.screenName});

  String screenName;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTap,
          icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
        ),
        Text(
          screenName,
          style: TextStyles.fontCircularSpotify21BlackMedium,
        )
      ],
    );
  }
}
