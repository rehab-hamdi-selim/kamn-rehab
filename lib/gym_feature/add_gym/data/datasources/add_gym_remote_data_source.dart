// import 'dart:io';

// import 'package:injectable/injectable.dart';
// import 'package:kamn/gym_feature/add_gym/data/models/gym_model.dart';

// abstract class AddGymRemoteDataSource {
//   Future<void> addGymRequest(GymRequestModel gymRequestModel);
//   Future<Map<String,String>?> uploadImages(Map<String,File> images);
// }
// @Injectable(as:AddGymRemoteDataSource)
// class AddGymRemoteDataSourceImpl implements AddGymRemoteDataSource {
//   AddGymRemoteDataSourceImpl();
  

//   @override
//   Future<void> addGymRequest(GymRequestModel gymRequestModel) async {
//     try {
//       // TODO: Implement the actual API call to add gym request
//       // This could involve Firebase, REST API, or other remote service
      
//       // Example implementation structure:
//       // 1. Validate the gym request model
//       // 2. Convert model to API format if needed
//       // 3. Make the API call
//       // 4. Handle the response
//       // 5. Return success or throw appropriate error
      
//     } catch (e) {
//       throw Exception('Failed to add gym request: $e');
//     }
//   }
  
//   @override
//   Future<Map<String, String>?> uploadImages(Map<String, File> images) {
//    Map<String, String> uploadedUrls = {};

//   for (var entry in images.entries) {
//     final key = entry.key;
//     final file = entry.value;

//       final url = await uploadImageWithRetry(file, "$folder/$key.jpg");
//       if (url != null) {
//         uploadedUrls[key] = url;
//       } else {
//         throw Exception("Failed to upload image: $key");
//       }
    
//   }

//   return Future.value(uploadedUrls);
//   }
// }