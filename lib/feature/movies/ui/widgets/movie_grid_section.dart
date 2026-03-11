import 'package:flutter/material.dart';
import 'package:flutter_application_new/model/movies_model.dart';

class MovieGridSection extends StatelessWidget {
  final List<MovieModel> movies;
  const MovieGridSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 10,

        childAspectRatio: 0.7,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Image.asset(movies[index].image, fit: BoxFit.cover);
      },
    );
  }
}
