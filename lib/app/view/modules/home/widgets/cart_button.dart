import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:e_com/app/data/providers/user_provider.dart';
import 'package:e_com/app/view/modules/cart/cart_dialog.dart';
import 'package:e_com/app/view/modules/cart/providers/cart_provider.dart';
import 'package:e_com/app/view/theme/colors.dart';
import 'package:e_com/assets/assets.dart';
import 'package:e_com/global/enum/enum.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.watch(userProviderProvider).value;

        if (user == null) return const SizedBox.shrink();
        if (user.role == Role.admin) return const SizedBox.shrink();

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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CartDialog(),
                  );
                },
                child: Stack(
                  children: [
                    Row(
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
                    Consumer(
                      builder: (context, ref, child) {
                        final cart = ref.watch(cartProviderProvider);

                        return cart.when(
                          data: (data) {
                            final products = data?.products ?? [];

                            if (products.isEmpty) return const SizedBox();

                            return Positioned(
                              top: 0,
                              left: 18,
                              child: Container(
                                width: 15,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kWhiteColor,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  products.length.toString(),
                                  style: const TextStyle(
                                    fontSize: 8,
                                    color: kBlackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                          error: (error, stackTrace) => const SizedBox(),
                          loading: () => const SizedBox(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
