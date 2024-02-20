import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CollectionRefs {
  static const String _users = 'users';
  static const String _products = 'products';
  static const String _categories = 'categories';
  static const String _cartItems = 'cartItems';

  final _db = FirebaseFirestore.instance;
  final _uid = FirebaseAuth.instance.currentUser!.uid;

  CollectionReference<Map<String, dynamic>> get users => _db.collection(_users);
  CollectionReference<Map<String, dynamic>> get products =>
      _db.collection(_products);
  CollectionReference<Map<String, dynamic>> get categories =>
      _db.collection(_categories);

  CollectionReference<Map<String, dynamic>> get cartItems =>
      users.doc(_uid).collection(_cartItems);
}
