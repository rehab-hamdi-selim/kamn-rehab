import 'package:flutter_test/flutter_test.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/mvvm/model/playgrounds_data_source_mvvm.dart';
import 'package:kamn/mvvm/viewModel/playgrounds_viewModel.dart';
import 'package:mocktail/mocktail.dart';

class MockGetGroundsDataSourceMVVM extends Mock
    implements GetGroundsDataSourceMVVM {}

void main() {
  late GetGroundsDataSourceMVVM mockGetGroundsDataSourceMVVM;
  late PlaygroundsViewModel viewModel;
  setUp(() {
    mockGetGroundsDataSourceMVVM = MockGetGroundsDataSourceMVVM();
    viewModel = PlaygroundsViewModel(
        getGroundsDataSourceMVVM: mockGetGroundsDataSourceMVVM);
  });

  test('fetchPlaygroundsRequests should fetch playgrounds', () async {
    final mockPlaygrounds = [
      PlaygroundModel(
        name: 'Playground 10',
        address: 'Address 10',
        price: 550.0,
        longitude: 9.0,
        latitude: 9.0,
        description: 'Description 10',
        govenrate: 'Govenrate 10',
        ownerId: 'OwnerId 10',
        playgroundId: 'PlaygroundId 10',
        rating: 4.3,
        size: 1000.0,
        status: 'Status 10',
        images: [],
      ),
      PlaygroundModel(
        name: 'Playground 11',
        address: 'Address 11',
        price: 600.0,
        longitude: 10.0,
        latitude: 10.0,
        description: 'Description 11',
        govenrate: 'Govenrate 11',
        ownerId: 'OwnerId 11',
        playgroundId: 'PlaygroundId 11',
        rating: 4.4,
        size: 1100.0,
        status: 'Status 11',
        images: [],
      ),
      PlaygroundModel(
        name: 'Playground 12',
        address: 'Address 12',
        price: 650.0,
        longitude: 11.0,
        latitude: 11.0,
        description: 'Description 12',
        govenrate: 'Govenrate 12',
        ownerId: 'OwnerId 12',
        playgroundId: 'PlaygroundId 12',
        rating: 4.0,
        size: 1200.0,
        status: 'Status 12',
        images: [],
      ),
      PlaygroundModel(
        name: 'Playground 13',
        address: 'Address 13',
        price: 700.0,
        longitude: 12.0,
        latitude: 12.0,
        description: 'Description 13',
        govenrate: 'Govenrate 13',
        ownerId: 'OwnerId 13',
        playgroundId: 'PlaygroundId 13',
        rating: 4.6,
        size: 1300.0,
        status: 'Status 13',
        images: [],
      ),
    ];

    when(() => mockGetGroundsDataSourceMVVM.getPlaygroundsRequests())
        .thenAnswer((_) async => mockPlaygrounds);
    await viewModel.fetchPlaygroundsRequests();
    expect(viewModel.playgrounds, mockPlaygrounds);
  });
}
