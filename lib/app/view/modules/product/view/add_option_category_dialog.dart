import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gap/gap.dart';

import 'package:e_com/app/data/models/product/option_category.dart';

class AddOptionCategoryDialog extends StatefulWidget {
  const AddOptionCategoryDialog({super.key});

  @override
  State<AddOptionCategoryDialog> createState() =>
      _AddOptionCategoryDialogState();
}

class _AddOptionCategoryDialogState extends State<AddOptionCategoryDialog> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Add Option Category'),
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(120),
              ],
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const Gap(8),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();

                final title = _nameController.text.trim();
                if (title.isNotEmpty) {
                  Navigator.of(context).pop(
                    OptionCategory(
                      title: title,
                      options: [],
                    ),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
