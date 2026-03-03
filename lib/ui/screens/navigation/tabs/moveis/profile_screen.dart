import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_assets.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/extension/int_extensions.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Image.asset(
                        AppAssets.avatarProfile,
                        width: 80,
                      ), // صورة الأفاتار
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.goldenYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              fontSize: 20,
                              fontFamily: "Roboto",
                            ),
                          ),
                          8.horizontalSpace(),
                          Icon(
                            size: 20,
                            Icons.person_sharp,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.horizontalSpace(),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 9),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Exit",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                              fontSize: 20,
                              fontFamily: "Roboto",
                            ),
                          ),
                          8.horizontalSpace(),
                          Icon(
                            size: 20,
                            Icons.exit_to_app,
                            color: AppColors.white,
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
                          _buildEmptyState(), // Watch List Empty State
                          _buildEmptyState(), // History Empty State
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

  /// Widget لبناء إحصائيات البروفايل
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

  /// Widget لبناء الحالة الفارغة (صورة الفشار)
  Widget _buildEmptyState() {
    return Center(
      child: Image.asset(
        AppAssets.searchEmptyState, // نفس الصورة المستخدمة في البحث
        width: 124,
      ),
    );
  }
}
