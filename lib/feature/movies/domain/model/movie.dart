class Movie {
  final String? id;
  final String? title;
  final int ?year;
  final double ?rating;
  final String ?image;
  final List<String>? genres;
  final String ?summary;

  const Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.image,
    required this.genres,
    required this.summary,
  });
}
