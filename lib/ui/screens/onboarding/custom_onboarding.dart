import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/app_routes.dart';
import 'package:movies/ui/utils/app_theme.dart';
import 'package:movies/ui/utils/extension/context_extension.dart';
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

  // صور التدرج (Gradient) للصفحات
  final List<String> gradientImages = [
    "assets/images/on_2.png",
    "assets/images/on_2.png",
    "assets/images/on_3.png",
    "assets/images/on_4.png",
    "assets/images/on_5.png",
    "assets/images/on_6.png",
  ];

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
          // 1. صور الخلفية والـ PageView (الطبقة السفلية)
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemCount: onboardingData.length,
            itemBuilder: (context, index) => Image.asset(
              onboardingData[index]['image']!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // 2. تدرج فوق الصورة للصفحات الأخرى (باستثناء الصفحة الأولى)
          if (currentIndex != 0)
            Positioned.fill(
              child: Image.asset(
                gradientImages[currentIndex],
                fit: BoxFit.cover,
              ),
            ),

          // 3. المحتوى السفلي (الطبقة العلوية)
          Align(
            alignment: Alignment.bottomCenter,
            child: currentIndex == 0 ? _buildFirstPage() : _buildOtherPages(),
          ),
        ],
      ),
    );
  }

  // ================= PAGE 1 IN ONBOARDING =================
  Widget _buildFirstPage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, AppColors.black],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            onboardingData[0]['title']!,
            textAlign: TextAlign.center,
            style: AppTheme.darkTheme.textTheme.displayLarge,
          ),
          16.verticalSpace(),
          Text(
            onboardingData[0]['subtitle']!,
            textAlign: TextAlign.center,
            style: AppTheme.darkTheme.textTheme.titleSmall,
          ),
          32.verticalSpace(),
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
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // ================= OTHER PAGES IN ONBOARDING =================
  Widget _buildOtherPages() {
    return Container(
      width: double.infinity,
      // تأكد أن الـ padding لا يغطي الجزء العلوي الذي نريده دائرياً
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
      decoration: const BoxDecoration(
        color: AppColors.black, // لون صلب ليغطي الصورة
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // مؤشر بسيط للصفحات (اختياري، يضيف لمسة جمالية)
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          16.verticalSpace(),

          Text(
            onboardingData[currentIndex]['title']!,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 28),
          ),
          16.verticalSpace(),

          if (onboardingData[currentIndex].containsKey('subtitle')) ...[
            Text(
              onboardingData[currentIndex]['subtitle']!,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(
                color: AppColors.white.withOpacity(0.7),
              ),
            ),
            30.verticalSpace(),
          ],

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
                Navigator.pushReplacementNamed(context, AppRoutes.login);
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

  // ================= GENERAL BUTTON =================
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
            fontSize: 18,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
