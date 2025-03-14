abstract class AddGymRepository {
  Future<GymRequestModel> addGymRequest(GymRequestModel gymRequestModel);
  Future<Map<String, List<String>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(int) onProgress);
}

class AddGymRepositoryImpl implements AddGymRepository {
AddGymRemoteDataSource dataSource;
  AddGymRepositoryImpl({required this.dataSource}) 
  

  
}
