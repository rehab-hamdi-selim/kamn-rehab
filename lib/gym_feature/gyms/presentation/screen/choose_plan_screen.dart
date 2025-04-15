import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_feature_selection_list.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_review_selection_bottomSheet.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_selected_features_section.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_title_logo.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen({super.key});

  @override
  State<ChoosePlanScreen> createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  // final List<FeaturesModel> features = [
  //   FeaturesModel(
  //       name: "Hot Tubs",
  //       price: 120,
  //       unit: "/month",
  //       icon: "🛁",
  //       badgeColor: Colors.blue),
  //   FeaturesModel(
  //       name: "Sauna",
  //       price: 50,
  //       unit: "/session",
  //       icon: "♨️",
  //       badgeColor: Colors.orange),
  //   FeaturesModel(
  //       name: "Swimming Pool",
  //       price: 20,
  //       unit: "/session",
  //       icon: "🏊",
  //       badgeColor: Colors.cyan),
  //   FeaturesModel(
  //       name: "Juice Bar",
  //       price: 40,
  //       unit: "/month",
  //       icon: "🍹",
  //       badgeColor: Colors.purple),
  //   FeaturesModel(
  //       name: "Childcare Services",
  //       price: 60,
  //       unit: "/session",
  //       icon: "👶",
  //       badgeColor: Colors.teal),
  //   FeaturesModel(
  //       name: "State-of-the-Art Equipment",
  //       price: 120,
  //       unit: "/month",
  //       icon: "💪",
  //       badgeColor: Colors.red),
  //   FeaturesModel(
  //       name: "Yoga Classes",
  //       price: 120,
  //       unit: "/month",
  //       icon: "🧘",
  //       badgeColor: Colors.green),
  //   FeaturesModel(
  //       name: "Exclusive Events",
  //       price: 120,
  //       unit: "/month",
  //       icon: "🎉",
  //       badgeColor: Colors.amber),
  //   FeaturesModel(
  //       name: "Diverse Classes",
  //       price: 50,
  //       unit: "/session",
  //       icon: "🏋️",
  //       badgeColor: Colors.green),
  //   FeaturesModel(
  //       name: "Locker Rooms",
  //       price: 20,
  //       unit: "/month",
  //       icon: "🔒",
  //       badgeColor: Colors.blueGrey),
  //   FeaturesModel(
  //       name: "Free WiFi",
  //       price: 0,
  //       unit: "Free",
  //       icon: "🌐",
  //       badgeColor: Colors.black),
  // ];


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymDetailsCubit, GymDetailsState>(
        builder: (context, state) {
      void showReviewBottomSheet() {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
        return CustomReviewSelectionBottomSheet(
              selectedFeatures: state.selectedFeatures ?? {},
              totalPrice: context.read<GymDetailsCubit>().totalPrice,
          onEditSelection: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

      return BlocBuilder<GymDetailsCubit, GymDetailsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: const BackButton(color: Colors.black),
            ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTitleLogo(),

                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h), // Use ScreenUtil for height
                            CustomFeatureSelectionList(
                              toggleFeature:
                                  context.read<GymDetailsCubit>().toggleFeature,
                              selectedFeatures: state.selectedFeatures ?? {},
                            ),
                            SizedBox(height: 20.h), // Use ScreenUtil for height
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomSelectedFeaturesSection(
                        selectedFeatures: state.selectedFeatures ?? {},
                        increaseQuantity:
                            context.read<GymDetailsCubit>().increaseQuantity,
                        decreaseQuantity:
                            context.read<GymDetailsCubit>().decreaseQuantity,
                        totalPrice: context.read<GymDetailsCubit>().totalPrice,
                        removeFeature:
                            context.read<GymDetailsCubit>().removeFeature,
                      ),
                      SizedBox(height: 10.h), // Use ScreenUtil for height
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                // Use ScreenUtil for padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.w),
                                  // Use ScreenUtil for radius
                                  side: const BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Text(
                                "← Back",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      16.sp, // Use ScreenUtil for font size
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w), // Use ScreenUtil for width
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                showReviewBottomSheet();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                // Use ScreenUtil for padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.w), // Use ScreenUtil for radius
                                ),
                              ),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      16.sp, // Use ScreenUtil for font size
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        },
      );
    });
}
}

