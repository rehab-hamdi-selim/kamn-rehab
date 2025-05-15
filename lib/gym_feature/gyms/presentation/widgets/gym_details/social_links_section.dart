import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

class SocialLinksSection extends StatelessWidget {
  const SocialLinksSection({
    super.key,
    required this.gymLinksList,
  });
  final List<ScoialMediaLink> gymLinksList;

  @override
  Widget build(BuildContext context) {
    if (gymLinksList.isEmpty) {
      return Center(
        child: Text(
          'No social media links available',
          style: TextStyles.fontCircularSpotify14LightBlackRegular,
        ),
      );
    } 

    return Column(
      children: [
        ...gymLinksList.where((link) => link.name != null).map((link) {
          return Padding(
            padding:  EdgeInsets.only(bottom: 5.0.h),
            child: link.link!=null? buildSocialLink(
              icon: Icons.close,
              text: link.name!,
              color: link.name == "x"
                  ? Colors.black
                  : link.name == "facebook"
                      ? AppPallete.blueColor
                      :null,
              gradient: link.name =="instagram" ?AppPallete.instagramGradient :null
            ):const SizedBox.shrink(),
          );
        }),
        const SizedBox(height: 5),
      ],
    );
  }
  Widget buildSocialLink({
  required IconData icon,
  required String text,
  Color? color,
  LinearGradient? gradient,
}) {
  return Container(
    width: 400.w,
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      gradient: gradient ?? LinearGradient(colors: [color!, color]),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          label: Text("Join us on $text",
              style: TextStyles.fontCircularSpotify12BlackMedium.copyWith(
                  color: Colors.white, fontWeight: FontWeightHelper.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ).copyWith(
            foregroundColor: WidgetStateProperty.all(Colors.transparent),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ),
        const Icon(
          Icons.arrow_outward_sharp,
          color: Colors.white,
          size: 20,
        )
      ],
    ),
  );
}
}
