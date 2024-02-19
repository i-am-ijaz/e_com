import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import 'package:e_com/app/data/models/product/product.dart';
import 'package:e_com/app/view/modules/product/providers/product_provider.dart';
import 'package:e_com/app/view/modules/product/view/add_options_dialog.dart';
import 'package:e_com/app/view/theme/colors.dart';
import 'package:e_com/assets/assets.dart';
import 'package:e_com/core/extensions.dart';
import 'package:e_com/core/services/media_service.dart';

class ProductAddDialog extends ConsumerStatefulWidget {
  const ProductAddDialog({super.key});

  @override
  ConsumerState<ProductAddDialog> createState() => _ProductAddDialogState();
}

class _ProductAddDialogState extends ConsumerState<ProductAddDialog> {
  List<XFile> _pickedImages = [];

  Product? _product;

  @override
  void dispose() {
    super.dispose();
    _pickedImages.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(24),
                  Text(
                    'Images',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: const Color(0xFF525252),
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const Gap(12),
                  SizedBox(
                    height: 143,
                    child: _pickedImages.isEmpty
                        ? Row(
                            children: [
                              Stack(
                                children: [
                                  Card(
                                    color: kBlackColor,
                                    clipBehavior: Clip.hardEdge,
                                    child: SizedBox(
                                      width: 158,
                                      height: 143,
                                      child: Image.asset(
                                        PngAssets.imagePlaceholder,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        MediaService()
                                            .pickImages()
                                            .then((value) {
                                          setState(() {
                                            _pickedImages = value;
                                          });
                                        });
                                      },
                                      child: const CircleAvatar(
                                        radius: 13,
                                        backgroundColor: kWhiteColor,
                                        foregroundColor: Color(0xFF525252),
                                        child: Icon(
                                          Icons.add,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _pickedImages.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Card(
                                    color: kBlackColor,
                                    elevation: 8,
                                    margin: const EdgeInsets.only(
                                      left: 4,
                                      right: 8,
                                      bottom: 4,
                                      top: 4,
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SizedBox(
                                      width: 158,
                                      height: 143,
                                      child: Image.file(
                                        File(_pickedImages[index].path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 12,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _pickedImages.removeAt(index);
                                        });
                                      },
                                      child: const CircleAvatar(
                                        radius: 13,
                                        backgroundColor: kWhiteColor,
                                        foregroundColor: Color(0xFF525252),
                                        child: Icon(
                                          Icons.delete_outline,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                  const Gap(12),
                  ElevatedButton(
                    onPressed: () {
                      MediaService().pickImages().then((value) {
                        setState(() {
                          if (_pickedImages.isEmpty) {
                            _pickedImages = value;
                          } else {
                            _pickedImages.addAll(value);
                          }
                        });
                      });
                    },
                    child: const Text('Select Images'),
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 32,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Name of the Product',
                              hintStyle: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: SizedBox(
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Category'),
                                Spacer(),
                                Icon(Icons.keyboard_arrow_down_sharp),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  TextFormField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                  const Gap(12),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Price',
                    ),
                  ),
                  const Gap(12),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddOptionsDialog(),
                      );
                    },
                    child: const Text('Add Options'),
                  ),
                  const Gap(60),
                ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
            ),
          ),
          TextButton(
            onPressed: () async {
              if (_product == null) {
                return;
              }

              await ref
                  .read(productProviderProvider.notifier)
                  .addProduct(_product!);

              if (!mounted) return;
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
