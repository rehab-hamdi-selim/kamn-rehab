import 'package:flutter_test/flutter_test.dart';
import 'package:kamn/features/sports/data/data_source/sports_remote_data_source.dart';
import 'package:kamn/features/sports/data/repositories/sports_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';

// إنشاء Mock لمصدر البيانات
class MockSportsRemoteDataSource extends Mock
    implements SportsRemoteDataSource {}

void main() {
  late SportsRepository controller;
  late MockSportsRemoteDataSource mockDataSource;

  setUp(() {
    // تهيئة الكائنات الوهمية
    mockDataSource = MockSportsRemoteDataSource();
    controller = SportsRepository(remoteDataSource: mockDataSource);
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

    final jsonGroundsData = [
      {
        'name': 'Playground 1',
        'status': 'pending',
        'longitude': 0.0,
        'latitude': 0.0,
        'description': 'Description 1',
        'ownerId': 'owner1',
        'playgroundId': 'pg1',
        'images': [],
        'rating': 5.0,
        'size': 100,
        'address': 'Address 1',
        'price': 50.0,
        'govenrate': 'Gov1',
      },
      {
        'name': 'Playground 2',
        'status': 'approved',
        'longitude': 0.0,
        'latitude': 0.0,
        'description': 'Description 2',
        'ownerId': 'owner2',
        'playgroundId': 'pg2',
        'images': [],
        'rating': 4.5,
        'size': 120,
        'address': 'Address 2',
        'price': 60.0,
        'govenrate': 'Gov2',
      }
    ];

    // محاكاة استدعاء المصدر
    when(() => mockDataSource.getPlaygrounds())
        .thenAnswer((_) async => jsonGroundsData);

    // استدعاء الدالة في الكنترولر
    final result = await controller.getPlaygrounds();

    // التحقق من النتيجة
    expect(result.isRight(), true); // Check if the result is a Right
    result.fold(
      (failure) => fail('Expected a successful result, but got a failure'),
      (playgrounds) => expect(playgrounds, mockPlaygrounds),
    );

    verify(() => mockDataSource.getPlaygrounds())
        .called(1); // التحقق من أن المصدر تم استدعاؤه مرة واحدة
  });
}
