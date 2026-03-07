import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/movies_details/movie_card.dart';
import 'package:flutter_application_new/ui/widgets/movie_card1.dart';

class HistoryMovieSection extends StatelessWidget {
  final List<MovieModel> movies;

  const HistoryMovieSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: GridView.builder(
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // عدد الأعمدة
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7, // نسبة العرض للطول
        ),
        itemBuilder: (context, index) {
          return HistoryMovieCard(movie: movies[index]);
        },
      ),
    );
  }
}
