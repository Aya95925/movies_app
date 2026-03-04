import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/widget/home.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int currentIndex = 0;
  final List<Widget> tabs = [
    Home(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      body: tabs[currentIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Container(
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
