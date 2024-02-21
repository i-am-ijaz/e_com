import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_com/app/data/collection_refs.dart';
import 'package:e_com/global/app_exception.dart';

class CartRepository {
  static final _cartItems = CollectionRefs().cartItems;

  Future<void> createCartItem(
    String productId,
  ) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      await _cartItems.doc(uid).update({
        'productIds': FieldValue.arrayUnion([productId]),
      });
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error creating cart item',
      );
    }
  }

  Future<List<String>> getCartItems() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final snapshot = await _cartItems.doc(uid).get();
      if (snapshot.exists) {
        return List<String>.from(snapshot.data()!['productIds']);
      }
      return [];
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error getting cart items',
      );
    }
  }

  Future<void> deleteCartItem(String productId) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      await _cartItems.doc(uid).update({
        'productIds': FieldValue.arrayRemove([productId]),
      });
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error deleting cart item',
      );
    }
  }
}
