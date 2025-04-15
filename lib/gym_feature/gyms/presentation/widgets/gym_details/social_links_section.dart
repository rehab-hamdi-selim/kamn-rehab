import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_details_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/build_social_links.dart';

class SocialLinksSection extends StatelessWidget {
  const SocialLinksSection({
    super.key,
    required this.gymLinksList,
  });
  final List<ScoialMediaLink> gymLinksList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(gymLinksList.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: buildSocialLink(
              icon: Icons.close,
              text: gymLinksList[index].name ?? "",
              color: gymLinksList[index].name == "x"
                  ? Colors.black
                  : gymLinksList[index].name == "facebook"
                      ? AppPallete.blueColor
                      : Colors.pink,
            ),
          );
        }),
        const SizedBox(height: 5),
      ],
    );
  }
}
