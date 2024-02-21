import 'package:e_com/app/data/models/product/option.dart';
import 'package:e_com/app/data/models/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retrieved_cart_product.freezed.dart';
part 'retrieved_cart_product.g.dart';

@freezed
class RetrievedCartProduct with _$RetrievedCartProduct {

  factory RetrievedCartProduct({
    required Product product,
    required List<Option> options,
  }) = _RetrievedCartProduct;

  factory RetrievedCartProduct.fromJson(Map<String, dynamic> json) => _$RetrievedCartProductFromJson(json);
}