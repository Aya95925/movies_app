import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/home/cubit/home_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.moviesApi.status == ApiStatus.success &&
              state.moviesApi.data != null) {
            final movies = state.moviesApi.data!;
            final filterMovies = movies
                .where((movie) => movie.genres?.contains("Action") ?? false)
                .toList();

            return ListView.builder(
              itemCount: filterMovies.length,

              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      filterMovies[index].image ?? AppAssets.groub13,
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.height * .3,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          } else if (state.moviesApi.status == ApiStatus.error) {
            return Center(
              child: Text(
                state.moviesApi.errorMessage ??
                    'there was am error ,please try later',
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.white),
            );
          }
        },
      ),
    );
  }
}
