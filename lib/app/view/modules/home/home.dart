import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:e_com/app/data/models/app_user/app_user.dart';
import 'package:e_com/app/view/modules/home/views/products_listing_view.dart';
import 'package:e_com/app/view/modules/home/widgets/cart_button.dart';
import 'package:e_com/app/view/modules/product/product_add_dialog.dart';
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
    );
  }
}

// admin@ecom.com
// admin@ecom.com
