import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/app_routes.dart';
import 'package:flutter_application_new/ui/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/movies_details/movie_card.dart';
import 'package:flutter_application_new/ui/widgets/movie_grid_section.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> movies = List.generate(
      12,
      (index) => MovieModel(image: AppAssets.groub13, rating: 7.7),
    );

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const _HeaderSection(),
            const _ActionButtons(),
            20.verticalSpace(),
            _buildTabsSection(movies),
          ],
        ),
      ),
    );
  }

  Widget _buildTabsSection(List<MovieModel> movies) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              indicatorWeight: 3,
              indicatorColor: AppColors.goldenYellow,
              labelStyle: TextStyle(color: AppColors.white),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: AppColors.white,
              tabs: [
                Tab(
                  text: "Watch List",
                  icon: Icon(Icons.menu, color: AppColors.goldenYellow),
                ),
                Tab(
                  text: "History",
                  icon: Icon(Icons.folder, color: AppColors.goldenYellow),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MovieGridSection(movies: movies),
                  MovieGridSection(movies: movies),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset(AppAssets.avatarProfile, width: 80),
              8.verticalSpace(),
              const Text(
                "John Safwat",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          _buildStatItem("12", "Wish List"),
          const Spacer(),
          _buildStatItem("10", "History"),
          const Spacer(),
        ],
      ),
    );
  }

  static Widget _buildStatItem(String count, String label) => Column(
    children: [
      Text(
        count,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 24,
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.white,
          fontSize: 20,
        ),
      ),
    ],
  );
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(flex: 2, child: _editProfileBtn(context)),
          10.horizontalSpace(),
          Expanded(child: _exitBtn(context)),
        ],
      ),
    );
  }

  Widget _editProfileBtn(BuildContext context) => ElevatedButton(
    onPressed: () => Navigator.push(context, AppRoutes.updateScreen()),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 11),
      backgroundColor: AppColors.goldenYellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    child: const Text(
      "Edit Profile",
      style: TextStyle(color: AppColors.black, fontSize: 18),
    ),
  );

  Widget _exitBtn(BuildContext context) => ElevatedButton(
    onPressed: () => _confirmLogout(context),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 14),
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Exit", style: TextStyle(color: Colors.white)),
        5.horizontalSpace(),
        Icon(Icons.exit_to_app, size: 25, color: AppColors.white),
      ],
    ),
  );

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF121312),
        title: const Text("Exit", style: TextStyle(color: Colors.white)),
        content: const Text(
          "Are you sure you want to log out?",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  AppRoutes.login(),
                  (route) => false,
                );
              }
            },
            child: const Text("Yes", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
