import 'package:e_com/global/widgets/primary_app_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:e_com/app/data/models/cart/retrieved_cart_product.dart';
import 'package:e_com/app/view/modules/cart/order_placed_dialog.dart';
import 'package:e_com/app/view/modules/cart/providers/cart_provider.dart';
import 'package:e_com/app/view/theme/colors.dart';
import 'package:e_com/core/extensions.dart';

class CartDialog extends ConsumerStatefulWidget {
  const CartDialog({
    super.key,
  });

  @override
  ConsumerState<CartDialog> createState() => _CartDialogState();
}

class _CartDialogState extends ConsumerState<CartDialog> {
  List<RetrievedCartProduct> _selectedRetrievedCartProducts = List.from([]);

  late double totalPrice = 0;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoading = true;
      });
    });
    ref.read(cartProviderProvider.notifier).get().then((value) {
      _selectedRetrievedCartProducts =
          ref.read(cartProviderProvider).value?.products ?? [];
    }).whenComplete(() {
      _calculateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProviderProvider);

    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Center(
        child: Text(
          'Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kBlackColor),
                  ),
                )
              : SingleChildScrollView(
                  child: Consumer(
                    builder: (context, ref, child) {
                      return cart.when(
                        data: (data) {
                          if (data?.products.isEmpty ?? true) {
                            return const Center(
                              child: Text('No items in your cart'),
                            );
                          }

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: data!.products.length,
                                itemBuilder: (context, index) {
                                  final retrievedProduct = data.products[index];
                                  final pricesList = retrievedProduct.options
                                      .where(
                                        (element) => element.price != 0,
                                      )
                                      .map((e) => e.price)
                                      .toList();
                                  final optionsTotalPrice = pricesList.isEmpty
                                      ? 0
                                      : pricesList.reduce(
                                          (value, element) => value + element,
                                        );
                                  final totalProductPrice =
                                      retrievedProduct.product.price +
                                          optionsTotalPrice;

                                  return CheckboxListTile(
                                    activeColor: kBlackColor,
                                    value: _selectedRetrievedCartProducts
                                        .contains(retrievedProduct),
                                    dense: true,
                                    title: Text(
                                      retrievedProduct.product.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Builder(
                                      builder: (context) {
                                        return Text(
                                          '+\$$totalProductPrice',
                                          style: context.textTheme.bodySmall!
                                              .copyWith(
                                            fontSize: 12,
                                          ),
                                        );
                                      },
                                    ),
                                    onChanged: (v) {
                                      _onSwitchToggler(retrievedProduct);
                                    },
                                  );
                                },
                              ),
                              Divider(
                                thickness: 1,
                                indent: 16,
                                height: 10,
                                endIndent: 24,
                                color: kSecondaryTextColor.withOpacity(0.26),
                              ),
                              ListTile(
                                title: const Text(
                                  'IUV',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  _selectedRetrievedCartProducts.isEmpty
                                      ? '\$${0.0}'
                                      : '\$${(totalPrice * 0.113).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const Gap(30),
                              PrimaryAppButton(
                                isLoading:
                                    ref.watch(cartProviderProvider).isLoading,
                                onPressed: _selectedRetrievedCartProducts
                                        .isEmpty
                                    ? null
                                    : () {
                                        Navigator.pop(context);
                                        ref
                                            .read(cartProviderProvider.notifier)
                                            .clearCart();
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const OrderPlacedDialog();
                                          },
                                        );
                                      },
                                text: _selectedRetrievedCartProducts.isEmpty
                                    ? 'Pay \$${0.0}'
                                    : 'Pay \$${totalPrice.toStringAsFixed(2)}',
                              ),
                            ],
                          );
                        },
                        error: (error, stackTrace) => Text(error.toString()),
                        loading: () => const SizedBox(),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }

  void _calculateTotalPrice() {
    final cartProducts = ref.read(cartProviderProvider).asData?.value?.products;
    if (cartProducts == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          totalPrice = 0.0;
          _isLoading = false;
        });
      });
      return;
    }
    for (final retrievedProduct in cartProducts) {
      final pricesList = retrievedProduct.options
          .where(
            (element) => element.price != 0,
          )
          .map((e) => e.price)
          .toList();
      final optionsTotalPrice = pricesList.isEmpty
          ? 0
          : pricesList.reduce(
              (value, element) => value + element,
            );
      final totalProductPrice =
          retrievedProduct.product.price + optionsTotalPrice;
      totalPrice += totalProductPrice;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _onSwitchToggler(RetrievedCartProduct retrievedProduct) {
    setState(() {
      if (!_selectedRetrievedCartProducts.contains(retrievedProduct)) {
        totalPrice += retrievedProduct.product.price;
        _selectedRetrievedCartProducts = List<RetrievedCartProduct>.from(
          _selectedRetrievedCartProducts,
        )..add(retrievedProduct);
      } else {
        _selectedRetrievedCartProducts = List<RetrievedCartProduct>.from(
          _selectedRetrievedCartProducts,
        )..remove(retrievedProduct);
        totalPrice -= retrievedProduct.product.price;
      }
    });
  }
}
