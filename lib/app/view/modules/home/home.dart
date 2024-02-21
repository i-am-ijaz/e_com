import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:e_com/app/data/models/app_user/app_user.dart';
import 'package:e_com/app/data/models/product/product.dart';
import 'package:e_com/app/data/providers/user_provider.dart';
import 'package:e_com/app/view/modules/cart/cart_dialog.dart';
import 'package:e_com/app/view/modules/product/product_add_dialog.dart';
import 'package:e_com/app/view/modules/product/providers/product_provider.dart';
import 'package:e_com/app/view/theme/colors.dart';
import 'package:e_com/assets/assets.dart';
import 'package:e_com/core/extensions.dart';
import 'package:e_com/global/enum/enum.dart';
import 'package:e_com/global/widgets/primary_alert_dialog.dart';
import 'package:e_com/global/widgets/primary_app_bar.dart';

class AdminHome extends ConsumerStatefulWidget {
  const AdminHome({super.key});

  @override
  ConsumerState<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends ConsumerState<AdminHome> {
  AppUser? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const ProductAddDialog(),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(21),
          Consumer(
            builder: (context, ref, child) {
              user = ref.watch(userProviderProvider).value;

              if (user == null) return const SizedBox.shrink();
              if (user!.role == Role.admin) return const SizedBox.shrink();

              return Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                    bottom: 22,
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 37,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(SvgAssets.cartIcon),
                          const Gap(13),
                          const Text(
                            'Cart',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: StreamBuilder(
              stream: ref.watch(productProviderProvider.notifier).getAll(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
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
                              final product =
                                  categorizedProducts[category]![index];
                              final canAddRightPadding = index ==
                                  categorizedProducts[category]!.length - 1;
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                  if (user != null &&
                                                      user!.role == Role.user) {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return CartDialog(
                                                          product: product,
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                child: const CircleAvatar(
                                                  radius: 13,
                                                  backgroundColor: kWhiteColor,
                                                  foregroundColor:
                                                      kSecondaryTextColor,
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                              if (user != null &&
                                                  user!.role == Role.admin) ...[
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
                                                    backgroundColor:
                                                        kWhiteColor,
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
                                      style:
                                          context.textTheme.bodyLarge?.copyWith(
                                        color: kSecondaryTextColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Gap(8),
                                    Text(
                                      '\$${product.price}',
                                      style:
                                          context.textTheme.bodyLarge?.copyWith(
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
            ),
          ),
        ],
      ),
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
}

// admin@ecom.com
// admin@ecom.com
