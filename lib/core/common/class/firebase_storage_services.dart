import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseStorageServices {
  late FirebaseStorage _storage;

  FirebaseStorageServices() {
    _storage = FirebaseStorage.instance;
  }

  FirebaseStorage get storage => _storage;

  Future<void> uploadFile(String path, String filePath) async {
    final fileRef = _storage.ref().child(path);
    await fileRef.putFile(File(filePath)).timeout(const Duration(minutes: 2));
  }

  Future<String> getDownloadURL(String path) async {
    final fileRef = _storage.ref().child(path);
    return await fileRef.getDownloadURL().timeout(const Duration(seconds: 30));
  }
}
