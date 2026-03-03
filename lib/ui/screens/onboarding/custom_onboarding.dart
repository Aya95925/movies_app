import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_assets.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/app_routes.dart';
import 'package:movies/ui/utils/extension/int_extensions.dart';

class MovieOnboarding extends StatefulWidget {
  const MovieOnboarding({super.key});

  @override
  State<MovieOnboarding> createState() => _MovieOnboardingState();
}

class _MovieOnboardingState extends State<MovieOnboarding> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<String> gradientImages = [
    AppAssets.on2,
    AppAssets.on2,
    AppAssets.on3,
    AppAssets.on4,
    AppAssets.on5,
    AppAssets.on6,
  ];

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Find Your Next\nFavorite Movie Here",
      "subtitle":
          "Get access to a huge library of movies to suit all tastes. You will surely like it.",
      "image": AppAssets.moviesPosters,
      "mainButton": "Explore Now",
    },
    {
      "title": "Discover Movies",
      "subtitle":
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
      "image": AppAssets.onpo1,
      "mainButton": "Next",
    },
    {
      "title": "Explore All Genres",
      "subtitle":
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
      "image": AppAssets.onpo2,
      "mainButton": "Next",
    },
    {
      "title": "Create Watchlists",
      "subtitle":
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
      "image": AppAssets.onpo3,
      "mainButton": "Next",
    },
    {
      "title": "Rate, Review, and Learn",
      "subtitle":
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      "image": AppAssets.onpo4,
      "mainButton": "Next",
    },
    {
      "title": "Start Watching Now",
      "image": AppAssets.onpo5,
      "mainButton": "Finish",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          /// 1. الخلفية (الصور)
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemCount: onboardingData.length,
            itemBuilder: (context, index) => Image.asset(
              onboardingData[index]['image']!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),

          /// 2. تدرج فوق الصورة للصفحات الأخرى (باستثناء الصفحة الأولى)
          if (currentIndex != 0)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height * 0.30,
              child: Image.asset(
                gradientImages[currentIndex],
                fit: BoxFit.cover,
              ),
            ),

          /// 3. المحتوى السفلي
          Align(
            alignment: Alignment.bottomCenter,
            child: currentIndex == 0 ? _buildFirstPage() : _buildOtherPages(),
          ),
        ],
      ),
    );
  }

  // ================= PAGE 1 =================
  Widget _buildFirstPage() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppColors.black.withOpacity(0.2),
            AppColors.black.withOpacity(0.8),
            AppColors.black,
          ],
          stops: const [0.0, 0.3, 0.7, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            onboardingData[0]['title']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 36,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
              height: 1.2,
            ),
          ),
          30.verticalSpace(),
          _buildButton(
            text: onboardingData[0]['mainButton']!,
            color: AppColors.goldenYellow,
            textColor: AppColors.black,
            onPressed: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // ================= OTHER PAGES =================
  Widget _buildOtherPages() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            onboardingData[currentIndex]['title']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (onboardingData[currentIndex].containsKey('subtitle')) ...[
            16.verticalSpace(),
            Text(
              onboardingData[currentIndex]['subtitle']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 18,
                height: 1.3,
                fontFamily: "Inter",
              ),
            ),
          ],
          24.verticalSpace(),
          _buildButton(
            text: onboardingData[currentIndex]['mainButton']!,
            color: AppColors.goldenYellow,
            textColor: AppColors.black,
            onPressed: () {
              if (currentIndex < onboardingData.length - 1) {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pushReplacement(context, AppRoutes.login());
              }
            },
          ),
          if (currentIndex > 0) ...[
            15.verticalSpace(),
            _buildButton(
              text: "Back",
              color: Colors.transparent,
              textColor: AppColors.goldenYellow,
              isOutlined: true,
              onPressed: () {
                _controller.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  // ================= BUTTON =================
  Widget _buildButton({
    required String text,
    required Color color,
    required Color textColor,
    bool isOutlined = false,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isOutlined ? AppColors.transparent : color,
          side: isOutlined
              ? const BorderSide(color: AppColors.goldenYellow)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
