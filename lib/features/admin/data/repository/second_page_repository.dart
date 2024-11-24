import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/admin/data/data_source/second_page_data_source.dart';
import 'package:kamn/features/admin/data/models/analytics_model.dart';

abstract class SecondPageRepository {
  Future<Either<Faliure, AnalyticsModel>> getSecondPageData();
}

@Injectable(as: SecondPageRepository)
class SecondPageRepositoryImpl implements SecondPageRepository {
  final SecondPageDataSource secondPageDataSource;
  SecondPageRepositoryImpl({required this.secondPageDataSource});
  @override
  Future<Either<Faliure, AnalyticsModel>> getSecondPageData() async {
    var data = await secondPageDataSource.secondPageDataSource();
    return executeTryAndCatchForRepository(() async {
      return AnalyticsModel.fromJson(data);
    });
  }
}
