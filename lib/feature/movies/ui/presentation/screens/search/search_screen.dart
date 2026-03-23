import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/search/cubit/search_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_grid_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.black,

          body: const Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: _SearchField(),
              ),
              Expanded(child: _SearchResults()),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField();

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 700), () {
      context.read<SearchCubit>().searchMovies(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onSearchChanged,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: AppColors.white),
        prefixIcon: const Icon(Icons.search, color: AppColors.white),
        filled: true,
        fillColor: AppColors.lightBlack,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final status = state.searchResults.status;

        if (status == ApiStatus.initial) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.searchEmptyState, height: 200),
                const SizedBox(height: 16),
              ],
            ),
          );
        }
        if (status == ApiStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.goldenYellow),
          );
        }
        if (status == ApiStatus.error || state.searchResults.data == null) {
          return Center(
            child: Text(
              state.searchResults.errorMessage ?? 'Something went wrong!',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (state.searchResults.data!.isEmpty) {
          return const Center(
            child: Text(
              'No movies found.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }

        return MovieGridSection(movies: state.searchResults.data!);
      },
    );
  }
}
