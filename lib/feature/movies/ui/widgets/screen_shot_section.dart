import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_theme.dart';

class ScreenShotsSection extends StatelessWidget {
  const ScreenShotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Screen Shots', style: AppTheme.darkTheme.textTheme.titleMedium),
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
