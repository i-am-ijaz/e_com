import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:e_com/app/data/providers/user_provider.dart';
import 'package:e_com/app/view/modules/home/views/products_listing_view.dart';
import 'package:e_com/app/view/modules/home/widgets/cart_button.dart';
import 'package:e_com/app/view/modules/product/product_add_dialog.dart';
import 'package:e_com/global/enum/enum.dart';
import 'package:e_com/global/widgets/primary_app_bar.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProviderProvider).value;

    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Gap(21),
          CartButton(),
          Expanded(
            child: ProductsListingView(),
          ),
        ],
      ),
      floatingActionButton: user?.role == Role.admin
          ? FloatingActionButton(
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
            )
          : null,
    );
  }
}

// admin@ecom.com
// admin@ecom.com
