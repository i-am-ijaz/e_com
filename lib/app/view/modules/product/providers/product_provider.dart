import 'package:e_com/app/data/models/product/product.dart';
import 'package:e_com/global/exception_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class ProductProvider extends _$ProductProvider {
  @override
  Future<void> build() async {}

  Future<void> addProduct(Product product) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }
}
