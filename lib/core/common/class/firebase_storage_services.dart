import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirebaseStorageServices {
  final FirebaseStorage _storage;

  FirebaseStorageServices(this._storage);

  FirebaseStorage get storage => _storage;

  Future<void> uploadFile(String path, String filePath) async {
    final fileRef = _storage.ref().child(path);
    await fileRef.putFile(File(filePath));
  }

  Future<String> getDownloadURL(String path) async {
    final fileRef = _storage.ref().child(path);
    return await fileRef.getDownloadURL();
  }
}
