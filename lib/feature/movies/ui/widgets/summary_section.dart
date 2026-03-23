import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_theme.dart';

class SummarySection extends StatelessWidget {
  final String summary;
  const SummarySection({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Summary', style: AppTheme.darkTheme.textTheme.titleMedium),
        const SizedBox(height: 16),
        Text(
          summary,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
