import 'package:e_com/app/data/models/product/option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class AddOptionDialog extends StatefulWidget {
  const AddOptionDialog({super.key});

  @override
  State<AddOptionDialog> createState() => _AddOptionDialogState();
}

class _AddOptionDialogState extends State<AddOptionDialog> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
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
      title: const Text('Add Option'),
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
                LengthLimitingTextInputFormatter(80),
              ],
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const Gap(8),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _priceController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(5),
              ],
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
            ),
            const Gap(12),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();

                final name = _nameController.text.trim();
                final price = double.tryParse(_priceController.text) ?? 0.0;

                Navigator.of(context).pop(
                  Option(
                    name: name,
                    price: price < 0.0 ? 0.0 : price,
                  ),
                );
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
