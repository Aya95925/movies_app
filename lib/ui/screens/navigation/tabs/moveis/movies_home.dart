import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/browse_screen.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/profaile/profile_screen.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/search_screen.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/app_routes.dart';
import 'package:flutter_application_new/ui/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/ui/widgets/custom_list_view.dart';

class MoviesHome extends StatefulWidget {
  const MoviesHome({super.key});

  @override
  State<MoviesHome> createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome> {
  int _selectedIndex = 0;

  List<Widget> get _screens => [
    _buildHomeContent(context),
    const SearchScreen(),
    const BrowseTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              backgroundColor: const Color(0xFF1E1E1E),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.goldenYellow,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedFontSize: 0,
              selectedFontSize: 0,
              unselectedItemColor: AppColors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 28),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 28),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore, size: 28),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_sharp, size: 28),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    // استخدمنا LayoutBuilder لفهم أبعاد الشاشة المتوفرة
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.85,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.backgroundHome),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.availableNow, height: 100),
                    const SizedBox(height: 10),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 350,

                        viewportFraction: 0.6,
                        enlargeCenterPage: true,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            AppRoutes.movieDetails(AppAssets.groub14),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppAssets.groub14,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    Image.asset(AppAssets.watchNow, height: 130),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Actions',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            color: AppColors.goldenYellow,
                            fontSize: 16,
                          ),
                        ),
                        5.horizontalSpace(),
                        Icon(
                          size: 15,
                          Icons.arrow_forward,
                          color: AppColors.goldenYellow,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 220, child: const CustomListView()),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
