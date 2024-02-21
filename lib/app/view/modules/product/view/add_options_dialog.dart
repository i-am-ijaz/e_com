import 'package:e_com/global/widgets/primary_app_button.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:e_com/app/data/dummy_data/dummy_data.dart';
import 'package:e_com/app/data/models/product/option.dart';
import 'package:e_com/app/data/models/product/option_category.dart';
import 'package:e_com/app/view/modules/product/view/add_option_category_dialog.dart';
import 'package:e_com/app/view/modules/product/widgets/add_option_dialog.dart';
import 'package:e_com/core/extensions.dart';

class AddOptionsDialog extends StatefulWidget {
  const AddOptionsDialog({super.key});

  @override
  State<AddOptionsDialog> createState() => _AddOptionsDialogState();
}

class _AddOptionsDialogState extends State<AddOptionsDialog> {
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: optionCategories.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final productOption = optionCategories[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          productOption.title,
                          style: context.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const Gap(8),
                        if (productOption.options.isEmpty) ...[
                          PrimaryAppButton(
                            onPressed: () {
                              _addNewOption(productOption, context, index);
                            },
                            text: 'New Option',
                          ),
                          const Gap(12),
                        ] else
                          ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            itemCount: productOption.options.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) {
                              final option = productOption.options[i];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Text(
                                              option.name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            option.price == 0
                                                ? 'Free'
                                                : '\$${option.price}',
                                            style: context.textTheme.bodySmall!
                                                .copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        child: const Icon(Icons.delete_outline),
                                        onTap: () {
                                          setState(() {
                                            final updatedOptionsList =
                                                List<Option>.from(
                                              productOption.options,
                                            );
                                            updatedOptionsList.removeAt(i);
                                            final pOption =
                                                productOption.copyWith(
                                              options: updatedOptionsList,
                                            );
                                            optionCategories[index] = pOption;
                                          });
                                        },
                                      ),
                                      const Gap(4),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 2,
                                  ),
                                  const Gap(8),
                                  if (i == productOption.options.length - 1)
                                    PrimaryAppButton(
                                      onPressed: () {
                                        _addNewOption(
                                          productOption,
                                          context,
                                          index,
                                        );
                                      },
                                      text: 'New Option',
                                    ),
                                ],
                              );
                            },
                          ),
                      ],
                    );
                  },
                ),
                const Gap(60),
                PrimaryAppButton(
                  onPressed: _addCategoryOption,
                  text: 'New Category',
                ),
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
          onPressed: () {
            if (!mounted) return;
            Navigator.pop(context, optionCategories);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  void _addNewOption(
    OptionCategory productOption,
    BuildContext context,
    int index,
  ) async {
    final updatedOptionsList = List<Option>.from(
      productOption.options,
    );

    final product = await showDialog(
      context: context,
      builder: (context) => const AddOptionDialog(),
    );

    if (product == null) return;
    setState(() {
      updatedOptionsList.add(
        product,
      );
      optionCategories[index] = productOption.copyWith(
        options: updatedOptionsList,
      );
    });
  }

  void _addCategoryOption() async {
    final optionCategory = await showDialog(
      context: context,
      builder: (context) => const AddOptionCategoryDialog(),
    );

    if (optionCategory == null) return;

    setState(() {
      optionCategories.add(optionCategory);
    });
  }
}
