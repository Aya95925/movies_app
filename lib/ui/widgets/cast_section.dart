import 'package:flutter/material.dart';
import 'package:flutter_application_new/model/cast_model.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/app_theme.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key, required this.castList});
  final List<CastModel> castList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cast', style: AppTheme.darkTheme.textTheme.titleMedium),
        const SizedBox(height: 12),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: castList.length,
          itemBuilder: (context, index) {
            return customContainerCast(castList[index]);
          },
        ),
      ],
    );
  }

  Widget customContainerCast(CastModel cast) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightBlack,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(cast.image, fit: BoxFit.cover),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : ${cast.name}',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                Text(
                  'Character : ${cast.character}',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
