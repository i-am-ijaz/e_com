import 'package:flutter/material.dart';

import 'package:e_com/global/widgets/primary_app_button.dart';

class PrimaryAlertDialog extends StatelessWidget {
  const PrimaryAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onPressed,
  });
  final String title;
  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        PrimaryAppButton(
          onPressed: onPressed,
          text: 'Yes',
        ),
      ],
    );
  }
}
