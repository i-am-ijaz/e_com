import 'package:e_com/app/data/models/cart/cart.dart';
import 'package:e_com/app/data/models/cart/cart_product.dart';
import 'package:e_com/app/data/repositories/cart_repository.dart';
import 'package:e_com/global/exception_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartProvider extends _$CartProvider {
  @override
  Stream<Cart?> build() {
    try {
      return CartRepository().getCartItemsStream();
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
    return Stream.value(null);
  }

  Future<void> get() async {
    try {
      await AsyncValue.guard(() => CartRepository().getCartItems());
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }

  Future<void> addToCart(CartProduct cartProduct) async {
    try {
      await CartRepository().createCartItem(cartProduct);
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }

  Future<void> removeFromCart(CartProduct cartProduct) async {
    try {
      await CartRepository().deleteCartItem(cartProduct);
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }

  Future<void> clearCart() async {
    try {
      await CartRepository().deleteAllCartItems();
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }
}
