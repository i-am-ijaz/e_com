import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/app/data/collection_refs.dart';
import 'package:e_com/app/data/models/product/product.dart';
import 'package:e_com/core/extensions.dart';
import 'package:e_com/global/app_exception.dart';

typedef CategorizedProducts = Map<String, List<Product>>;

class ProductRepository {
  ProductRepository._();

  static final _productsRef = CollectionRefs().products;

  static Stream<CategorizedProducts> getAllStream() {
    try {
      return _productsRef.snapshots().map((querySnapshot) {
        final products =
            querySnapshot.docs.map((e) => Product.fromJson(e.data())).toList();

        final categorizedProducts = <String, List<Product>>{};
        for (final product in products) {
          final category = product.category;
          if (categorizedProducts.containsKey(category)) {
            categorizedProducts[category]!.add(product);
          } else {
            categorizedProducts[category] = [product];
          }
        }
        return categorizedProducts;
      });
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error getting products',
      );
    }
  }

  static Future<void> create(Product product) async {
    try {
      jsonEncode(product.toJson()).log();
      await _productsRef.doc(product.docId).set(
            product.toJson(),
            SetOptions(merge: true),
          );
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error creating products',
      );
    }
  }

  static Future<void> update(Product product) async {
    try {
      await _productsRef.doc(product.docId).update(product.toJson());
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error updating products',
      );
    }
  }

  static Future<void> delete(Product product) async {
    try {
      await _productsRef.doc(product.docId).delete();
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error deleting products',
      );
    }
  }
}
