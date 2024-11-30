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
}
