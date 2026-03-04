import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .7,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(AppAssets.backgroundHome),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.availableNow),

                SizedBox(
                  height: 350,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 350,

                      viewportFraction: 0.6,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          AppAssets.groub14,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),

                Image.asset(AppAssets.watchNow),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Actions', style: AppStyle.white20Regular),
                Row(
                  children: [
                    Text('seeMore', style: AppStyle.yellow16Regular),
                    Transform.rotate(
                      angle: 3.14,
                      child: Icon(
                        Icons.arrow_back,
                        size: 12,
                        color: AppColors.goldenYellow,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            height: MediaQuery.of(context).size.height * .26,
            child: CustomListView(),
          ),
        ],
      ),
    );
  }
}

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
