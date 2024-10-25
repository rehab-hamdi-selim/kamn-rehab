import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';

import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_finished_button.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_image_picker.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_service_info.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_text_title.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

import '../widgets/add_service/custome_add_services_bloc_listner.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomeAddServicesBlocListner(
        child: BlocBuilder<ServiceProviderCubit, ServiceProviderState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBarServiceProvider.appBar(
            arrowFunction: () {},
            notificationIconFunction: () {},
            profileFunction: () {},
            badgesIconFunction: () {},
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppPallete.mainColor,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomeTextTitle(),
                        verticalSpace(19.h),
                        CustomeImagePicker(
                          selectedImages: state.imagesList ?? [],
                          onRemoveImage: (image) {
                            context
                                .read<ServiceProviderCubit>()
                                .removeImageFromList(image);
                          },
                          onAddImage: () {
                            context
                                .read<ServiceProviderCubit>()
                                .getPhotoFromGallery();
                          },
                        ),
                        verticalSpace(7.h),
                        CustomeServiceInfo(
                          isLoading: state.isLocationLoading,
                        ),
                        const CustomeFinishedButton(),
                        verticalSpace(25.h),
                      ],
                    ),
                  ),
                ),
        );
      },
    ));
  }
}
