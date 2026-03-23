class Movie {
  final int id;
  final String title;
  final int year;
  final double rating;
  final String summary;
  final String mediumCoverImage;
  final String largeCoverImage;
  final List<String> genres;
  final List<Cast>? cast;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.summary,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.genres,
    this.cast,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? json['title_long'] ?? 'Unknown Title',
      year: json['year'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      summary:
          json['summary'] ??
          json['description_full'] ??
          'No summary available.',
      mediumCoverImage: json['medium_cover_image'] ?? '',
      largeCoverImage: json['large_cover_image'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      cast: (json['cast'] as List?)?.map((c) => Cast.fromJson(c)).toList(),
    );
  }

  // الدالة المطلوبة لحفظ البيانات في Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'rating': rating,
      'summary': summary,
      'medium_cover_image': mediumCoverImage,
      'large_cover_image': largeCoverImage,
      'genres': genres,
      'cast': cast?.map((c) => c.toJson()).toList(),
    };
  }
}

class Cast {
  final String name;
  final String characterName;
  final String? urlSmallImage;

  Cast({required this.name, required this.characterName, this.urlSmallImage});

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'] ?? 'Unknown',
      characterName: json['character_name'] ?? 'Unknown',
      urlSmallImage: json['url_small_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'character_name': characterName,
      'url_small_image': urlSmallImage,
    };
  }
}
