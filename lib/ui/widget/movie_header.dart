import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_style.dart';
import 'package:movies_app/ui/widget/cusom_movies_video.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 30,
                  color: AppColors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Image.asset(AppAssets.vector4),
              ],
            ),
          ),

          const SizedBox(height: 160),

          const Center(child: CustomMoviesVideo()),

          const SizedBox(height: 150),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Doctor Strange in the Multiverse of Madness',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.white24Bold,
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            '2002',
            style: AppStyle.gray20Bold,
          ),
        ],
      ),
    );
  }
}
