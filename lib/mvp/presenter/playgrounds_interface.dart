import 'package:kamn/features/sports/data/models/playground_model.dart';

abstract class PlaygroundsInterface {
  void getGrounds({required List<PlaygroundModel> playgroundsModel});
  void onError({required String error});
  void onLoading();
  void onHideLoading();
}
