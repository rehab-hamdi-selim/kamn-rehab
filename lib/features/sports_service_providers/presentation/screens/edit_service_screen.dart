import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/edit_service/custome_edit_services_bloc_listner.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/edit_service/custome_finished_button.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/edit_service/custome_ground_image_picker.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/edit_service/custome_service_info.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/edit_service/custome_text_title.dart';

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
          appBar: CustomAppBar.appBar(
            context:context ,
            color: AppPallete.whiteColor,
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
                  CustomeServiceInfo(playground: playground),
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