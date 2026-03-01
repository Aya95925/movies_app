import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/app_routes.dart';

class MovieOnboarding extends StatefulWidget {
  const MovieOnboarding({super.key});

  @override
  State<MovieOnboarding> createState() => _MovieOnboardingState();
}

class _MovieOnboardingState extends State<MovieOnboarding> {
  @override
  void dispose() {
    _controller.dispose(); // تنظيف ال controller عند إغلاق الشاشة
    super.dispose();
  }

  final PageController _controller = PageController();
  int currentIndex = 0;

  final Color primaryYellow = AppColors.goldenYellow;
  final Color darkBgColor = AppColors.darkRed;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Find Your Next\nFavorite Movie Here",
      "subtitle":
          "Get access to a huge library of movies to suit all tastes. You will surely like it.",
      "image": "assets/images/movies_posters.png",
      "mainButton": "Explore Now",
    },
    {
      "title": "Discover Movies",
      "subtitle":
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
      "image": "assets/images/onpo1.png",
      "mainButton": "Next",
    },
    {
      "title": "Explore All Genres",
      "subtitle":
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
      "image": "assets/images/onpo2.png",
      "mainButton": "Next",
    },
    {
      "title": "Create Watchlists",
      "subtitle":
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
      "image": "assets/images/onpo3.png",
      "mainButton": "Next",
    },
    {
      "title": "Rate, Review, and Learn",
      "subtitle":
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      "image": "assets/images/onpo4.png",
      "mainButton": "Next",
    },
    {
      "title": "Start Watching Now",
      "image": "assets/images/onpo5.png",
      "mainButton": "Finish",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          /// الخلفية (الصور)
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Image.asset(
                onboardingData[index]['image']!,
                fit: BoxFit.fill,
              );
            },
          ),

          /// تدرج فوق الصورة (ما عدا الصفحة الأولى)
          if (currentIndex != 0)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.transparent,
                      AppColors.black.withValues(alpha: 0.45),
                    ],
                  ),
                ),
              ),
            ),

          /// المحتوى السفلي
          currentIndex == 0 ? _buildFirstPage() : _buildOtherPages(),
        ],
      ),
    );
  }

  // المحتوى السفلي
  // ================= PAGE 1 IN ONBOARDING=================
  Widget _buildFirstPage() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.transparent, AppColors.black],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              onboardingData[0]['title']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 36, // Medium 36
                fontWeight: FontWeight.w500, // Medium
                fontFamily: "Inter",
                height: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              onboardingData[0]['subtitle']!,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    // height: 1.3,
                    fontFamily: "Inter",
                  ).copyWith(
                    color: AppColors.white.withValues(alpha: 0.6), // 60% شفافية
                  ),
            ),
            const SizedBox(height: 32),
            _buildButton(
              text: onboardingData[0]['mainButton']!,
              color: primaryYellow,
              textColor: AppColors.black,
              onPressed: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //المحتوى السفلي
  // ================= OTHER PAGES IN ONBOARDING =================
  Widget _buildOtherPages() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: const BorderRadius.only(
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
            const SizedBox(height: 16),
            if (onboardingData[currentIndex].containsKey('subtitle')) ...[
              const SizedBox(height: 16),
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
            const SizedBox(height: 10),

            //----------------BUTTONS--------------------
            _buildButton(
              text: onboardingData[currentIndex]['mainButton']!,
              color: primaryYellow,
              textColor: AppColors.black,
              onPressed: () {
                if (currentIndex < onboardingData.length - 1) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                }
              },
            ),

            /// زر Back يبدأ من الصفحة الثالثة فقط
            if (currentIndex > 1) ...[
              const SizedBox(height: 15),
              _buildButton(
                text: "Back",
                color: AppColors.transparent,
                textColor: primaryYellow,
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
          side: isOutlined ? BorderSide(color: primaryYellow) : BorderSide.none,
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
