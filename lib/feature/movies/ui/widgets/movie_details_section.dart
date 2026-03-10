import 'package:flutter/material.dart';
import 'package:flutter_application_new/model/cast_model.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/cast_section.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/gernes_section.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/screen_shot_section.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/similar_section.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/summary_section.dart';

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
