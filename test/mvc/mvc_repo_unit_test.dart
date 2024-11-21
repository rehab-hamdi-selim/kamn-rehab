import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kamn/mvc/controller/playgrounds_controller.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/mvc/model/playgrounds_data_source_mvc.dart';

// إنشاء Mock لمصدر البيانات
class MockGetGroundsDataSourceMVC extends Mock
    implements GetGroundsDataSourceMVC {}

void main() {
  late GetGroundsControllerMVC controller;
  late MockGetGroundsDataSourceMVC mockDataSource;

  setUp(() {
    // تهيئة الكائنات الوهمية
    mockDataSource = MockGetGroundsDataSourceMVC();
    controller = GetGroundsControllerMVC(dataSource: mockDataSource);
  });

  test('should fetch playgrounds from data source', () async {
    // إعداد البيانات الوهمية
    final mockPlaygrounds = [
      PlaygroundModel(
        name: 'Playground 1',
        status: 'pending',
        longitude: 0.0,
        latitude: 0.0,
        description: 'Description 1',
        ownerId: 'owner1',
        playgroundId: 'pg1',
        images: [],
        rating: 5.0,
        size: 100,
        address: 'Address 1',
        price: 50.0,
        govenrate: 'Gov1',
      ),
      PlaygroundModel(
        name: 'Playground 2',
        status: 'approved',
        longitude: 0.0,
        latitude: 0.0,
        description: 'Description 2',
        ownerId: 'owner2',
        playgroundId: 'pg2',
        images: [],
        rating: 4.5,
        size: 120,
        address: 'Address 2',
        price: 60.0,
        govenrate: 'Gov2',
      ),
    ];

    // محاكاة استدعاء المصدر
    when(() => mockDataSource.getPlaygroundsRequests())
        .thenAnswer((_) async => mockPlaygrounds);

    // استدعاء الدالة في الكنترولر
    final result = await controller.getPlaygroundsRequests();

    // التحقق من النتيجة
    expect(result, mockPlaygrounds);
    verify(() => mockDataSource.getPlaygroundsRequests())
        .called(1); // التحقق من أن المصدر تم استدعاؤه مرة واحدة
  });
}
