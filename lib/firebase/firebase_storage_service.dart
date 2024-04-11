import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseStorageService {
  static final _storage = FirebaseStorage.instance;

  static Future<String> uploadImage({
    required File image,
  }) async {
    final ref = _storage.ref().child(image.path.split("/").last);
    UploadTask task = ref.putFile(
      image,
    );

    return await task.snapshot.ref.getDownloadURL();
  }
}
