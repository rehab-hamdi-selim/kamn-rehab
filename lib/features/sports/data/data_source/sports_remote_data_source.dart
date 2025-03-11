import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import '../../../../core/const/firebase_collections.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class SportsRemoteDataSource {
  Future<List<Map<String, dynamic>>> getPlaygrounds();
  Future<ReservationModel> submitReservation(ReservationModel reservation);
  Future<void> updateState(String playgroundId, Map<String, dynamic> data);
  Future<void> delete(ReservationModel reservation);
  Future<List<Map<String, dynamic>>> getUserReservations(String userId);
  Future<List<Map<String, dynamic>>> getSpecificReservationsByGroundId(
      String groundId, DateTime selectedDate);
  Future<List<Map<String, dynamic>>> searchByQuery(String query);
}

@Injectable(as: SportsRemoteDataSource)
class SportsRemoteDataSourceImpl implements SportsRemoteDataSource {
  final FirestoreService firestoreService;
  SportsRemoteDataSourceImpl({required this.firestoreService});
  CollectionReference get _playGroundCollection =>
      firestoreService.firestore.collection(FirebaseCollections.playgrounds);


  @override
  Future<List<Map<String, dynamic>>> getPlaygrounds() async {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot = await _playGroundCollection.get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

 

  

  @override
  Future<ReservationModel> submitReservation(ReservationModel reservation) {
    return executeTryAndCatchForDataLayer(() async {
      var docRef = firestoreService.firestore
          .collection(FirebaseCollections.reservation)
          .doc();
      reservation.reservationId = docRef.id;
      await docRef.set(reservation.toMap());
      return reservation;
    });
  }

  @override
  Future<void> updateState(String playgroundId, Map<String, dynamic> data) {
    return executeTryAndCatchForDataLayer(() async {
      return await firestoreService.updateData(
          FirebaseCollections.playgrounds, playgroundId, data);
    });
  }

  @override
  Future<void> delete(ReservationModel reservation) {
    return executeTryAndCatchForDataLayer(() async {
      var docRef = firestoreService.firestore
          .collection(FirebaseCollections.reservation)
          .doc(reservation.reservationId);
      return await docRef.delete();
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getUserReservations(String userId) {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot = await firestoreService.firestore
          .collection(FirebaseCollections.reservation)
          .where('user.uid',isEqualTo: userId)
          .get();
      return querySnapshot.docs.map((element) {
        return element.data() as Map<String, dynamic>;
      }).toList();
    });
  }

  @override
  Future<List<Map<String, dynamic>>> searchByQuery(String query) {
    return executeTryAndCatchForDataLayer(() async {
      List<String> seenIds = [];
      final nameQuery = firestoreService.firestore
          .collection(FirebaseCollections.playgrounds)
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThan: '$query\uf8ff')
          .get();
      final addressQuery = firestoreService.firestore
          .collection(FirebaseCollections.playgrounds)
          .where('address', isGreaterThanOrEqualTo: query)
          .where('address', isLessThan: '$query\uf8ff')
          .get();
      final results = await Future.wait([nameQuery, addressQuery]);
      return results.expand((querySnapshot) {
        return querySnapshot.docs
            .where((doc) {
              if (!seenIds.contains(doc.id)) {
                seenIds.add(doc.id);
                return true;
              }
              return false;
            })
            .map((doc) => doc.data())
            .toList();
      }).toList();
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getSpecificReservationsByGroundId(
      String groundId, DateTime selectedDate) {
    return executeTryAndCatchForDataLayer(() async {
      int startOfDay =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day)
              .millisecondsSinceEpoch;
      int endOfDay = DateTime(selectedDate.year, selectedDate.month,
              selectedDate.day, 23, 59, 59)
          .millisecondsSinceEpoch;
      var querySnapshot = await firestoreService.firestore
          .collection(FirebaseCollections.reservation)
          .where('ground.playgroundId', isEqualTo: groundId)
          .where('startAt', isGreaterThanOrEqualTo: startOfDay)
          .where('startAt', isLessThan: endOfDay)
          .get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}
