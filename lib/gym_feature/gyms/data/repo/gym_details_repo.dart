import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/gym_feature/gyms/data/datasources/gym_remote_data_source.dart';
import 'package:kamn/gym_feature/gyms/data/models/features_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_details_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/plan_model.dart';

abstract class GymDetailsRepository {
  Future<GymDetailsModel?> getGymDetails(String gymId);
  Future<List<GymDetailsModel>> getAllGyms();
  Future<Either<Faliure, List<FeatureModel>>> getGymFeatures(String gymId);
  Future<Either<Faliure, List<Plan>>> getGymPlans(String gymId);
}

@Injectable(as: GymDetailsRepository)
class GymDetailsRepositoryImpl implements GymDetailsRepository {
  final GymDetailsRemoteDataSource remoteDataSource;

  GymDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<GymDetailsModel?> getGymDetails(String gymId) async {
    try {
      final gym = await remoteDataSource.getGymById(gymId);
      return gym;
    } catch (e) {
      throw Exception('Failed to fetch gym details: $e');
    }
  }

  @override
  Future<List<GymDetailsModel>> getAllGyms() async {
    try {
      final gyms = await remoteDataSource.getAllGyms();
      return gyms;
    } catch (e) {
      throw Exception('Failed to fetch all gyms: $e');
    }
  }

  @override
  Future<Either<Faliure, List<FeatureModel>>> getGymFeatures(String gymId) {
    return executeTryAndCatchForRepository(
      () async {
        final features = await remoteDataSource.getGymFeatures(gymId);
        return features
            .map((element) => FeatureModel.fromJson(element))
            .toList();
      },
    );
  }
  
  @override
  Future<Either<Faliure, List<Plan>>> getGymPlans(String gymId) {
  return executeTryAndCatchForRepository(
      () async {
        final plans = await remoteDataSource.getGymPlans(gymId);
        return plans
            .map((element) => Plan.fromMap(element))
            .toList();
      },
    );
  }
}
