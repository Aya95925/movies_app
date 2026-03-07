import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';

class LanguageSwitcherWidget extends StatelessWidget {
  const LanguageSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.goldenYellow),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAssets.usaFlag, width: 30),

          const SizedBox(width: 5),
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.goldenYellow),
            ),
            child: Image.asset(AppAssets.egyptFlag, width: 30),
          ),
        ],
      ),
    );
  }
}
