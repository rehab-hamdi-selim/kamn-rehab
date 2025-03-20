// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kamn/core/helpers/spacer.dart';
// import 'package:kamn/core/theme/app_pallete.dart';
// import 'package:kamn/core/theme/style.dart';
// import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
// import 'package:kamn/gym_feature/add_gym/domain/models/document_item.dart';
// import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
// import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_gym_info_section.dart';
// import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_mandatory_field.dart';
//
// class LocationVerifyScreen extends StatelessWidget {
//   LocationVerifyScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: IntrinsicHeight(
//         child: Column(
//           // spacing: 16.h,
//           children: [
//             _buildMandatoryDocumentsSection(context),
//             _buildDivider(),
//             _buildTaxRegistrationSection(context),
//             _buildNavigationButtons(context),
//           ],
//         ),
//       ),
//     );
//   }
//
//   final List<DocumentItem> mandatoryDocuments = [
//     DocumentItem(
//       title: 'Gym Operating License',
//       translation: 'رخصه تشغيل الجيم',
//       isValid: false,
//     ),
//     DocumentItem(
//       title: 'ID or Passport of Owner',
//       translation: 'صورة البطاقة الشخصية أو جواز السفر لصاحب الملكيه/الجيم',
//       fontSize: 6,
//       isValid: false,
//     ),
//     DocumentItem(
//       title: 'Ownership Contract',
//       translation: 'عقد ايجار او ملكيه المكان',
//       isValid: false,
//     ),
//   ];
//
//   Widget _buildMandatoryDocumentsSection(BuildContext context) {
//     return buildContainer(
//       alignment: CrossAxisAlignment.center,
//       horizontalPadding: 10,
//       children: [
//         Text(
//           'Mandatory Fields',
//           style: TextStyles.fontCircularSpotify16BlackMedium,
//         ),
//         Text(
//           'All mandatory documents must be clear, valid, and up-to-date.\nIncomplete or expired documents will prevent submission.',
//           style: TextStyles.fontCircularSpotify10Gray2Regular,
//         ),
//         verticalSpace(12),
//         ListView.separated(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: mandatoryDocuments.length,
//           separatorBuilder: (context, index) => verticalSpace(12),
//           itemBuilder: (context, index) {
//             final document = mandatoryDocuments[index];
//             return CustomMandatoryField(
//               title: document.title,
//               translation: document.translation,
//               fontSize: document.fontSize?.h,
//               isValid: context.watch<AddGymCubit>().state.isValid[index],
//             );
//           },
//         ),
//         verticalSpace(12),
//         CustomGymTextFormField(
//           controller: TextEditingController(),
//           label: 'Contact Number',
//           hint: 'Enter valid phone number',
//           optionalText: ' (Gym Phone)',
//         ),
//       ],
//     );
//   }
//   }
//
//   Widget _buildDivider() {
//     return Divider(
//       color: AppPallete.grayColor,
//       thickness: 0.2.h,
//       indent: 73.w,
//       endIndent: 73.w,
//     );
//   }
//
//   Widget _buildTaxRegistrationSection(BuildContext context) {
//     return buildContainer(
//       alignment: CrossAxisAlignment.center,
//       horizontalPadding: 10,
//       children: [
//         Text(
//           'Optional Fields',
//           style: TextStyles.fontCircularSpotify16BlackMedium,
//         ),
//         verticalSpace(12),
//         const CustomMandatoryField(
//           title: 'Tax Registration',
//           translation: 'البطاقة الضريبية او التسجيل الضريبي',
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNavigationButtons(BuildContext context) {
//     return Row(
//       // spacing: 12.w,
//       children: [
//         buildBackButton(context),
//         buildNextButton(context),
//       ],
//     );
//   }
//
// Widget buildBackButton(BuildContext context) {
//   return Expanded(
//     child: SizedBox(
//       height: 50.h,
//       child: OutlinedButton(
//         style: OutlinedButton.styleFrom(
//           backgroundColor: AppPallete.whiteColor,
//           foregroundColor: AppPallete.blackColor,side: const BorderSide(color: AppPallete.lightGreyColor,width: 0.3),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.r)),
//         ),
//         onPressed: () {  context.read<AddGymCubit>().goToPreviousPage();},
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.arrow_back, size: 10.h,color: AppPallete.blackColor,),
//             horizontalSpace(8),
//             const Text("Back"),
//           ],
//         ),
//       ),
//     ),
//   );
// }
