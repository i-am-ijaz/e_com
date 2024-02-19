import 'package:e_com/app/view/modules/auth/providers/auth_provider.dart';
import 'package:e_com/app/view/theme/colors.dart';
import 'package:e_com/assets/assets.dart';
import 'package:e_com/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBlackColor,
      title: const Text(
        'Business Name',
      ),
      actions: [
        IconButton(
          onPressed: () async {
            await appLunchUrl('tel:+1 555-555-5555');
          },
          icon: SvgPicture.asset(SvgAssets.phoneIcon),
        ),
        Consumer(
          builder: (context, ref, child) {
            return IconButton(
              onPressed: () async {
                const number = '+1 555-555-5555';
                final url =
                    'whatsapp://send?phone=$number&text=${Uri.encodeFull('Hello!')}';
                await appLunchUrl(url);
                await ref.read(authProviderProvider.notifier).logout();
              },
              icon: SvgPicture.asset(SvgAssets.whatsAppIcon),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
