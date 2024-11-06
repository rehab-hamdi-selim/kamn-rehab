// import 'package:flutter_test/flutter_test.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:mockito/mockito.dart';
// import 'path/to/sports_usecase.dart';
// import 'path/to/playground_model.dart';
// import 'path/to/failure.dart';

// void main() {
//   late SportsUsecase sportsUsecase;
//   late MockSportsRepository mockSportsRepository;
//   late MockGeolocatorHelper mockGeolocatorHelper;

//   setUp(() {
//     mockSportsRepository = MockSportsRepository();
//     mockGeolocatorHelper = MockGeolocatorHelper();
//     sportsUsecase = SportsUsecase(mockSportsRepository, mockGeolocatorHelper);
//   });

//   group('getFiltersPlaygrounds', () {
//     const double userLatitude = 30.0;
//     const double userLongitude = 30.0;
//     const int distanceInKm = 5;

//     final playgrounds = [
//       PlaygroundModel(latitude: 30.0, longitude: 30.0),
//       PlaygroundModel(latitude: 35.0, longitude: 35.0),
//     ];

//     test('should return filtered playgrounds within distance', () async {
//       // Arrange
//       when(mockSportsRepository.getPlaygrounds())
//           .thenAnswer((_) async => Right(playgrounds));

//       when(mockGeolocatorHelper.distanceBetween(
//         startLatitude: anyNamed('startLatitude'),
//         startLongitude: anyNamed('startLongitude'),
//         endLatitude: anyNamed('endLatitude'),
//         endLongitude: anyNamed('endLongitude'),
//       )).thenReturn(3000);  // Within 5km in meters (3000m)

//       // Act
//       final result = await sportsUsecase.getFiltersPlaygrounds(
//         distance: distanceInKm,
//         latitude: userLatitude,
//         longitude: userLongitude,
//       );

//       // Assert
//       result.fold(
//         (failure) => fail("Expected a successful result"),
//         (filteredPlaygrounds) {
//           expect(filteredPlaygrounds, isNotNull);
//           expect(filteredPlaygrounds!.length, 2);  // Both playgrounds should be within 5 km
//         },
//       );
//     });

//     test('should return empty list if no playgrounds are within distance', () async {
//       // Arrange
//       when(mockSportsRepository.getPlaygrounds())
//           .thenAnswer((_) async => Right(playgrounds));

//       when(mockGeolocatorHelper.distanceBetween(
//         startLatitude: anyNamed('startLatitude'),
//         startLongitude: anyNamed('startLongitude'),
//         endLatitude: anyNamed('endLatitude'),
//         endLongitude: anyNamed('endLongitude'),
//       )).thenReturn(6000);  // Outside 5km in meters (6000m)

//       // Act
//       final result = await sportsUsecase.getFiltersPlaygrounds(
//         distance: distanceInKm,
//         latitude: userLatitude,
//         longitude: userLongitude,
//       );

//       // Assert
//       result.fold(
//         (failure) => fail("Expected a successful result"),
//         (filteredPlaygrounds) {
//           expect(filteredPlaygrounds, isNotNull);
//           expect(filteredPlaygrounds!.length, 0);  // No playgrounds should be within 5 km
//         },
//       );
//     });

//     test('should return Failure if repository fails', () async {
//       // Arrange
//       when(mockSportsRepository.getPlaygrounds())
//           .thenAnswer((_) async => Left(Failure("Failed to retrieve data")));

//       // Act
//       final result = await sportsUsecase.getFiltersPlaygrounds(
//         distance: distanceInKm,
//         latitude: userLatitude,
//         longitude: userLongitude,
//       );

//       // Assert
//       expect(result.isLeft(), isTrue);  // Expect a failure result
//     });
//   });
// }
