import 'package:e_com/global/widgets/primary_app_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderPlacedDialog extends StatelessWidget {
  const OrderPlacedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Center(
        child: Text(
          'Your Order',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Your order has been placed, please wait and we will send you a message as soon as it is ready for delivery.',
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              PrimaryAppButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Excellent',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
