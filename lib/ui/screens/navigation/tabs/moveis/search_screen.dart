import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_assets.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/extension/int_extensions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              20.verticalSpace(),

              /// SEARCH BAR SECTION
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.lightBlack, // لون داكن مطابق للصور
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const TextField(
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: AppColors.white, fontSize: 18),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.white,
                      size: 28,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),

              /// EMPTY STATE IMAGE
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.searchEmptyState, width: 124),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
