import 'package:flutter_application_new/feature/movies/domain/model/movie.dart';
import 'package:flutter_application_new/feature/network/models/response/movies/remote_movies.dart';

class MovieMapper {
  Movie toMovie(RemoteMovies remoteMovies) {
    return Movie(
      id: remoteMovies.id ?? '',
      title: remoteMovies.title ?? '',
      year: remoteMovies.year,
      rating: remoteMovies.rating,
      image: remoteMovies.backgroundImage,
      genres: remoteMovies.genres,
      summary: remoteMovies.summary,
    );
  }

  List<Movie> toMovies(List<RemoteMovies> movies) {
    return movies.map(toMovie).toList();
  }
}
