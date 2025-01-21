import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_bottom_book.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_ground_details_bloc_listner.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_image_slide_show.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_play_ground_info.dart';

class ServiceProviderGroundDetailsScreen extends StatelessWidget {
  const ServiceProviderGroundDetailsScreen(
      {super.key, required this.playgroundModel});
  final PlaygroundRequestModel playgroundModel;

  @override
  Widget build(BuildContext context) {
    return CustomeGroundDetailsBlocListner(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 346.h,
                // Image height
                child: CustomeImageSlideShow(imagesPath: playgroundModel.groundImages??[],)),
            Positioned(
              bottom: 0,
              // Start from the bottom
              left: 0,
              right: 0,
              height: 500.h,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    Expanded(
                      child: CustomePlayGroundInfo(
                        playgroundModel: playgroundModel,
                      ),
                    ),
                    CustomeBottomBook(
                      playgroundRequestModel: playgroundModel,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
