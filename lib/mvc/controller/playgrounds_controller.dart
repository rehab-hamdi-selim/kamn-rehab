import '../../features/sports/data/models/playground_model.dart';
import '../model/playgrounds_data_source_mvc.dart';

class GetGroundsControllerMVC {
  final GetGroundsDataSourceMVC dataSource;

  GetGroundsControllerMVC({required this.dataSource});

  Future<List<PlaygroundModel>> getPlaygroundsRequests() async {
    // return dataSource.getPlaygroundsRequests().then((value) {
    //   return value.where((element) => element.state == 'pending').toList();
    // }

    // );

    return dataSource.getPlaygroundsRequests();
  }
}
