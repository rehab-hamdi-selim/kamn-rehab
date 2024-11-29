import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreService {
  late FirebaseFirestore _firestore;

  FirestoreService() {
    _firestore = FirebaseFirestore.instance;
  }

  FirebaseFirestore get firestore => _firestore;

  Future<QuerySnapshot> getData(String collectionPath) async {
    return await _firestore.collection(collectionPath).get();
  }

  Future<void> addData(String collectionPath, Map<String, dynamic> data) async {
    await _firestore.collection(collectionPath).add(data);
  }

  Future<void> updateData(String collectionPath, String playgroundId,
      Map<String, dynamic> data) async {
    await _firestore.collection(collectionPath).doc(playgroundId).update(data);
  }
}
