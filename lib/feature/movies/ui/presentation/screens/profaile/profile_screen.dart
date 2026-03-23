import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/profaile/cubit/profile_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_grid_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..loadProfileData(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state.userStats.status == ApiStatus.loading &&
                  state.currentUser == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.goldenYellow,
                  ),
                );
              }

              final stats = state.userStats.data ?? {};

              return Column(
                children: [
                  _buildHeader(
                    state.currentUser?.displayName ?? "User",
                    state.currentUser?.photoURL ?? AppAssets.avatarProfile,
                    stats['watchlistCount'] ?? 0,
                    stats['historyCount'] ?? 0,
                  ),
                  20.verticalSpace(),
                  _ActionButtons(
                    onEditProfile: () async {
                      final updated = await Navigator.pushNamed(
                        context,
                        AppRoutes.updateProfileRoute,
                      );
                      if (updated == true && context.mounted) {
                        context.read<ProfileCubit>().loadProfileData();
                      }
                    },
                  ),
                  20.verticalSpace(),
                  _buildTabsSection(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    String name,
    String avatar,
    int watchCount,
    int histCount,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey,
                child: ClipOval(
                  child: avatar.startsWith('assets')
                      ? Image.asset(
                          avatar,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: avatar,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(strokeWidth: 2),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              8.verticalSpace(),
              Container(
                alignment: Alignment.center,
                width: 170,
                child: Text(
                  name,
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          _buildStatItem(watchCount, "Wish List"),
          _buildStatItem(histCount, "History"),
        ],
      ),
    );
  }

  Widget _buildStatItem(int count, String label) {
    return Column(
      children: [
        Text(
          "$count",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }

  Widget _buildTabsSection() {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.goldenYellow,
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.white,
              unselectedLabelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                  _MovieList(listType: 'watchlist'),
                  _MovieList(listType: 'history'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// الكلاسات المساعدة (_MovieList, _ActionButtons) تبقى كما هي مع التأكد من استدعاء Cubit المناسب.

class _MovieList extends StatelessWidget {
  final String listType;
  const _MovieList({required this.listType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => listType == 'watchlist'
          ? previous.watchlist != current.watchlist
          : previous.history != current.history,
      builder: (context, state) {
        final resource = listType == 'watchlist'
            ? state.watchlist
            : state.history;

        if (resource.status == ApiStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.goldenYellow),
          );
        }

        if (resource.data == null || resource.data!.isEmpty) {
          return Center(
            child: Image.asset(
              listType == 'watchlist'
                  ? AppAssets.searchEmptyState
                  : AppAssets.searchEmptyState,
              height: 124,
              fit: BoxFit.contain,
            ),
          );
        }

        return MovieGridSection(movies: resource.data!, crossAxisCount: 3);
      },
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final VoidCallback onEditProfile;
  const _ActionButtons({required this.onEditProfile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: onEditProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.goldenYellow,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Edit Profile",
                style: TextStyle(color: AppColors.black, fontSize: 18),
              ),
            ),
          ),
          10.horizontalSpace(),
          Expanded(
            child: ElevatedButton(
              onPressed: () => _confirmLogout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Exit ", style: TextStyle(color: Colors.white)),
                  Icon(Icons.exit_to_app, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    bool isLoggingOut = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: const Color(0xFF121312),
          title: const Text("Exit", style: TextStyle(color: Colors.white)),
          content: const Text(
            "Are you sure you want to log out?",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            if (!isLoggingOut)
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            TextButton(
              onPressed: isLoggingOut
                  ? null
                  : () async {
                      setDialogState(() => isLoggingOut = true);

                      try {
                        await profileCubit.signOut();

                        if (dialogContext.mounted) {
                          Navigator.pushNamedAndRemoveUntil(
                            dialogContext,
                            AppRoutes.loginRoute,
                            (route) => false,
                          );
                        }
                      } catch (e) {
                        if (dialogContext.mounted) {
                          setDialogState(() => isLoggingOut = false);
                          ScaffoldMessenger.of(
                            dialogContext,
                          ).showSnackBar(SnackBar(content: Text("Error: $e")));
                        }
                      }
                    },
              child: isLoggingOut
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.red,
                      ),
                    )
                  : const Text("Yes", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
