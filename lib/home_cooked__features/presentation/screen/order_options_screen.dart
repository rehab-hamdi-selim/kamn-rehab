// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_Container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_button.dart';

import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_checkbox_tile.dart';

import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_navbar.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_screen_header.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_textfield.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/order_options/custom_tittle_text.dart';

class OrderOptionsHomecook extends StatelessWidget {
  OrderOptionsHomecook({super.key});
  TextEditingController? deliveryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      body: Padding(
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

                Container(
                  height: 163.h,
                  width: 336.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            ImageLinks.backgroundstyle,
                          ))),
                  //child:
                  //  const Column(
                  //   children: [
                  //     Text("Pending Verification"),
                  //     Text(
                  //         "Your personal information and utility bill are under review."),
                  //     Text(
                  //       '• Once verified, your meals will be visible to customers.\n'
                  //       '• Approval usually takes 1-2 business days.\n'
                  //       '• Double-check your uploaded utility bill is clear and matches your home address.',
                  //       style: TextStyle(fontSize: 16),
                  //     ),
                  //   ],
                  // ),
                ),
                verticalSpace(10),
                Center(
                  child: CustomContainer(
                    width: 335.w,
                    content: Form(
                      key: formKey,
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
                          // CustomCheckbox(
                          //     title: Constants.pickup,
                          //     subtitle: Constants.LetCollectHomeAddress,
                          //     isChecked: true,
                          //     onChanged: (val) {}), //pickuphome

                          // CustomCheckbox(
                          //     title: Constants.delivery,
                          //     subtitle: Constants.offer_to_deliver_meals,
                          //     isChecked: true,
                          //     onChanged: (val) {}),
                          //delivery
                          CustomCheckBoxTile(
                            onTap: (val) {},
                            title: Constants.pickup,
                            subtitle: Constants.letCollectHomeAddress,
                          ),

                          divider(95, 95, thick: 6.sp),

                          CustomCheckBoxTile(
                            onTap: (val) {},
                            title: Constants.delivery,
                            subtitle: Constants.offerToDeliverMeals,
                          ),

                          const customTittleText(
                            title: Constants.deliveryFee,
                          ),
                          CustomCookTextFormFeld(
                            controller: deliveryController,
                            validator: deliveryfeeValidator,
                            keyboardType: TextInputType.number,
                            suffixIcon: Text(
                              Constants.eGP,
                              style:
                                  TextStyles.fontCircularSpotify12GrayRegular,
                            ),
                          ),
                          Text(
                            "If you offer delivery, set a fee in EGP — or leave it free!",
                            style:
                                TextStyles.fontCircularSpotify10StealGrayMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //buttons
                verticalSpace(30),
                Row(
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
                        onTap: () {},
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? deliveryfeeValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter valid fee';
  }

  return null; // Validation passed
}
