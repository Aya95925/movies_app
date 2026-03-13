import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/browser/browse_screen.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/home/home_screen.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/profile/profile_screen.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/search/search_screen.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int currentIndex = 0;

  List<Widget> get _tabs => [
    const HomeScreen(),
    const SearchTab(),
    const BrowseTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      body: _tabs[currentIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Container(
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.lightBlack,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(AppAssets.homeIcon, 0),
              navItem(AppAssets.searchIcon, 1),
              navItem(AppAssets.browseIcon, 2),
              navItem(AppAssets.profileIcon, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: ImageIcon(
        AssetImage(image),
        size: 32,
        color: currentIndex == index ? AppColors.goldenYellow : AppColors.white,
      ),
    );
  }
}
