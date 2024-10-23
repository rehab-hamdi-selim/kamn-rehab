import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/utils/navigation.dart';
import 'package:kamn/core/utils/show_alert.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/success_service_provider_screen.dart';

import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_finished_button.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_image_picker.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_service_info.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_text_title.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceProviderCubit(
          repository: ServiceProvidersRepositoryImpl(
              dataSource: ServiceProvidersRemoteDataSourceImpl(
                  storage: FirebaseStorage.instance,
                  firestore: FirebaseFirestore.instance))),
      child: BlocConsumer<ServiceProviderCubit, ServiceProviderState>(
        listener: (context, state) {
          if (state.successMessage == 'service added successfully') {
            hideLoading(context);
            navigationTo(context, const SuccessServiceProviderScreen());
          }
          if (state.isLoading) {
            showLoadingAlert('Loading', context);
          }
          if (state.isFailure) {
            showSnackBar(context, state.erorrMessage!);
          }
        },
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
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomeTextTitle(),
                    verticalSpace(19.h),
                    const CustomeImagePicker(),
                    verticalSpace(7.h),
                    const CustomeServiceInfo(),
                    const CustomeFinishedButton(),
                    verticalSpace(25.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
