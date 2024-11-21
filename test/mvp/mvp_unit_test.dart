import 'package:flutter_test/flutter_test.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/mvp/model/playgrounds_data_source_mvp.dart';
import 'package:kamn/mvp/presenter/playgrounds_presenter.dart';
import 'package:kamn/mvp/presenter/playgrounds_interface.dart';

// Manual mocks
class MockGetGroundsDataSourceMVP implements GetGroundsDataSourceMVP {
  List<PlaygroundModel>? mockResult;
  Exception? mockError;

  @override
  Future<List<PlaygroundModel>> getPlaygroundsRequests() async {
    if (mockError != null) {
      throw mockError!;
    }
    return mockResult ?? [];
  }

  @override
  // TODO: implement firestoreServices
  FirestoreService get firestoreServices => throw UnimplementedError();
}

class MockPlaygroundsView implements PlaygroundsInterface {
  bool loadingShown = false;
  String? errorMessage;
  List<PlaygroundModel>? updatedPlaygrounds;
  int loadingHideCount = 0;

  void reset() {
    loadingShown = false;
    errorMessage = null;
    updatedPlaygrounds = null;
    loadingHideCount = 0;
  }

  @override
  void getGrounds({required List<PlaygroundModel> playgroundsModel}) {
    updatedPlaygrounds = playgroundsModel;
  }

  @override
  void onError({required String error}) {
    errorMessage = error;
  }

  @override
  void onHideLoading() {
    loadingHideCount++;
  }

  @override
  void onLoading() {
    loadingShown = true;
  }
}

void main() {
  late MockGetGroundsDataSourceMVP mockDataSource;
  late MockPlaygroundsView mockView;
  late PlaygroundsPresenter presenter;

  setUp(() {
    mockDataSource = MockGetGroundsDataSourceMVP();
    mockView = MockPlaygroundsView();
    presenter = PlaygroundsPresenter(
      getGroundsDataSourceMVP: mockDataSource,
      view: mockView,
    );
  });

  group('PlaygroundsPresenter Tests', () {
    final testPlaygrounds = [
      PlaygroundModel(
        name: 'Test Ground',
        address: 'Test Address',
        price: 100.0,
        longitude: 0.0,
        latitude: 0.0,
        description: 'Test Description',
        govenrate: 'Test Governorate',
        ownerId: 'testOwner',
        playgroundId: 'testId',
        status: 'active',
        rating: 4.5,
        size: 500,
        images: [],
      ),
    ];

    test('getGrounds success scenario', () async {
      // Arrange
      mockDataSource.mockResult = testPlaygrounds;
      mockView.reset();

      // Act
      await presenter.getGrounds();

      // Assert
      expect(mockView.loadingShown, true);
      expect(mockView.loadingHideCount, 1);
      expect(mockView.updatedPlaygrounds, testPlaygrounds);
      expect(mockView.errorMessage, null);
    });

    test('getGrounds error scenario', () async {
      // Arrange
      mockDataSource.mockError = Exception('Test error');
      mockView.reset();

      // Act
      await presenter.getGrounds();

      // Assert
      expect(mockView.loadingShown, true);
      expect(mockView.loadingHideCount, 1);
      expect(mockView.errorMessage, 'Exception: Test error');
      expect(mockView.updatedPlaygrounds, null);
    });
  });
}

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:kamn/features/sports/data/models/playground_model.dart';
// import 'package:kamn/mvp/model/playgrounds_data_source_mvp.dart';
// import 'package:kamn/mvp/presenter/playgrounds_presenter.dart';
// import 'package:kamn/mvp/presenter/playgrounds_interface.dart';

// // Mock classes
// class MockGetGroundsDataSourceMVP extends Mock
//     implements GetGroundsDataSourceMVP {}

// class MockPlaygroundsView extends Mock implements PlaygroundsInterface {}

// void main() {
//   late GetGroundsDataSourceMVP mockDataSource;
//   late MockPlaygroundsView mockView;
//   late PlaygroundsPresenter presenter;

//   setUp(() {
//     mockDataSource = MockGetGroundsDataSourceMVP();
//     mockView = MockPlaygroundsView();
//     presenter = PlaygroundsPresenter(
//       getGroundsDataSourceMVP: mockDataSource,
//       view: mockView,
//     );
//   });
//   test('getGrounds success scenario', () async {
//     List<PlaygroundModel> testPlaygrounds = [
//       PlaygroundModel(
//         name: 'Test Ground',
//         address: 'Test Address',
//         price: 100.0,
//         longitude: 0.0,
//         latitude: 0.0,
//         description: 'Test Description',
//         govenrate: 'Test Governorate',
//         ownerId: 'testOwner',
//         playgroundId: 'testId',
//         status: 'active',
//         rating: 4.5,
//         size: 500,
//         images: [],
//       ),
//     ];

//     // Arrange
//     when(mockDataSource.getPlaygroundsRequests())
//         .thenAnswer((_) async => testPlaygrounds);


//     // Act
//     await presenter.getGrounds();

//     // Assert
//     verify(mockView.onLoading()).called(1);
//     verify(mockView.getGrounds(playgroundsModel: testPlaygrounds)).called(1);
//     verify(mockView.onHideLoading()).called(1);
//     verifyNever(mockView.onError(error: anyNamed('error') ?? ''));
//   });
// }
