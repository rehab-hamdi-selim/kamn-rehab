import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/edit_service/custome_edit_services_bloc_listner.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/edit_service/custome_finished_button.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/edit_service/custome_ground_image_picker.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/edit_service/custome_text_title.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

class EditServiceScreen extends StatelessWidget {
  final PlaygroundRequestModel playground;
  const EditServiceScreen({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    return CustomeEditServicesBlocListner(
        playground: playground,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBarServiceProvider.appBar(
            arrowFunction: () {},
            notificationIconFunction: () {},
            profileFunction: () {},
            badgesIconFunction: () {},
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CustomeTextTitle(),
                  verticalSpace(19.h),
                  CustomeGroundImagePicker(
                      groundImages: playground.groundImages!),
                  verticalSpace(7.h),

                  CustomeFinishedButton(
                    playground: playground,
                  ),
                  verticalSpace(25.h),
                ],
              ),
            ),
          ),
        ));
  }
}
