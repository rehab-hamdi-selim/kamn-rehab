import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/mvc/controller/playgrounds_controller.dart';
import 'package:kamn/mvc/view/playgrounds_screen_mvc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'mvc_widget_test.mocks.dart';

// Import the generated mock file

@GenerateMocks([GetGroundsControllerMVC])
void main() {
  testWidgets('displays playground names', (WidgetTester tester) async {
    final mockController = MockGetGroundsControllerMVC();
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
    when(mockController.getPlaygroundsRequests())
        .thenAnswer((_) async => mockPlaygrounds);

    await tester.pumpWidget(MaterialApp(
      home: PlayGroundsScreenMVC(controller: mockController),
    ));

    await tester.pump(); // Wait for the async call to complete

    expect(find.text('Playground 1'), findsOneWidget);
    expect(find.text('Playground 2'), findsOneWidget);
  });
}
