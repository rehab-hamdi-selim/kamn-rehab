// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/helpers/validators.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/utils/alert_dialog_utils.dart';
import 'package:kamn/home_cooked__features/data/models/delivery_model.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/order_options/order_options_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/order_options/order_options_state.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_Container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_button.dart';

import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_checkbox_tile.dart';

import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_navbar.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_screen_header.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_textfield.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_tittle_text.dart';

class OrderOptionsHomecook extends StatelessWidget {
  OrderOptionsHomecook({super.key});
  HomeCookModel currentHomeCookModel = HomeCookModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppPallete.whiteColor,
        body: BlocListener<OrderOptionsCubit, OrderOptionsState>(
          listener: (context, state) {
            if (state.isLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
              );
            } else if (state.isSuccess) {
              Navigator.of(context).pop(); // Close the loading dialog
              AlertDialogUtils.showAlert(
                context: context,
                content: "Delivery option added successfully!",
                title: "Success",
              );
              // addoptiondialog(
              //     context, "Success", "Delivery option added successfully!");
            } else if (state.isError) {
              Navigator.of(context).pop();
              AlertDialogUtils.showAlert(
                context: context,
                content: state.error ?? "Error",
                title: "Error",
                firstbutton: "OK",
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.only(right: 12.w, left: 13.w, top: 30.h),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomScreenHeader(
                      title: "Add Home Cook Data",
                      subTitle: "Set Up Your Home Cook Profile",
                    ),
                    const CustomNavBarOrderOptions(),
                    verticalSpace(10),
//image
                    Container(
                      height: 163.h,
                      width: 336.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                ImageLinks.backgroundstyle,
                              ))),
                    ),
                    verticalSpace(10),
                    Center(
                      child: CustomContainer(
                        width: 335.w,
                        content: Form(
                            key: context
                                .read<OrderOptionsCubit>()
                                .deliveryformKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const customTittleText(
                                  title: Constants.pickupor,
                                ),
                                Text(
                                  Constants.howgetmeals,
                                  style: TextStyles.circularSpotify8Grey,
                                ),
                                //togglePickup
                                CustomCheckBoxTile(
                                  onTap: (val) {
                                    context
                                        .read<OrderOptionsCubit>()
                                        .togglePickupOption(val ?? false);
                                  },
                                  title: Constants.pickup,
                                  subtitle: Constants.letCollectHomeAddress,
                                ),
                                divider(95, 95, thick: 6.sp),
                                //toggleDelivery

                                CustomCheckBoxTile(
                                  onTap: (val) {
                                    context
                                        .read<OrderOptionsCubit>()
                                        .toggleDeliveryOption(val ?? false);
                                  },
                                  title: Constants.delivery,
                                  subtitle: Constants.offerToDeliverMeals,
                                ),
                                const customTittleText(
                                  title: Constants.deliveryFee,
                                ),
                                BlocBuilder<OrderOptionsCubit,
                                        OrderOptionsState>(
                                    builder: (context, state) {
                                  return CustomCookTextFormFeld(
                                    enabled: state.isDeliverySelected,
                                    controller: context
                                        .read<OrderOptionsCubit>()
                                        .deliveryFeeController,
                                    validator: numbersValidator,
                                    keyboardType: TextInputType.number,
                                    suffixIcon: Text(
                                      Constants.eGP,
                                      style: TextStyles
                                          .fontCircularSpotify12GrayRegular,
                                    ),
                                  );
                                }),
                                Text(
                                  "If you offer delivery, set a fee in EGP — or leave it free!",
                                  style: TextStyles
                                      .fontCircularSpotify10StealGrayMedium,
                                )
                              ],
                            )),
                      ),
                    ),

                    //buttons
                    verticalSpace(30),
                    CustomBusttons(
                      cubit: context.read<OrderOptionsCubit>(),
                      currentHomeCookModel: currentHomeCookModel,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  // Future<dynamic> addoptiondialog(
  //     BuildContext context, String title, String content) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(title),
  //       content: Text(content),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           child: const Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class CustomBusttons extends StatelessWidget {
  const CustomBusttons({
    super.key,
    required this.cubit,
    required this.currentHomeCookModel,
  });
  final OrderOptionsCubit cubit;
  final HomeCookModel currentHomeCookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          onTap: () {},
          backcolor: AppPallete.ofWhiteColor,
          content: [
            const Icon(
              Icons.arrow_back_rounded,
            ),
            Text(
              Constants.back,
              style: TextStyles.fontCircularSpotify16BlackRegular,
            ),
          ],
        ),
        horizontalSpace(10),
        CustomButton(
            onTap: () {
              // var cubit = context.read<OrderOptionsCubit>();
              if (cubit.state.isDeliverySelected ||
                  cubit.state.isPickupSelected) {
                if (cubit.state.isDeliverySelected) {
                  //delivery
                  if (cubit.deliveryformKey.currentState!.validate()) {
                    cubit.uploadDeliveryOption(
                      currentHomeCookModel.copyWith(
                        delivery: DeliveryModel(
                            isDelivery: cubit.state.isDeliverySelected,
                            isPickup: cubit.state.isPickupSelected,
                            deliveryFee: double.tryParse(
                                cubit.deliveryFeeController!.text)),
                      ),
                    );
                  }
                } else {
                  //bickup
                  cubit.uploadDeliveryOption(
                    currentHomeCookModel.copyWith(
                      delivery: DeliveryModel(
                        isDelivery: cubit.state.isDeliverySelected,
                        isPickup: cubit.state.isPickupSelected,
                      ),
                    ),
                  );
                }
              } else {
                // alert if checkbox is not selected
                AlertDialogUtils.showAlert(
                    context: context,
                    title: "Error",
                    content: "Please select one option at least!");
              }
            },
            backcolor: AppPallete.blackColor,
            content: [
              Text(
                Constants.next,
                style: TextStyles.fontCircularSpotify16LightRegular,
              ),
              const Icon(
                Icons.arrow_forward,
                color: AppPallete.ofWhiteColor,
              ),
            ])
      ],
    );
  }
}

// String? deliveryfeeValidator(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter valid fee';
//   }

//   return null; // Validation passed
// }
