import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('New Category'),
            ),
          ],
        ),
      ),
    );
  }
}
