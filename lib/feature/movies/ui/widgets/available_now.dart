import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/home/cubit/home_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableNow extends StatefulWidget {
  const AvailableNow({super.key});

  @override
  State<AvailableNow> createState() => _AvailableNowState();
}

class _AvailableNowState extends State<AvailableNow> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.moviesApi.status == ApiStatus.success &&
            state.moviesApi.data != null) {
          final movies = state.moviesApi.data!;

          return Container(
            height: MediaQuery.of(context).size.height * .7,
            width: double.infinity,

            /// الخلفية من API
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  movies[currentIndex].backgroundImage ??
                      AppAssets.backgroundHome,
                ),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.availableNow, height: 100),

                const SizedBox(height: 10),

                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 350,
                    viewportFraction: 0.6,
                    enlargeCenterPage: true,

                    /// هنا بيتغير الـ index
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),

                  itemCount: movies.length,

                  itemBuilder: (context, index, realIndex) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          AppRoutes.movieDetails(
                            movies[index].image ?? AppAssets.groub13,
                          ),
                        );
                      },

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),

                        child: Image.network(
                          movies[index].image ?? AppAssets.groub13,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),

                Image.asset(
                  AppAssets.watchNow,
                  height: 130,
                  width: MediaQuery.of(context).size.width * .8,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          );
        } else if (state.moviesApi.status == ApiStatus.error) {
          return Text(state.moviesApi.errorMessage ?? 'there is an error');
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.white),
          );
        }
      },
    );
  }
}
