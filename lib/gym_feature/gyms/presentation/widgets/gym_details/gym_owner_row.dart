import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/style.dart';

class GymOwnerRow extends StatelessWidget {
  const GymOwnerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: ExactAssetImage(
                "assets/images/owner.png",
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ahmed Senna",
                    style: TextStyles.fontCircularSpotify15MediumBlack),
                Text("@ahmedsennagold",
                    style: TextStyles.fontCircularSpotify8StealGrayRegular)
              ],
            ),
          ],
        ),
        SvgPicture.asset(
          "assets/icons/message.svg",
          width: 40,
        )
      ],
    );
  }
}
