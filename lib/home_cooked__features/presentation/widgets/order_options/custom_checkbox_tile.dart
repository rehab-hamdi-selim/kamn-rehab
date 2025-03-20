import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_check_box.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_tittle_text.dart';

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final void Function(bool?)? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //SvgPicture.asset("assetName"),
            customTittleText(
              title: title,
            ),

            Text(
              subtitle,
              overflow: TextOverflow.clip,
              maxLines: 2,
              style: TextStyles.fontCircularSpotify8AccentBlackRegular,
            ),
          ]),
        ),
        CustomCheckBox(
          onTap: onTap,
        )
      ],
    );
  }
}
