import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionRefs {
  static const String _users = 'users';
  static const String _products = 'products';
  static const String _categories = 'categories';

  final _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get users => _db.collection(_users);
  CollectionReference<Map<String, dynamic>> get products =>
      _db.collection(_products);
  CollectionReference<Map<String, dynamic>> get categories =>
      _db.collection(_categories);
}
