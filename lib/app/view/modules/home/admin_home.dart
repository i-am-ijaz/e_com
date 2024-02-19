import 'package:e_com/app/view/modules/product/product_add_dialog.dart';
import 'package:e_com/global/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

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
    );
  }
}

// admin@ecom.com
// admin@ecom.com
