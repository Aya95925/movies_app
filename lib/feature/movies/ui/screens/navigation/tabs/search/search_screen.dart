import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/movie_card.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/text_field.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_card.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final textEditingController = TextEditingController();
  final List<MovieModel> movies = [
    MovieModel(image: AppAssets.groub13, rating: 7.7),
    MovieModel(image: AppAssets.groub14, rating: 7.7),
    MovieModel(image: AppAssets.groub14, rating: 7.7),
    MovieModel(image: AppAssets.groub13, rating: 7.7),
    MovieModel(image: AppAssets.groub13, rating: 7.7),
    MovieModel(image: AppAssets.groub14, rating: 7.7),
    MovieModel(image: AppAssets.groub14, rating: 7.7),
    MovieModel(image: AppAssets.groub13, rating: 7.7),
    MovieModel(image: AppAssets.groub13, rating: 7.7),
    MovieModel(image: AppAssets.groub14, rating: 7.7),
    MovieModel(image: AppAssets.groub14, rating: 7.7),
    MovieModel(image: AppAssets.groub13, rating: 7.7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              20.verticalSpace(),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.lightBlack, // لون داكن مطابق للصور
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CustomTextField(
                  prefixIcon: Icons.search,
                  hint: "Search",
                  controller: textEditingController,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 16),

              /// EMPTY STATE IMAGE
              Expanded(
                child: textEditingController.text.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.searchEmptyState, width: 124),
                          ],
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: movies[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
