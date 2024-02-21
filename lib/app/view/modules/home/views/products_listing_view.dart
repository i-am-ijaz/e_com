import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:e_com/app/data/models/app_user/app_user.dart';
import 'package:e_com/app/data/models/product/product.dart';
import 'package:e_com/app/data/providers/user_provider.dart';
import 'package:e_com/app/view/modules/cart/checkout_dialog.dart';
import 'package:e_com/app/view/modules/product/product_add_dialog.dart';
import 'package:e_com/app/view/modules/product/providers/product_provider.dart';
import 'package:e_com/app/view/theme/colors.dart';
import 'package:e_com/core/extensions.dart';
import 'package:e_com/global/enum/enum.dart';
import 'package:e_com/global/widgets/primary_alert_dialog.dart';

class ProductsListingView extends ConsumerWidget {
  const ProductsListingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProviderProvider).value;

    return StreamBuilder(
      stream: ref.watch(productProviderProvider.notifier).getAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: kBlackColor,
            ),
          );
        }

        final categorizedProducts = snapshot.data!;

        return ListView.builder(
          itemCount: categorizedProducts.length,
          itemBuilder: (context, index) {
            final category = categorizedProducts.keys.toList()[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(
                    category,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: kSecondaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Gap(10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categorizedProducts[category]!.length,
                    itemBuilder: (context, index) {
                      final product = categorizedProducts[category]![index];
                      final canAddRightPadding =
                          index == categorizedProducts[category]!.length - 1;
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: canAddRightPadding ? 16 : 0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Card(
                                  color: kBlackColor,
                                  clipBehavior: Clip.hardEdge,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 8,
                                  child: SizedBox(
                                    width: 158,
                                    height: 143,
                                    child: CachedNetworkImage(
                                      imageUrl: product.images.first,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 12,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _onAddPressed(
                                            context,
                                            product,
                                            user,
                                          );
                                        },
                                        child: const CircleAvatar(
                                          radius: 13,
                                          backgroundColor: kWhiteColor,
                                          foregroundColor: kSecondaryTextColor,
                                          child: Icon(
                                            Icons.add,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      if (user != null &&
                                          user.role == Role.admin) ...[
                                        const Gap(8),
                                        GestureDetector(
                                          onTap: () {
                                            _onDeletePressed(
                                              context,
                                              ref,
                                              product,
                                            );
                                          },
                                          child: const CircleAvatar(
                                            radius: 13,
                                            backgroundColor: kWhiteColor,
                                            foregroundColor:
                                                kSecondaryTextColor,
                                            child: Icon(
                                              Icons.delete_outline,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Gap(8),
                            Text(
                              product.name,
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: kSecondaryTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              '\$${product.price}',
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: kSecondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _onDeletePressed(
    BuildContext context,
    WidgetRef ref,
    Product product,
  ) {
    showDialog(
      context: context,
      builder: (context) => PrimaryAlertDialog(
        title: 'Delete Product',
        message: 'Are you sure you want to delete this product?',
        onPressed: () {
          ref
              .read(
                productProviderProvider.notifier,
              )
              .remove(product);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _onAddPressed(
    BuildContext context,
    Product product,
    AppUser? user,
  ) {
    if (user != null && user.role == Role.user) {
      showDialog(
        context: context,
        builder: (context) {
          return CheckoutDialog(
            product: product,
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const ProductAddDialog(),
      );
    }
  }
}
