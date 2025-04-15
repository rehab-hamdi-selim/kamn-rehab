import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_details_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/buttons_row.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/features_section.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/gym_owner_row.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/image_stack.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/location_container.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/logo_row.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/open_in_container.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/price_container.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/rating_row.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/read_more_text.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/social_links_section.dart';

class GymDetailsScreen extends StatelessWidget {
  const GymDetailsScreen(
      {super.key,
      required this.imgs,
      required this.logo,
      required this.location,
      required this.id,
      required this.gymName,
      required this.gymDescription,
      required this.gymLinksList});
  final List<String> imgs;
  final String logo, location, id, gymName, gymDescription;
  final List<ScoialMediaLink> gymLinksList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageStack(imgList: imgs),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 3,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LogoRow(
                      logo: logo,
                      gymName: gymName,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LocationContainer(
                              location: location,
                            ),
                            const SizedBox(height: 8),
                            const RatingRow(),
                          ],
                        ),
                        const Spacer(),
                        const PriceContainer(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ReadMoreText(
                      gymDescription: gymDescription,
                    ),
                    const SizedBox(height: 16),
                  FeaturesSection(
                      gymId: id,
                    ),
                    const OpenInContainer(),
                    const SizedBox(height: 8),
                    Text("Gym Links",
                        style:
                            TextStyles.fontCircularSpotify20AccentBlackMedium),
                    const SizedBox(height: 8),
                    SocialLinksSection(
                      gymLinksList: gymLinksList,
                    ),
                    const SizedBox(height: 16),
                    Text("Gym Owner",
                        style:
                            TextStyles.fontCircularSpotify20AccentBlackMedium),
                    const SizedBox(height: 8),
                    const GymOwnerRow(),
                    const SizedBox(height: 16),
                    const ButtonsRow(),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
