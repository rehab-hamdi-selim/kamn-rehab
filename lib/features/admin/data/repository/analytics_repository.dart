import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/admin/data/data_source/analytics_data_source.dart';
import 'package:kamn/features/admin/data/models/analytics_data_model.dart';

abstract class AnalyticsRepository {
  Future<Either<Faliure, List<AnalyticsDataModel>>> getAnalyticsData();
}

@Injectable(as: AnalyticsRepository)
class AnalyticsRepositoryImpl implements AnalyticsRepository {
  AnalyticsDataSource dataSource;
  AnalyticsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Faliure, List<AnalyticsDataModel>>> getAnalyticsData() {
    return executeTryAndCatchForRepository(() async {
      var data = await dataSource.getAnalyticsData();
      return data.map((value) {
        return AnalyticsDataModel.fromMap(value);
      }).toList();
    });
  }
}
