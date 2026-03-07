import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';

class CustomMoviesVideo extends StatelessWidget {
  const CustomMoviesVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 48,
      backgroundColor: AppColors.goldenYellow,
      child: CircleAvatar(
        radius: 42,
        backgroundColor: AppColors.white,
        child: CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.goldenYellow,
          child: Center(
            child: Icon(Icons.play_arrow, size: 52, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
