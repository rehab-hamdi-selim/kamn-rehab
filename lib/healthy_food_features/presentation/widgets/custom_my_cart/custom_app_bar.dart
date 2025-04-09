import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/style.dart';

class CustomCartAppBar extends StatelessWidget {
  const CustomCartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
        ),
        Text(
          'My Cart',
          style: TextStyles.fontCircularSpotify21BlackMedium,
        )
      ],
    );
  }
}
