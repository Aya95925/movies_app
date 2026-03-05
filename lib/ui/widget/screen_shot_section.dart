import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_style.dart';

class ScreenShotsSection extends StatelessWidget {
  const ScreenShotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Screen Shots',
          style: AppStyle.white24Bold,
        ),
        const SizedBox(height: 14),

        Image.asset(AppAssets.largeScreenShot1),
        const SizedBox(height: 14),

        Image.asset(AppAssets.largeScreenShot1),
        const SizedBox(height: 14),

        Image.asset(AppAssets.largeScreenShot1),
      ],
    );
  }
}
