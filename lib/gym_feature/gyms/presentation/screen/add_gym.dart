import 'package:flutter/material.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/add_gym/custom_build_mandatory_fields.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/add_gym/custom_build_upload_field.dart';

import '../widgets/add_gym/custom_build_optional_fields.dart';
import '../widgets/add_gym/custom_build_tab_bar.dart';

class AddGymScreen extends StatefulWidget {
  const AddGymScreen({super.key});

  @override
  _AddGymScreenState createState() => _AddGymScreenState();
}

class _AddGymScreenState extends State<AddGymScreen> {
  final GlobalKey<CustomBuildUploadFieldState> _gymLicenseKey = GlobalKey();
  final GlobalKey<CustomBuildUploadFieldState> _ownerIDKey = GlobalKey();
  final GlobalKey<CustomBuildUploadFieldState> _ownershipKey = GlobalKey();
  final GlobalKey<CustomBuildUploadFieldState> _taxKey = GlobalKey();

  void validateAndProceed() {
    bool isValid = _gymLicenseKey.currentState!.isValid() &&
        _ownerIDKey.currentState!.isValid() &&
        _ownershipKey.currentState!.isValid() &&
        _taxKey.currentState!.isValid();

    if (isValid) {
      // Proceed to next screen
    } else {
      setState(() {}); // Trigger rebuild to show errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
        title: const Text("Add Gym"),
        actions: const [
          CircleAvatar(backgroundImage: AssetImage("assets/profile.png")),
          SizedBox(width: 10),
          Icon(Icons.notifications),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Basic Gym Information",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const CustomBuildTabBar(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  CustomBuildMandatoryFields(),
                  const SizedBox(height: 20),
                  CustomBuildUploadField("Gym Operating License",
                      key: _gymLicenseKey),
                  CustomBuildUploadField("ID or Passport of Owner",
                      key: _ownerIDKey),
                  CustomBuildUploadField("Ownership Contract",
                      key: _ownershipKey),
                  CustomBuildUploadField("Tax Registration", key: _taxKey),
                  const SizedBox(height: 20),
                  CustomBuildOptionalFields(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 5),
                      Text("Back"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: validateAndProceed,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text("Next"),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
