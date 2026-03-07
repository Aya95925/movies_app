import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/app_routes.dart';
import 'package:flutter_application_new/ui/widgets/custom_list_view.dart';

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
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            AppRoutes.movieDetails(AppAssets.groub14),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            AppAssets.groub14,
                            fit: BoxFit.cover,
                          ),
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
                Text(
                  'Actions',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      'seeMore',
                      style: TextStyle(
                        color: AppColors.goldenYellow,
                        fontSize: 16,
                      ),
                    ),
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
