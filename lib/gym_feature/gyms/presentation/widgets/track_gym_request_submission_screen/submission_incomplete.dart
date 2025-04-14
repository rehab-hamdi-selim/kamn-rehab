import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/add_mempership_offer_card.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/go_to_services.dart';

class SubmissionIncomplete extends StatelessWidget {
  const SubmissionIncomplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 180.h,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Add rounded corners
                image: const DecorationImage(
                  image: AssetImage('assets/images/FrameSubmit.png'),
                  fit: BoxFit.fill,
                ),
              ),
              clipBehavior:
                  Clip.hardEdge, // Ensures image follows border radius
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Ensures left alignment
                  children: [
                    Text(
                      'Your submission is incomplete',
                      textAlign: TextAlign.left,
                      style: TextStyles.fontCircularSpotify16BlackMedium
                          .copyWith(color: AppPallete.whiteColor),
                    ),
                    SizedBox(
                        height: 5.h), // Add spacing between texts if needed
                    Text(
                      'Please update the following:',
                      textAlign: TextAlign.left,
                      style: TextStyles.fontCircularSpotify12BlackMedium
                          .copyWith(color: AppPallete.lightGreyColor),
                    ),
                    SizedBox(
                        height: 5.h), // Add spacing between texts if needed
                    Text(
                      '📄 Expired Gym License (Upload a valid one)',
                      textAlign: TextAlign.left,
                      style: TextStyles.fontCircularSpotify12BlackRegular
                          .copyWith(color: AppPallete.lightWiteColor),
                    ),
                    SizedBox(
                        height: 10.h), // Add spacing between texts if needed

                    GestureDetector(
                      onDoubleTap: () {},
                      child: Container(
                        height: 40.h,
                        //padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(60), // Rounded button
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 11, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  26), // Smaller rounded box
                            ),
                            child: const Text(
                              'Update Now',
                              style: TextStyle(
                                color: Color(0xFF1F1F1F),
                                fontSize: 12,
                                fontFamily: 'Circular Spotify Tx T',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const AddMempershipOfferCard(),
        ],
      ),
      bottomNavigationBar:  GoToServices(gymId: "",),
    );
  }
}
