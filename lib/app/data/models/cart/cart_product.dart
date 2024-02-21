import 'package:e_com/app/data/models/product/option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
class CartProduct with _$CartProduct {
  factory CartProduct({
    required String productId,
    required List<Option> options,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
