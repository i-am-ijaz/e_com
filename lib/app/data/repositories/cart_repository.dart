import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/app/data/collection_refs.dart';
import 'package:e_com/global/app_exception.dart';

class CartRepository {
  static final _cartItems = CollectionRefs().cartItems;

  Future<void> createCartItem(
    String productId,
  ) async {
    try {
      await _cartItems.add(
        {
          'productId': productId,
        },
      );
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error creating cart item',
      );
    }
  }

  Future<void> deleteCartItem(
    String productId,
  ) async {
    try {
      await _cartItems.doc(productId).delete();
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error deleting cart item',
      );
    }
  }
}
