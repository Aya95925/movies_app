import 'package:flutter/material.dart';
import 'package:movies_app/model/cast_model.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/widget/cast_section.dart';
import 'package:movies_app/ui/widget/gernes_section.dart';
import 'package:movies_app/ui/widget/screen_shot_section.dart';
import 'package:movies_app/ui/widget/similar_section.dart';
import 'package:movies_app/ui/widget/summary_section.dart';

class MovieDetailsSection extends StatelessWidget {
  const MovieDetailsSection({super.key});

  final List<CastModel> castList = const [
    CastModel(
      name: "Hayley Atwell",
      image: AppAssets.rectangle22,
      character: "Captain Carter",
    ),
    CastModel(
      name: "Elizabeth Olsen",
      image: AppAssets.rectangle22,
      character: "Wanda Maximoff",
    ),
    CastModel(
      name: "Benedict Cumberbatch",
      image: AppAssets.rectangle22,
      character: "Doctor Strange Wanda Maximoff",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenShotsSection(),
          const SizedBox(height: 20),
          SimilarMoviesSection(),

          const SizedBox(height: 20),
          SummarySection(),
          SizedBox(height: 1),
          CastSection(castList: castList),
          GenresSection(),
        ],
      ),
    );
  }
}
