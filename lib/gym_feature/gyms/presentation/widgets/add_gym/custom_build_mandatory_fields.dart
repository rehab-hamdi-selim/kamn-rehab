import 'package:flutter/material.dart';

import 'custom_build_upload_field.dart';

class CustomBuildMandatoryFields extends StatelessWidget {
  const CustomBuildMandatoryFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Mandatory Fields",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
            "All mandatory documents must be clear, valid, and up-to-date."),
        const SizedBox(height: 10),
        CustomBuildUploadField("Gym Operating License"),
        CustomBuildUploadField("ID or Passport of Owner"),
        CustomBuildUploadField("Ownership Contract"),
      ],
    );
  }
}
