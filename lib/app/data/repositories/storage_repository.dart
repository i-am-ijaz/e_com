import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageRepository {
  StorageRepository._();

  static final storageRef = FirebaseStorage.instance.ref();

  static Future<String> uploadFile(File file) async {
    final fileName = const Uuid().v1();
    final uploadTask = storageRef.child(fileName).putFile(file);
    final downloadUrl = await uploadTask;
    final url = await downloadUrl.ref.getDownloadURL();
    return url;
  }

  static Future<void> deleteFile(String fileUrl) async {
    final fileName = fileUrl.split('/').last;
    await storageRef.child(fileName).delete();
  }
}
