import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/build_social_links.dart';

class SocialLinksSection extends StatelessWidget {
  const SocialLinksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSocialLink(
          icon: Icons.close,
          text: "JOIN US ON X",
          color: Colors.black,
        ),
        const SizedBox(height: 5),
        buildSocialLink(
            icon: Icons.facebook,
            text: "JOIN US ON FACEBOOK",
            color: AppPallete.blueColor),
        const SizedBox(height: 5),
        buildSocialLink(
          icon: Icons.camera_alt,
          text: "JOIN US ON INSTAGRAM",
          gradient: const LinearGradient(
            colors: [
              AppPallete.yellowColor,
              AppPallete.pureRedColor,
              Colors.pink,
            ],
          ),
        ),
      ],
    );
  }
}
