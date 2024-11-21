import 'package:kamn/mvvm/model/playgrounds_data_source_mvvm.dart';
import '../../features/sports/data/models/playground_model.dart';

class PlaygroundsViewModel {
  final GetGroundsDataSourceMVVM getGroundsDataSourceMVVM;
  PlaygroundsViewModel({required this.getGroundsDataSourceMVVM});

  // قائمة الملاعب (Playgrounds)
  List<PlaygroundModel> _playgrounds = [];
  List<PlaygroundModel> get playgrounds => _playgrounds;

  // حالة التحميل
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // رسالة الخطأ
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // دالة لتحميل البيانات
  Future<void> fetchPlaygroundsRequests() async {
    _setLoading(true); // تشغيل حالة التحميل
    _setErrorMessage(null); // تصفية الأخطاء

    try {
      var playgrounds = await getGroundsDataSourceMVVM.getPlaygroundsRequests();
      // final newPlaygrounds =
      //     playgrounds.where((element) => element.price > 1000).toList();
      _setPlaygrounds(playgrounds);
    } catch (error) {
      _setErrorMessage(error.toString());
    } finally {
      _setLoading(false); // إيقاف حالة التحميل
    }
  }

  // تحديث قائمة الملاعب
  void _setPlaygrounds(List<PlaygroundModel> newPlaygrounds) {
    _playgrounds = newPlaygrounds;
  }

  // تحديث حالة التحميل
  void _setLoading(bool value) {
    _isLoading = value;
  }

  // تحديث رسالة الخطأ
  void _setErrorMessage(String? message) {
    _errorMessage = message;
  }
}
