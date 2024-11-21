import 'package:kamn/mvp/presenter/playgrounds_interface.dart';

import '../model/playgrounds_data_source_mvp.dart';

class PlaygroundsPresenter {
  final PlaygroundsInterface view;
  final GetGroundsDataSourceMVP getGroundsDataSourceMVP;

  PlaygroundsPresenter(
      {required this.view, required this.getGroundsDataSourceMVP});

  Future<void> getGrounds() async {
    try {
      view.onLoading();
      var result = await getGroundsDataSourceMVP.getPlaygroundsRequests();
      view.getGrounds(playgroundsModel: result);
    } catch (e) {
      view.onError(error: e.toString());
    } finally {
      view.onHideLoading();
    }
  }
}
