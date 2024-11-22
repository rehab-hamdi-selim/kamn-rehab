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
