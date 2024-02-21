import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/app/data/models/cart/cart.dart';
import 'package:e_com/app/data/models/cart/cart_product.dart';
import 'package:e_com/app/data/models/cart/retrieved_cart_product.dart';
import 'package:e_com/app/data/repositories/product_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_com/app/data/collection_refs.dart';
import 'package:e_com/global/app_exception.dart';

class CartRepository {
  static final _cartProducts = CollectionRefs().cartProducts;

  Future<void> createCartItem(CartProduct cartProduct) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final docRef = _cartProducts.doc(uid);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        await docRef.set({
          'cartProducts': [cartProduct.toJson()],
        });
      } else {
        await docRef.update({
          'cartProducts': FieldValue.arrayUnion([cartProduct.toJson()]),
        });
      }
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error creating cart item',
      );
    }
  }

  Stream<Cart?> getCartItemsStream() {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      return _cartProducts.doc(uid).snapshots().asyncMap(
        (event) async {
          if (!event.exists) return null;
          if (event.data() == null) return null;
          final products = (event.data()!['cartProducts'] as List)
              .map((item) => CartProduct.fromJson(item as Map<String, dynamic>))
              .toList();

          if (products.isEmpty) return null;

          final retrievedCartProducts = <RetrievedCartProduct>[];
          for (final cartProduct in products) {
            final product =
                await ProductRepository.getProductById(cartProduct.productId);

            if (product != null) {
              retrievedCartProducts.add(
                RetrievedCartProduct(
                  product: product,
                  options: cartProduct.options,
                ),
              );
            }
          }

          return Cart(
            products: retrievedCartProducts,
          );
        },
      );
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error getting cart items',
      );
    }
  }

  Future<Cart?> getCartItems() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final event = await _cartProducts.doc(uid).get();

      if (!event.exists) return null;
      if (event.data() == null) return null;
      final products = (event.data()!['cartProducts'] as List)
          .map((item) => CartProduct.fromJson(item as Map<String, dynamic>))
          .toList();

      if (products.isEmpty) return null;

      final retrievedCartProducts = <RetrievedCartProduct>[];
      for (final cartProduct in products) {
        final product =
            await ProductRepository.getProductById(cartProduct.productId);

        if (product != null) {
          retrievedCartProducts.add(
            RetrievedCartProduct(
              product: product,
              options: cartProduct.options,
            ),
          );
        }
      }

      return Cart(
        products: retrievedCartProducts,
      );
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error getting cart items',
      );
    }
  }

  Future<void> deleteCartItem(CartProduct cartProduct) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      await _cartProducts.doc(uid).update({
        'cartProducts': FieldValue.arrayRemove([cartProduct.toJson()]),
      });
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error deleting cart item',
      );
    }
  }

  // Delete all cart items
  Future<void> deleteAllCartItems() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      await _cartProducts.doc(uid).update({
        'cartProducts': [],
      });
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error deleting cart items',
      );
    }
  }
}
