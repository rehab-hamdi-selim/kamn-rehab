import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(210, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Make Your Plan",
                    style: TextStyles.fontCircularSpotify12BlackMedium
                        .copyWith(color: Colors.white, fontSize: 14)),
                const Icon(Icons.add_circle_outline_outlined,
                    color: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(210, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text("Select Offer",
                style: TextStyles.fontCircularSpotify14AccentBlackMedium
                    .copyWith(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
