// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';
// import 'package:flutter/foundation.dart';
//
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
//
//
// class FirebaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   // Upload Image to Firebase Storage
//   Future<String> uploadImage(File file, String folder) async {
//     try {
//       String fileName = basename(file.path);
//       Reference ref = _storage.ref().child('$folder/$fileName');
//       UploadTask uploadTask = ref.putFile(file);
//       TaskSnapshot snapshot = await uploadTask;
//       return await snapshot.ref.getDownloadURL();
//     } catch (e) {
//       debugPrint("Error uploading image: $e");
//       return "";
//     }
//   }
//
//   // Upload Home Cook Data to Firestore
//   Future<void> uploadHomeCookData({
//     required HomeCooked homeCook,
//     required File profileImage,
//     required File electricityBill,
//     required File gasBill,
//     required File landlineBill,
//   }) async {
//     try {
//       // Upload Images to Firebase Storage
//       String profileImageUrl = await uploadImage(profileImage, "profile_pictures");
//       String electricityBillUrl = await uploadImage(electricityBill, "utility_bills");
//       String gasBillUrl = await uploadImage(gasBill, "utility_bills");
//       String landlineBillUrl = await uploadImage(landlineBill, "utility_bills");
//
//       // Update HomeCooked object with image URLs
//       homeCook.profilePictureUrl = profileImageUrl;
//       homeCook.utilityBills = {
//         "electricityBill": electricityBillUrl,
//         "gasBill": gasBillUrl,
//         "landlineBill": landlineBillUrl,
//       };
//
//       // Save to Firestore
//       await _firestore.collection("home_cooks").add(homeCook.toMap());
//
//       debugPrint("✅ Home Cook Data Uploaded Successfully!");
//     } catch (e) {
//       debugPrint("❌ Error uploading data: $e");
//     }
//   }
// }
// ///////////////////
//
//
//
//
// class PersonalInfoScreen extends StatefulWidget {
//   @override
//   _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
// }
//
// class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController instagramController = TextEditingController();
//   final TextEditingController facebookController = TextEditingController();
//   final TextEditingController twitterController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Personal Info")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Full Name *"),
//               TextField(controller: fullNameController),
//
//               SizedBox(height: 12),
//               Text("Email *"),
//               TextField(controller: emailController, keyboardType: TextInputType.emailAddress),
//
//               SizedBox(height: 12),
//               Text("Phone *"),
//               TextField(controller: phoneController, keyboardType: TextInputType.phone),
//
//               SizedBox(height: 12),
//               Text("Description"),
//               TextField(controller: descriptionController, maxLines: 3),
//
//               SizedBox(height: 12),
//               Text("Social Media"),
//               TextField(controller: instagramController, decoration: InputDecoration(labelText: "Instagram")),
//               TextField(controller: facebookController, decoration: InputDecoration(labelText: "Facebook")),
//               TextField(controller: twitterController, decoration: InputDecoration(labelText: "Twitter")),
//
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to the second screen with all the collected data
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LocationVerifyScreen(
//                         fullName: fullNameController.text,
//                         email: emailController.text,
//                         phone: phoneController.text,
//                         description: descriptionController.text,
//                         instagram: instagramController.text,
//                         facebook: facebookController.text,
//                         twitter: twitterController.text,
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text("Next →"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /////////////////////
//
//
//
// class LocationVerifyScreen extends StatefulWidget {
//   final String fullName, email, phone, description, instagram, facebook, twitter;
//
//   LocationVerifyScreen({
//     required this.fullName,
//     required this.email,
//     required this.phone,
//     required this.description,
//     required this.instagram,
//     required this.facebook,
//     required this.twitter,
//   });
//
//   @override
//   _LocationVerifyScreenState createState() => _LocationVerifyScreenState();
// }
//
// class _LocationVerifyScreenState extends State<LocationVerifyScreen> {
//   // Address Fields
//   final TextEditingController homeAddressController = TextEditingController();
//   final TextEditingController streetController = TextEditingController();
//   final TextEditingController buildingController = TextEditingController();
//   final TextEditingController apartmentController = TextEditingController();
//
//   // Image Files
//   File? electricityBill;
//   File? gasBill;
//   File? landlineBill;
//
//   bool isUploading = false;
//
//   // Pick Image from Gallery
//   Future<void> pickImage(String type) async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         if (type == 'electricity') {
//           electricityBill = File(pickedFile.path);
//         } else if (type == 'gas') {
//           gasBill = File(pickedFile.path);
//         } else if (type == 'landline') {
//           landlineBill = File(pickedFile.path);
//         }
//       });
//     }
//   }
//
//   // Upload Image to Firebase Storage
//   Future<String?> uploadImage(File imageFile, String fileName) async {
//     try {
//       Reference storageRef = FirebaseStorage.instance.ref().child('utility_bills/$fileName');
//       UploadTask uploadTask = storageRef.putFile(imageFile);
//       TaskSnapshot snapshot = await uploadTask;
//       return await snapshot.ref.getDownloadURL();
//     } catch (e) {
//       print("Upload failed: $e");
//       return null;
//     }
//   }
//
//   // Submit Data to Firebase
//   Future<void> submitData() async {
//     if (homeAddressController.text.isEmpty ||
//         streetController.text.isEmpty ||
//         buildingController.text.isEmpty ||
//         apartmentController.text.isEmpty ||
//         electricityBill == null ||
//         gasBill == null ||
//         landlineBill == null) {
//       ScaffoldMessenger.of(context as BuildContext).showSnackBar(
//         SnackBar(content: Text("Please fill all fields and upload all images")),
//       );
//       return;
//     }
//
//     setState(() {
//       isUploading = true;
//     });
//
//     // Upload images
//     String? electricityUrl = await uploadImage(electricityBill!, "electricity_bill.jpg");
//     String? gasUrl = await uploadImage(gasBill!, "gas_bill.jpg");
//     String? landlineUrl = await uploadImage(landlineBill!, "landline_bill.jpg");
//
//     if (electricityUrl != null && gasUrl != null && landlineUrl != null) {
//       await FirebaseFirestore.instance.collection('homeCooks').add({
//         'fullName': widget.fullName,
//         'email': widget.email,
//         'phone': widget.phone,
//         'description': widget.description,
//         'instagram': widget.instagram,
//         'facebook': widget.facebook,
//         'twitter': widget.twitter,
//         'homeAddress': homeAddressController.text,
//         'street': streetController.text,
//         'buildingNumber': buildingController.text,
//         'apartment': apartmentController.text,
//         'electricityBill': electricityUrl,
//         'gasBill': gasUrl,
//         'landlineBill': landlineUrl,
//         'createdAt': DateTime.now(),
//         'serviceProviderId': "gfdf45121gdf8577"
//       });
//
//       ScaffoldMessenger.of(context as BuildContext).showSnackBar(
//         SnackBar(content: Text("Data uploaded successfully!")),
//       );
//
//       setState(() {
//         isUploading = false;
//       });
//     } else {
//       ScaffoldMessenger.of(context as BuildContext).showSnackBar(
//         SnackBar(content: Text("Failed to upload some images")),
//       );
//       setState(() {
//         isUploading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Location Verify")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text("Home Address *"),
//             TextField(controller: homeAddressController),
//             Text("Street *"),
//             TextField(controller: streetController),
//             Text("Building Number *"),
//             TextField(controller: buildingController),
//             Text("Apartment *"),
//             TextField(controller: apartmentController),
//
//             buildImagePickerSection("Electricity Bill", electricityBill, () {
//               pickImage('electricity');
//             }),
//             buildImagePickerSection("Gas Bill", gasBill, () {
//               pickImage('gas');
//             }),
//             buildImagePickerSection("Landline Bill", landlineBill, () {
//               pickImage('landline');
//             }),
//
//             ElevatedButton(onPressed: submitData, child: Text("Submit")),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildImagePickerSection(String label, File? imageFile, VoidCallback onPick) {
//     return Column(
//       children: [
//         Text(label),
//         ElevatedButton(onPressed: onPick, child: Text("Choose File")),
//       ],
//     );
//   }
// }
//
// /////////////////////
// class SocialMedia {
//   String instagram;
//   String facebook;
//   String x;
//
//   SocialMedia({
//     required this.instagram,
//     required this.facebook,
//     required this.x,
//   });
//
//   // Convert to Map for Firebase
//   Map<String, dynamic> toMap() {
//     return {
//       'instagram': instagram,
//       'facebook': facebook,
//       'x': x,
//     };
//   }
//
//   // Create object from Firebase snapshot
//   factory SocialMedia.fromMap(Map<String, dynamic> map) {
//     return SocialMedia(
//       instagram: map['instagram'] ?? '',
//       facebook: map['facebook'] ?? '',
//       x: map['x'] ?? '',
//     );
//   }
// }
//
// class HomeCooked {
//   String id;
//   String fullName;
//   String email;
//   String phone;
//   String profilePictureUrl;
//   String description;
//   SocialMedia socialMedia; // Use the SocialMedia class
//   String homeAddress;
//   String street;
//   String buildingNumber;
//   String apartment;
//   Map<String, String> utilityBills;
//   String status;
//   DateTime createdAt;
//   String serviceProviderId;
//
//   HomeCooked({
//     this.id = '',
//     required this.fullName,
//     required this.email,
//     required this.phone,
//     required this.profilePictureUrl,
//     required this.description,
//     required this.socialMedia, // Add this field
//     required this.homeAddress,
//     required this.street,
//     required this.buildingNumber,
//     required this.apartment,
//     required this.utilityBills,
//     this.status = 'pending',
//     DateTime? createdAt,
//     required this.serviceProviderId,
//   }) : createdAt = createdAt ?? DateTime.now();
//
//   // Convert to Map for Firebase
//   Map<String, dynamic> toMap() {
//     return {
//       'fullName': fullName,
//       'email': email,
//       'phone': phone,
//       'profilePictureUrl': profilePictureUrl,
//       'description': description,
//       'socialMedia': socialMedia.toMap(), // Convert SocialMedia to Map
//       'homeAddress': homeAddress,
//       'street': street,
//       'buildingNumber': buildingNumber,
//       'apartment': apartment,
//       'utilityBills': utilityBills,
//       'status': status,
//       'createdAt': createdAt.toIso8601String(),
//       'serviceProviderId': serviceProviderId,
//     };
//   }
//
//   // Create object from Firebase snapshot
//   factory HomeCooked.fromMap(String id, Map<String, dynamic> map) {
//     return HomeCooked(
//       id: id,
//       fullName: map['fullName'] ?? '',
//       email: map['email'] ?? '',
//       phone: map['phone'] ?? '',
//       profilePictureUrl: map['profilePictureUrl'] ?? '',
//       description: map['description'] ?? '',
//       socialMedia: SocialMedia.fromMap(map['socialMedia'] ?? {}), // Convert Map to SocialMedia
//       homeAddress: map['homeAddress'] ?? '',
//       street: map['street'] ?? '',
//       buildingNumber: map['buildingNumber'] ?? '',
//       apartment: map['apartment'] ?? '',
//       utilityBills: Map<String, String>.from(map['utilityBills'] ?? {}),
//       status: map['status'] ?? 'pending',
//       createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
//       serviceProviderId: map['serviceProviderId'] ?? '',
//     );
//   }
// }
