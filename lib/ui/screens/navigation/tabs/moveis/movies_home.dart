import 'package:flutter/material.dart';
import 'package:movies/ui/screens/navigation/tabs/moveis/browse_screen.dart';
import 'package:movies/ui/screens/navigation/tabs/moveis/profile_screen.dart';
import 'package:movies/ui/screens/navigation/tabs/moveis/search_screen.dart';
import 'package:movies/ui/utils/app_colors.dart';

class MoviesHome extends StatefulWidget {
  const MoviesHome({super.key});

  @override
  State<MoviesHome> createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Center(
      child: Text("Home Screen", style: TextStyle(color: Colors.white)),
    ),
    const SearchScreen(),
    const BrowseTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: _screens[_selectedIndex],

      /// BOTTOM NAVIGATION BAR
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12), // لإعطاء تأثير الطفو كما في الصورة
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16), // حواف دائرية للبار
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            backgroundColor: const Color(0xFF1E1E1E), // لون خلفية البار الداكن
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.goldenYellow,
            unselectedItemColor: AppColors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 28),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 28),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore, size: 28), // أيقونة التصفح
                label: "Browse",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_sharp, size: 28),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
