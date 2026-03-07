import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/movies_details/movie_card.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/app_routes.dart';
import 'package:flutter_application_new/ui/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/ui/widgets/movie_section1.dart'; // تم استيراد السيكشن الجديد

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> movies = [
      MovieModel(image: AppAssets.groub13, rating: 7.7),
      MovieModel(image: AppAssets.groub14, rating: 7.7),
      MovieModel(image: AppAssets.groub13, rating: 7.7),
      MovieModel(image: AppAssets.groub14, rating: 7.7),
      MovieModel(image: AppAssets.groub13, rating: 7.7),
      MovieModel(image: AppAssets.groub14, rating: 7.7),
      MovieModel(image: AppAssets.groub13, rating: 7.7),
      MovieModel(image: AppAssets.groub14, rating: 7.7),
      MovieModel(image: AppAssets.groub13, rating: 7.7),
      MovieModel(image: AppAssets.groub14, rating: 7.7),
      MovieModel(image: AppAssets.groub13, rating: 7.7),
      MovieModel(image: AppAssets.groub14, rating: 7.7),
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER SECTION (Avatar & Stats)
            Padding(
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
                          fontFamily: "Roboto",
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
            ),

            /// ACTION BUTTONS (Edit & Exit)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.push(context, AppRoutes.updateScreen()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.goldenYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 9),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              fontSize: 20,
                              fontFamily: "Roboto",
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.person_sharp,
                            size: 20,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.horizontalSpace(),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color(0xFF121312),
                            title: const Text(
                              "Exit",
                              style: TextStyle(color: Colors.white),
                            ),
                            content: const Text(
                              "Are you sure you want to log out?",
                              style: TextStyle(color: Colors.white70),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
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
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Exit",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.exit_to_app,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            20.verticalSpace(),

            /// CUSTOM TAB BAR SECTION
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      tabAlignment: TabAlignment.fill,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppColors.goldenYellow,
                      labelColor: AppColors.goldenYellow,
                      unselectedLabelColor: AppColors.white,
                      indicatorWeight: 3,
                      tabs: [
                        Tab(icon: Icon(Icons.list), text: "Watch List"),
                        Tab(icon: Icon(Icons.folder), text: "History"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          HistoryMovieSection(movies: movies),
                          HistoryMovieSection(movies: movies),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
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
          style: const TextStyle(color: AppColors.white, fontSize: 16),
        ),
      ],
    );
  }
}
