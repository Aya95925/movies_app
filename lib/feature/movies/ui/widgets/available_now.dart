import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/home/cubit/home_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableNow extends StatelessWidget {
  const AvailableNow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.moviesApi.status == ApiStatus.success &&
            state.moviesApi.data != null) {
          print(
            'Aya--------------------------------------------------------------------------------------------',
          );
          return Container(
            height: MediaQuery.of(context).size.height * .7,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.backgroundHome),
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
                  ),
                  itemCount: state.moviesApi.data!.length,
                  itemBuilder: (context, index, realIndex) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        AppRoutes.movieDetails(AppAssets.groub14),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          state.moviesApi.data![index].image ??
                              AppAssets.groub13,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Image.asset(AppAssets.watchNow, height: 130, fit: BoxFit.cover),
              ],
            ),
          );
        } else if (state.moviesApi.status == ApiStatus.error) {
          print(state.moviesApi.errorMessage ?? 'there is an error');
          return Text(state.moviesApi.errorMessage ?? 'there is an error');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
