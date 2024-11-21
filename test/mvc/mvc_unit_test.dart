import 'package:flutter_test/flutter_test.dart';
import 'package:kamn/mvc/view/playgrounds_screen_mvc.dart';
import 'package:mockito/mockito.dart';
import 'package:kamn/mvc/controller/playgrounds_controller.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/init_dependencies.dart';

class MockGetGroundsControllerMVC extends Mock
    implements GetGroundsControllerMVC {}

void main() {
  late MockGetGroundsControllerMVC mockController;

  setUp(() {
    mockController = MockGetGroundsControllerMVC();
    serviceLocator.registerSingleton<GetGroundsControllerMVC>(mockController);
    final mockPlaygrounds = [
      PlaygroundModel(
          name: 'Playground 1',
          status: 'pending',
          longitude: 0,
          latitude: 0,
          description: '',
          ownerId: '',
          playgroundId: '',
          images: [],
          rating: 0,
          size: 0,
          address: '',
          price: 0,
          govenrate: ""),
      PlaygroundModel(
          name: 'Playground 2',
          status: 'pending',
          longitude: 0,
          latitude: 0,
          description: '',
          ownerId: '',
          playgroundId: '',
          images: [],
          rating: 0,
          size: 0,
          address: '',
          price: 0,
          govenrate: '')
    ];
    // Ensure the mock method returns a Future with the correct type
    when(mockController.getPlaygroundsRequests())
        .thenAnswer((_) async => mockPlaygrounds);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  test('should fetch playgrounds and update list', () async {
    // إعداد البيانات الوهمية
    final mockPlaygrounds = [
      PlaygroundModel(
          name: 'Playground 1',
          status: 'pending',
          longitude: 0,
          latitude: 0,
          description: '',
          ownerId: '',
          playgroundId: '',
          images: [],
          rating: 0,
          size: 0,
          address: '',
          price: 0,
          govenrate: ""),
      PlaygroundModel(
          name: 'Playground 2',
          status: 'pending',
          longitude: 0,
          latitude: 0,
          description: '',
          ownerId: '',
          playgroundId: '',
          images: [],
          rating: 0,
          size: 0,
          address: '',
          price: 0,
          govenrate: '')
    ];

    // إنشاء الشاشة واستدعاء الدالة
    const screen = PlayGroundsScreenMVC();
    final state = screen.createState() as PlayGroundsScreenMVCState;
    await state.getPlaygroundsRequests();

    // التحقق من النتيجة
    expect(state.playgrounds, mockPlaygrounds);
    verify(mockController.getPlaygroundsRequests()).called(1);
  });
}
