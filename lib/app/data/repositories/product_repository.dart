import 'package:e_com/app/data/collection_refs.dart';
import 'package:e_com/app/data/models/product/product.dart';
import 'package:e_com/global/app_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductRepository {
  ProductRepository._();

  final _productsRef = CollectionRefs().products;

  Future<List<Product>> getAll() async {
    try {
      return _productsRef.get().then((value) {
        return value.docs.map((e) => Product.fromJson(e.data())).toList();
      });
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error getting products',
      );
    }
  }

  Future<void> create(Product product) async {
    try {
      await _productsRef.doc(product.docId).set(product.toJson());
    } on FirebaseException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Error creating products',
      );
    }
  }
}
