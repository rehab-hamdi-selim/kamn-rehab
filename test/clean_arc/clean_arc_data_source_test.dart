import 'package:flutter_test/flutter_test.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/features/sports/data/data_source/sports_remote_data_source.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';

void main() {
  late SportsRemoteDataSourceImpl remoteDataSource;
  late List<QueryDocumentSnapshot<Map<String, dynamic>>> firedata;
  setUp(() async {
    TestWidgetsFlutterBinding
        .ensureInitialized(); // Ensure Flutter bindings are initialized

    remoteDataSource =
        SportsRemoteDataSourceImpl(firestore: FakeFirebaseFirestore());
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

    for (var playground in mockPlaygrounds) {
      await remoteDataSource.firestore
          .collection(FirebaseCollections.playgrounds)
          .add(playground.toMap());
    }
  });

  test('test', () async {
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

    final result = await remoteDataSource.getPlaygrounds();

    expect(result, jsonGroundsData);
  });
}
