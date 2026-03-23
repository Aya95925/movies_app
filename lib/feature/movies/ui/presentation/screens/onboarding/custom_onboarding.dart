import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/core/utils/app_theme.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';

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

  final List<Color> pageGradientColors = [
    Colors.black, // الصفحة 1
    const Color(0xFF003D4C), // الصفحة 2:
    const Color(0xFF6C2314), // الصفحة 3:
    const Color(0xFF4C2A6B), // الصفحة 4:
    const Color(0xFF5E2129), // الصفحة 5:
    const Color(0xFF2D3238), // الصفحة 6:
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
      "title": "Rate, Review and Learn",
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
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemCount: onboardingData.length,
            itemBuilder: (context, index) => Image.asset(
              onboardingData[index]['image']!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
          ),

          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: currentIndex == 0
                    ? [
                        const Color(0xFF1E1E1E).withOpacity(0.0),
                        const Color(0xFF1E1E1E).withOpacity(0.2),
                        const Color(0xFF121312).withOpacity(0.5),
                        const Color(0xFF121312).withOpacity(0.91),
                        const Color(0xFF121312),
                      ]
                    : [
                        Colors.transparent,
                        pageGradientColors[currentIndex].withOpacity(0.6),
                        pageGradientColors[currentIndex].withOpacity(0.8),
                        AppColors.black,
                      ],
                stops: currentIndex == 0
                    ? const [0.0, 0.2, 0.5, 0.8, 1.0]
                    : const [0.0, 0.3, 0.6, 0.8],
              ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            onboardingData[0]['title']!,
            textAlign: TextAlign.center,
            style: AppTheme.darkTheme.textTheme.displayLarge?.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            onboardingData[0]['subtitle']!,
            textAlign: TextAlign.center,
            style: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
              color: Colors.white70,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 24),
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
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  // ================= OTHER PAGES =================
  Widget _buildOtherPages() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
            style: AppTheme.darkTheme.textTheme.titleLarge,
          ),
          if (onboardingData[currentIndex].containsKey('subtitle')) ...[
            19.verticalSpace(),
            Text(
              onboardingData[currentIndex]['subtitle']!,
              textAlign: TextAlign.center,
              style: AppTheme.darkTheme.textTheme.bodyLarge,
            ),
          ],
          17.verticalSpace(),
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
                Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
              }
            },
          ),
          if (currentIndex > 1) ...[
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
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : color,
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
