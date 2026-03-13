// RemoteMovies.dart
import 'remote_torrent.dart';

class RemoteMovies {
  final String? id;
  final String? url;
  final String? imdbCode;
  final String? title;
  final String? titleEnglish;
  final String? titleLong;
  final String? slug;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  final String? descriptionFull;
  final String? synopsis;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? backgroundImage;
  final String? backgroundImageOriginal;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final String? state;
  final List<RemoteTorrent>? torrents;
  final String? dateUploaded;
  final int? dateUploadedUnix;

  const RemoteMovies({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory RemoteMovies.fromJson(Map<String, dynamic> json) => RemoteMovies(
        id: json['id']?.toString(), // تحويل int أو String لأي id
        url: json['url']?.toString(),
        imdbCode: json['imdb_code']?.toString(),
        title: json['title']?.toString(),
        titleEnglish: json['title_english']?.toString(),
        titleLong: json['title_long']?.toString(),
        slug: json['slug']?.toString(),
        year: (json['year'] is int) ? json['year'] as int : int.tryParse(json['year']?.toString() ?? ''),
        rating: (json['rating'] as num?)?.toDouble(),
        runtime: (json['runtime'] is int) ? json['runtime'] as int : int.tryParse(json['runtime']?.toString() ?? ''),
        genres: (json['genres'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
        summary: json['summary']?.toString(),
        descriptionFull: json['description_full']?.toString(),
        synopsis: json['synopsis']?.toString(),
        ytTrailerCode: json['yt_trailer_code']?.toString(),
        language: json['language']?.toString(),
        mpaRating: json['mpa_rating']?.toString(),
        backgroundImage: json['background_image']?.toString(),
        backgroundImageOriginal: json['background_image_original']?.toString(),
        smallCoverImage: json['small_cover_image']?.toString(),
        mediumCoverImage: json['medium_cover_image']?.toString(),
        largeCoverImage: json['large_cover_image']?.toString(),
        state: json['state']?.toString(),
        torrents: (json['torrents'] as List<dynamic>?)
            ?.map((e) => RemoteTorrent.fromJson(e as Map<String, dynamic>))
            .toList(),
        dateUploaded: json['date_uploaded']?.toString(),
        dateUploadedUnix: (json['date_uploaded_unix'] is int)
            ? json['date_uploaded_unix'] as int
            : int.tryParse(json['date_uploaded_unix']?.toString() ?? ''),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'imdb_code': imdbCode,
        'title': title,
        'title_english': titleEnglish,
        'title_long': titleLong,
        'slug': slug,
        'year': year,
        'rating': rating,
        'runtime': runtime,
        'genres': genres,
        'summary': summary,
        'description_full': descriptionFull,
        'synopsis': synopsis,
        'yt_trailer_code': ytTrailerCode,
        'language': language,
        'mpa_rating': mpaRating,
        'background_image': backgroundImage,
        'background_image_original': backgroundImageOriginal,
        'small_cover_image': smallCoverImage,
        'medium_cover_image': mediumCoverImage,
        'large_cover_image': largeCoverImage,
        'state': state,
        'torrents': torrents?.map((e) => e.toJson()).toList(),
        'date_uploaded': dateUploaded,
        'date_uploaded_unix': dateUploadedUnix,
      };
}
