import 'package:e_com/app/data/models/cart/retrieved_cart_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';


@freezed
class Cart with _$Cart {
  factory Cart({
    required List<RetrievedCartProduct> products,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
