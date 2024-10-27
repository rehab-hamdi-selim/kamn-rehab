import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  FirebaseFirestore get firestore => _firestore;

  Future<QuerySnapshot> getData(String collectionPath) async {
    return await _firestore.collection(collectionPath).get();
  }

  Future<void> addData(String collectionPath, Map<String, dynamic> data) async {
    await _firestore.collection(collectionPath).add(data);
  }
}
