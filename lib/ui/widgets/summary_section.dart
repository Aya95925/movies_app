import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/app_theme.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Summary', style: AppTheme.darkTheme.textTheme.titleMedium),
        SizedBox(height: 16),
        Text(
          'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ],
    );
  }
}
