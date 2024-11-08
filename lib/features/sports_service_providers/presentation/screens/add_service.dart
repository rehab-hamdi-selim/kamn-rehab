import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';

import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_finished_button.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_ground_image_picker.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_ownership_image_picker.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_service_info.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_text_title.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

import '../widgets/add_service/custome_add_services_bloc_listner.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomeAddServicesBlocListner(
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
              const CustomeGroundImagePicker(),
              verticalSpace(16.h),
              const CustomeOwnershipImagePicker(),
              verticalSpace(7.h),
              const CustomeServiceInfo(),
              const CustomeFinishedButton(),
              verticalSpace(25.h),
            ],
          ),
        ),
      ),
    ));
  }
}
