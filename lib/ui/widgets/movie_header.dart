import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/app_theme.dart';
import 'package:flutter_application_new/ui/widgets/cusom_movies_video.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40), // مساحة علوية آمنة

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: AppColors.white,
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(AppAssets.vector4),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          const Center(child: CustomMoviesVideo()),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Doctor Strange in the Multiverse of Madness',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.darkTheme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Text('2002', style: AppTheme.darkTheme.textTheme.titleSmall),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
