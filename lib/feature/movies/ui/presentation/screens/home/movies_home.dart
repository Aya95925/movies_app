import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/home/home_content.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/profaile/profile_screen.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/search/search_screen.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/browse/browse_screen.dart';

class MoviesHome extends StatefulWidget {
  const MoviesHome({super.key});

  @override
  State<MoviesHome> createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const SearchTab(),
    const BrowseTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.black,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              backgroundColor: const Color(0xFF1E1E1E),
              selectedItemColor: AppColors.goldenYellow,
              unselectedItemColor: AppColors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled, size: 28),
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
                  icon: Icon(Icons.person, size: 28),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
