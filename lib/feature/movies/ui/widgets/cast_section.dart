import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_theme.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart'; // تأكد من المسار الصحيح للـ Entity

class CastSection extends StatelessWidget {
  const CastSection({super.key, required this.castList});
  final List<CastEntity> castList;

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

  Widget customContainerCast(CastEntity cast) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightBlack,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // تعديل: استخدام NetworkImage وتحديد الحجم
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: cast.urlSmallImage != null
                ? Image.network(
                    cast.urlSmallImage!,
                    width: 70,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(width: 70, height: 90, color: Colors.grey),
                  )
                : Container(width: 70, height: 90, color: Colors.grey),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : ${cast.name}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),

                Text(
                  'Character : ${cast.characterName}',
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
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
