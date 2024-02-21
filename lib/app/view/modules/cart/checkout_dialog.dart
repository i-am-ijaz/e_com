import 'package:e_com/app/data/models/cart/cart_product.dart';
import 'package:e_com/app/view/modules/cart/providers/cart_provider.dart';
import 'package:e_com/global/widgets/primary_app_button.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:e_com/app/data/models/product/option.dart';
import 'package:e_com/app/data/models/product/product.dart';
import 'package:e_com/app/view/modules/cart/cart_dialog.dart';
import 'package:e_com/app/view/theme/colors.dart';
import 'package:e_com/core/extensions.dart';

class CheckoutDialog extends StatefulWidget {
  const CheckoutDialog({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<CheckoutDialog> createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<CheckoutDialog> {
  final List<Option> _selectedOptions = [];

  late double totalPrice = widget.product.price;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kSecondaryTextColor,
                  ),
                ),
                const Gap(4),
                Card(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  elevation: 8,
                  child: SizedBox(
                    height: 143,
                    child: CachedNetworkImage(
                      imageUrl: widget.product.images.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(16),
                Text(
                  widget.product.description,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                if (widget.product.optionCategories.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 48),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.product.optionCategories.length,
                    itemBuilder: (context, index) {
                      final optionCategory =
                          widget.product.optionCategories[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            optionCategory.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: optionCategory.options.length,
                            itemBuilder: (context, i) {
                              final option = optionCategory.options[i];
                              return Column(
                                children: [
                                  CheckboxListTile(
                                    activeColor: kBlackColor,
                                    value: _selectedOptions.contains(option),
                                    dense: true,
                                    title: Text(option.name),
                                    subtitle: Text(
                                      option.price == 0
                                          ? 'Free'
                                          : '+\$${option.price}',
                                      style:
                                          context.textTheme.bodySmall!.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    onChanged: (v) {
                                      setState(() {
                                        if (!_selectedOptions
                                            .contains(option)) {
                                          _selectedOptions.add(option);
                                          totalPrice += option.price;
                                        } else {
                                          _selectedOptions.remove(option);
                                          totalPrice -= option.price;
                                        }
                                      });
                                    },
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    height: 1,
                                    indent: 16,
                                    endIndent: 24,
                                  ),
                                  if (i == optionCategory.options.length - 1)
                                    const Gap(12),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                const Gap(30),
                Consumer(
                  builder: (context, ref, child) {
                    return PrimaryAppButton(
                      isLoading: ref.watch(cartProviderProvider).isLoading,
                      onPressed: () async {
                        final cartProduct = CartProduct(
                          productId: widget.product.docId,
                          options: _selectedOptions,
                        );
                        ref
                            .read(cartProviderProvider.notifier)
                            .addToCart(cartProduct)
                            .whenComplete(() {
                          if (mounted) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => const CartDialog(),
                            );
                          }
                        });
                      },
                      text: 'Save \$${totalPrice.toStringAsFixed(2)}',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
