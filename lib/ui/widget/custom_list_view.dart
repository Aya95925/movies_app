import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_assets.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: 10,

        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                AppAssets.groub13,
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.height * .26,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
