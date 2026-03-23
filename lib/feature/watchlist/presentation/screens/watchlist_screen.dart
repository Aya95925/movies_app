import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/similar_card.dart';
import 'package:flutter_application_new/feature/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WatchlistCubit>()..fetchWatchlist(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          title: const Text(
            "My Watchlist",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: BlocBuilder<WatchlistCubit, WatchlistState>(
          builder: (context, state) {
            if (state is WatchlistLoading)
              return const Center(child: CircularProgressIndicator());

            if (state is WatchlistSuccess) {
              if (state.movies.isEmpty) {
                return const Center(
                  child: Text(
                    "Your watchlist is empty",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.movies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return SimilarMovieCard(movie: state.movies[index]);
                },
              );
            }
            return const Center(child: Text("Error"));
          },
        ),
      ),
    );
  }
}
