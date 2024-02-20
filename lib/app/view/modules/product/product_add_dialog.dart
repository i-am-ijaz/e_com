import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'package:e_com/app/data/models/product/product.dart';
import 'package:e_com/app/view/modules/product/providers/category_provider.dart';
import 'package:e_com/app/view/modules/product/providers/product_provider.dart';
import 'package:e_com/app/view/modules/product/view/add_category_dialog.dart';
import 'package:e_com/app/view/modules/product/view/add_options_dialog.dart';
import 'package:e_com/app/view/theme/colors.dart';
import 'package:e_com/assets/assets.dart';
import 'package:e_com/core/extensions.dart';
import 'package:e_com/core/services/media_service.dart';
import 'package:e_com/core/utils.dart';

class ProductAddDialog extends ConsumerStatefulWidget {
  const ProductAddDialog({super.key});

  @override
  ConsumerState<ProductAddDialog> createState() => _ProductAddDialogState();
}

class _ProductAddDialogState extends ConsumerState<ProductAddDialog> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;

  List<XFile> _pickedImages = [];

  Product _product = Product.empty();

  String _category = 'Category';
  List<String> _categories = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _pickedImages.clear();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _categories = ref.watch(categoryProviderProvider).value ?? [];

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
                      color: kSecondaryTextColor,
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
                                        foregroundColor: kSecondaryTextColor,
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
                                        foregroundColor: kSecondaryTextColor,
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
                      FocusScope.of(context).unfocus();

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
                          height: 35,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              hintText: 'Name of the Product',
                              hintStyle: TextStyle(
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              showDialog(
                                context: context,
                                builder: (context) => CategoryPickerDialog(
                                  onCategorySelected: (category) {
                                    setState(() {
                                      _category = category;
                                    });
                                  },
                                  selectedCategory: _category,
                                  categories: _categories,
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    _category,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Gap(8),
                                const Icon(Icons.keyboard_arrow_down_sharp),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                    ),
                  ),
                  const Gap(12),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'),
                      ),
                      LengthLimitingTextInputFormatter(5),
                    ],
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                    ),
                  ),
                  const Gap(12),
                  ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      final optionCategories = await showDialog(
                        context: context,
                        builder: (context) => const AddOptionsDialog(),
                      );
                      if (optionCategories == null) return;
                      _product = _product.copyWith(
                        optionCategories: optionCategories,
                      );
                    },
                    child: const Text('Add Options'),
                  ),
                  const Gap(50),
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
              FocusScope.of(context).unfocus();

              if (_pickedImages.isEmpty) {
                showToast('Please select at least one image');
                return;
              }

              if (_nameController.text.trim().isEmpty) {
                showToast('Please enter name of the product');
                return;
              }

              if (_priceController.text.trim().isEmpty) {
                showToast('Please enter price of the product');
                return;
              }

              if (_category == 'Category' || _category.isEmpty) {
                showToast('Please select category');
                return;
              }

              final product = _product.copyWith(
                docId: const Uuid().v4(),
                name: _nameController.text.trim(),
                description: _descriptionController.text.trim(),
                price: double.tryParse(_priceController.text) ?? 0.0,
                category: _category,
              );

              _createNewCategoryIfNotExits();

              await ref
                  .read(productProviderProvider.notifier)
                  .add(product, _pickedImages);

              if (!mounted) return;
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _createNewCategoryIfNotExits() {
    ref.read(categoryProviderProvider.notifier).addCategory(_category);
  }
}
