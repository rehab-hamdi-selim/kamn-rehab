import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/widget/view_full_image.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/playground_feature/sports/data/models/playground_model.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/ground_details/custom_play_ground_title_and_location.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/ground_details/custome_play_ground_info.dart';
import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_bottom_book.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_ground_details_bloc_listner.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_image_slide_show.dart';

class ServiceProviderGroundDetailsScreen extends StatelessWidget {
  const ServiceProviderGroundDetailsScreen(
      {super.key, required this.playgroundModel});
  final PlaygroundRequestModel playgroundModel;

  @override
  Widget build(BuildContext context) {
    return CustomeGroundDetailsBlocListner(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomeImageSlideShow(
                imagesPath: playgroundModel.groundImages ?? [],
              ),
              verticalSpace(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.h),
                child: Column(            crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Text(
                      "PlayGround Ownership Paper",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    verticalSpace(10.h),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: playgroundModel.ownershipImages?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewFullImage(
                                    imageUrl: playgroundModel
                                            .ownershipImages?[index] ??
                                        '',
                                  ),
                                ));
                          },
                          child: Hero(
                            tag: playgroundModel.ownershipImages?[index] ?? '',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      playgroundModel.ownershipImages?[index] ??
                                          ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    verticalSpace(10.h),
                    CustomPlayGroundTitleAndLocation(
                        playgroundModel:
                            PlaygroundModel.fromMap(playgroundModel.toMap())),
                    verticalSpace(10.h),
                    CustomePlayGroundInfo(
                      description:
                          PlaygroundModel.fromMap(playgroundModel.toMap()).description??'empty description',
                    ),
                    verticalSpace(10.h),
                  ],
                ),
              ),
              CustomeBottomBook(
                playgroundRequestModel: playgroundModel,
              ),
              // Container(
              //   decoration: const BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(30),
              //         topRight: Radius.circular(30),
              //       )),
              //   child: Column(
              //     children: [
              //       CustomePlayGroundInfo(
              //         playgroundModel: playgroundModel,
              //       ),
              //       CustomeBottomBook(
              //         playgroundRequestModel: playgroundModel,
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
