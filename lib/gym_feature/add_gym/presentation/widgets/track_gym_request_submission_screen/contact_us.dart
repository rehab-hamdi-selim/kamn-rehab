import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 335,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: ShapeDecoration(
            color: AppPallete.ofWhiteColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.40, color: Color(0xFFBBBBBB)),
              borderRadius: BorderRadius.circular(13),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 16,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 2,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text('Contact Support',
                        textAlign: TextAlign.center,
                        style: TextStyles.fontCircularSpotify16BlackMedium
                            .copyWith(color: AppPallete.accentBlackColor)),
                    Text('Have questions?',
                        textAlign: TextAlign.center,
                        style: TextStyles.fontCircularSpotify12BlackMedium
                            .copyWith(color: AppPallete.darkGreyColor)),
                    SizedBox(
                      width: 295,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Contact us at ',
                                style: TextStyles
                                    .fontCircularSpotify12BlackMedium
                                    .copyWith(
                                  color: AppPallete.accentBlackColor,
                                )),
                            TextSpan(
                                text: 'support@kamn.com',
                                style: TextStyles
                                    .fontCircularSpotify12BlackMedium
                                    .copyWith(
                                  color: AppPallete.vividVioletColor,
                                )),
                            TextSpan(
                                text: ' or call ',
                                style: TextStyles
                                    .fontCircularSpotify12BlackMedium
                                    .copyWith(
                                  color: AppPallete.accentBlackColor,
                                )),
                            TextSpan(
                                text: '+20 XXX XXX XXXX.',
                                style: TextStyles
                                    .fontCircularSpotify12BlackMedium
                                    .copyWith(
                                  color: AppPallete.vividViolet,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
