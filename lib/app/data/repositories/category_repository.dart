import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_com/app/data/collection_refs.dart';
import 'package:e_com/core/extensions.dart';
import 'package:e_com/global/app_exception.dart';

class CategoryRepository {
  CategoryRepository._();

  static final _categoryRef = CollectionRefs().categories;

  static Future<List<String>> getAll() async {
    try {
      return _categoryRef.get().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.first.data().log();
          return List.from(snapshot.docs.first.data()['categories']);
        }
        return [];
      });
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error getting categories',
      );
    }
  }

  static Future<void> create(String category) async {
    try {
      await _categoryRef.doc('0n9dbv9ENkZKtWm377du').set(
        {
          'categories': FieldValue.arrayUnion([category]),
        },
        SetOptions(merge: true),
      );
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error creating category',
      );
    }
  }
}
