import 'package:e_com/global/widgets/primary_app_button.dart';
import 'package:flutter/material.dart';

import 'package:e_com/core/extensions.dart';
import 'package:e_com/core/utils.dart';

class CategoryPickerDialog extends StatefulWidget {
  const CategoryPickerDialog({
    super.key,
    required this.categories,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final String? selectedCategory;
  final Function(String) onCategorySelected;

  @override
  State<CategoryPickerDialog> createState() => _CategoryPickerDialogState();
}

class _CategoryPickerDialogState extends State<CategoryPickerDialog> {
  final TextEditingController _newCategoryController = TextEditingController();

  @override
  void dispose() {
    _newCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Color(0xFF888888),
          width: 2,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final category = widget.categories[index];
                return ListTile(
                  dense: true,
                  title: Text(category),
                  onTap: () {
                    widget.onCategorySelected(category);
                    Navigator.pop(context);
                  },
                );
              },
              itemCount: widget.categories.length,
            ),
            const Divider(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 36,
                    child: TextField(
                      controller: _newCategoryController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: 'Add a new category',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                PrimaryAppButton(
                  text: 'Add',
                  onPressed: _handleAddNewCategory,
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _handleAddNewCategory() {
    final newCategory = _newCategoryController.text.trim();
    final lowerCaseCategories =
        widget.categories.map((e) => e.toLowerCase()).toList();
    final isExists = !lowerCaseCategories.contains(newCategory.toLowerCase());
    if (newCategory.isNotEmpty && isExists) {
      setState(() {
        widget.categories.add(newCategory);
        _newCategoryController.clear();
      });
    } else {
      'Test log'.log();
      if (newCategory.isEmpty) {
        showToast('Category is required');
      }
      if (widget.categories.contains(newCategory)) {
        showToast('Category already exists');
      }
    }
  }
}
