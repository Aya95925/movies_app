import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final int year;
  final double rating;
  final String summary;
  final String mediumCoverImage;
  final String largeCoverImage;
  final String screenshot1;
  final String screenshot2;
  final String screenshot3;
  final List<String> genres;
  final List<CastEntity>? cast;
  final int runtime;
  final String url;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.summary,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.screenshot1,
    required this.screenshot2,
    required this.screenshot3,
    required this.genres,
    this.cast,
    required this.runtime,
    required this.url,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown Title',
      year: json['year'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      summary:
          json['summary'] ??
          json['description_full'] ??
          'No summary available.',
      mediumCoverImage: json['medium_cover_image'] ?? '',
      largeCoverImage: json['large_cover_image'] ?? '',

      screenshot1: json['background_image'] ?? '',
      screenshot2: json['background_image_original'] ?? '',
      screenshot3: json['large_cover_image'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      cast: (json['cast'] as List?)
          ?.map((c) => CastEntity.fromJson(c as Map<String, dynamic>))
          .toList(),
      runtime: json['runtime'] ?? 0,
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'rating': rating,
      'summary': summary,
      'medium_cover_image': mediumCoverImage,
      'large_cover_image': largeCoverImage,
      'medium_screenshot_image1': screenshot1,
      'medium_screenshot_image2': screenshot2,
      'medium_screenshot_image3': screenshot3,
      'genres': genres,
      'cast': cast?.map((c) => c.toJson()).toList(),
      'runtime': runtime,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [
    id,
    title,
    year,
    rating,
    summary,
    mediumCoverImage,
    largeCoverImage,
    screenshot1,
    screenshot2,
    screenshot3,
    genres,
    cast,
    runtime,
    url,
  ];
}

class CastEntity extends Equatable {
  final String name;
  final String characterName;
  final String? urlSmallImage;

  const CastEntity({
    required this.name,
    required this.characterName,
    this.urlSmallImage,
  });

  factory CastEntity.fromJson(Map<String, dynamic> json) {
    return CastEntity(
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

  @override
  List<Object?> get props => [name, characterName, urlSmallImage];
}
