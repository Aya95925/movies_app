import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/movies_details/movie_card.dart';
import 'package:flutter_application_new/ui/widgets/movie_card.dart'; // استيراد الـ Widget الموحد

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
  ];
  //مؤقت لحين الربط ب API
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
      extendBody: true,
      backgroundColor: AppColors.black,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            10.verticalSpace(),
            // التصنيفات العلوية
            SizedBox(
              height: 45,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => 10.horizontalSpace(),
                itemBuilder: (context, index) {
                  bool isSelected = selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedCategoryIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.goldenYellow
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.goldenYellow,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.black
                                : AppColors.goldenYellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            15.verticalSpace(),
            // شبكة الأفلام
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
            ),
          ],
        ),
      ),
    );
  }
}
