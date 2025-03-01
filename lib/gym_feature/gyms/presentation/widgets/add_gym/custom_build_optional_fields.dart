import 'package:flutter/material.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/add_gym/custom_build_upload_field.dart';

class CustomBuildOptionalFields extends StatelessWidget {
  const CustomBuildOptionalFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Optional Field",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Optional documents are not required but can enhance approval time.",
        ),
        const SizedBox(height: 5),
        CustomBuildUploadField("Tax Registration", isMandatory: false),
      ],
    );
  }
}
