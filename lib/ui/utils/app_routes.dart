import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/home/home_tabs.dart';
import 'package:movies_app/ui/screens/movie_details/movie_details.dart';

abstract final class AppRoutes {
  static MaterialPageRoute  home() => MaterialPageRoute(
    builder: (_) {
      return HomeTabs();
    },
  );
 
  static MaterialPageRoute  movieDetails(String image) => MaterialPageRoute(
    builder: (_) {
      return MoviesDetails(image: image,);
    },
  );
}
