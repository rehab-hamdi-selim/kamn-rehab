

import 'package:shared_preferences/shared_preferences.dart';

import '../models/playground_model.dart';

class SportsLocalDataSource {
  Future<List<PlaygroundModel>> getPlaygrounds() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString('playgrounds');
    if (jsonString == null) {
      return [];
    }
    return [];
  }
}
