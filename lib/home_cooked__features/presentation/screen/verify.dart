// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// import 'package:kamn/home_cooked__features/data/models/home_cooked.dart';
//
// class LocationVerifyScreen extends StatefulWidget {
//   final HomeCook ?homeCooked;
//
//   LocationVerifyScreen({ this.homeCooked});
//
//   @override
//   _LocationVerifyScreenState createState() => _LocationVerifyScreenState();
// }
//
// class _LocationVerifyScreenState extends State<LocationVerifyScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _streetController = TextEditingController();
//   final TextEditingController _buildingController = TextEditingController();
//   final TextEditingController _apartmentController = TextEditingController();
//
//   final Map<String, File?> _uploadedFiles = {
//     "Electricity Bill": null,
//     "Gas Bill": null,
//     "Landline Bill": null,
//   };
//
//   bool _validate = false;
//
//   // Function to pick a file (utility bill)
//   Future<void> _pickFile(String fieldName) async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _uploadedFiles[fieldName] = File(pickedFile.path);
//       });
//     }
//   }
//
//   // Function to upload a file to Firebase Storage
//   Future<String> _uploadFileToFirebase(File file, String type) async {
//     try {
//       // Create a reference to the file in Firebase Storage
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('utility_bills/${DateTime.now().millisecondsSinceEpoch}_$type');
//
//       // Upload the file
//       TaskSnapshot snapshot = await storageRef.putFile(file);
//
//       // Get the download URL
//       return await snapshot.ref.getDownloadURL();
//     } catch (e) {
//       print('Failed to upload $type: $e');
//       throw e; // Rethrow the error for handling in the caller
//     }
//   }
//
//   // Function to upload all utility bills to Firebase Storage
//   Future<Map<String, String>> _uploadAllFiles() async {
//     Map<String, String> fileUrls = {};
//     for (var entry in _uploadedFiles.entries) {
//       if (entry.value != null) {
//         String url = await _uploadFileToFirebase(entry.value!, entry.key);
//         fileUrls[entry.key] = url;
//       }
//     }
//     return fileUrls;
//   }
//
//   // Function to save data to Firebase Realtime Database
//   Future<void> _saveDataToFirebase(Map<String, String> utilityBills) async {
//     // Update the HomeCooked object with address and utility bills
//     widget.homeCooked?.homeAddress = _streetController.text;
//     widget.homeCooked?.street = _streetController.text;
//     widget.homeCooked?.buildingNumber = _buildingController.text;
//     widget.homeCooked?.apartment = _apartmentController.text;
//     widget.homeCooked?.utilityBills = utilityBills;
//
//     // Save to Firebase Realtime Database
//     final databaseRef = FirebaseDatabase.instance.ref().child('homeCooks');
//     databaseRef.push().set(widget.homeCooked?.toMap()).then((_) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Data saved successfully')),
//       );
//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to save data: $error')),
//       );
//     });
//   }
//
//   // Function to validate and proceed
//   void _validateAndProceed() async {
//     setState(() {
//       _validate = true;
//     });
//
//     if (_formKey.currentState!.validate()) {
//       bool allMandatoryFilesUploaded = _uploadedFiles.entries.every((entry) {
//         return entry.value != null;
//       });
//
//       if (allMandatoryFilesUploaded) {
//         try {
//           // Step 1: Upload all utility bills to Firebase Storage
//           Map<String, String> utilityBills = await _uploadAllFiles();
//
//           // Step 2: Save data to Firebase Realtime Database
//           await _saveDataToFirebase(utilityBills);
//
//           // Step 3: Navigate to the next screen (if needed)
//           // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
//         } catch (e) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Error: $e')),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Please upload all required files')),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               SizedBox(height: 20),
//               _buildAddressFields(),
//               SizedBox(height: 20),
//               _buildUploadSection(),
//               SizedBox(height: 20),
//               _buildNavigationButtons(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAddressFields() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Home Address *", style: TextStyle(fontWeight: FontWeight.bold)),
//         SizedBox(height: 5),
//         _buildTextField("Street", _streetController),
//         Row(
//           children: [
//             Expanded(child: _buildTextField("Building Number", _buildingController)),
//             SizedBox(width: 10),
//             Expanded(child: _buildTextField("Apartment", _apartmentController)),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         validator: (value) => value!.isEmpty ? "Please fill this field" : null,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildUploadSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Utility Bill Upload",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//         SizedBox(height: 10),
//         ..._uploadedFiles.keys.map((label) => _buildUploadField(label)).toList(),
//         SizedBox(height: 10),
//         Text("Important Guidelines:", style: TextStyle(fontWeight: FontWeight.bold)),
//         Text("- Must be issued within the last 3 months."),
//         Text("- Clearly show your name and address matching your registration details."),
//         Text("- Files accepted: PDF, JPG, PNG (max size: 5MB)."),
//       ],
//     );
//   }
//
//   Widget _buildUploadField(String label) {
//     bool isError = _validate && _uploadedFiles[label] == null;
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () => _pickFile(label),
//             child: Container(
//               constraints: BoxConstraints(),
//               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: isError ? Colors.red : Colors.grey,
//                   style: BorderStyle.solid,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: _uploadedFiles[label] != null
//                   ? Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.file(
//                       _uploadedFiles[label]!,
//                       height: 150,
//                       width: double.infinity,
//                       fit: BoxFit.fitHeight,
//                     ),
//                   ),
//                   Positioned(
//                     top: 5,
//                     right: 5,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _uploadedFiles[label] = null;
//                         });
//                       },
//                       child: CircleAvatar(
//                         radius: 12,
//                         backgroundColor: Colors.red,
//                         child: Icon(Icons.close, color: Colors.white, size: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//                   : Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(label,
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: isError ? Colors.red : Colors.black)),
//                       Text("(Choose file)",
//                           style: TextStyle(fontSize: 12, color: Colors.grey)),
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: () => _pickFile(label),
//                     child: Text("Choose file"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (isError)
//             Padding(
//               padding: const EdgeInsets.only(top: 4.0),
//               child: Text("You must add this file",
//                   style: TextStyle(color: Colors.red, fontSize: 12)),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavigationButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Row(children: [Icon(Icons.arrow_back), Text(" Back")])),
//         ElevatedButton(
//             onPressed: _validateAndProceed,
//             child: Row(children: [Text("Next "), Icon(Icons.arrow_forward)])),
//       ],
//     );
//   }
// }
