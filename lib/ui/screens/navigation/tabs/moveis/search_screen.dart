import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/ui/widgets/text_field.dart';

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
                child: const CustomTextField(
                  prefixIcon: Icons.search,
                  hint: "Search",
                ),
                // TextField(
                //   style: TextStyle(color: AppColors.white, fontSize: 18),
                //   decoration: InputDecoration(
                //     hintText: "Search",
                //     hintStyle: TextStyle(color: AppColors.white, fontSize: 18),
                //     prefixIcon: Icon(
                //       Icons.search,
                //       color: AppColors.white,
                //       size: 28,
                //     ),
                //     border: InputBorder.none,
                //     contentPadding: EdgeInsets.symmetric(vertical: 12),
                //   ),
                // ),
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
