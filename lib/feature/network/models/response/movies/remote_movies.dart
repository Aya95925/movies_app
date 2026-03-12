// import 'package:equatable/equatable.dart';

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
    id: json['id'] as String?,
    url: json['url'] as String?,
    imdbCode: json['imdb_code'] as String?,
    title: json['title'] as String?,
    titleEnglish: json['title_english'] as String?,
    titleLong: json['title_long'] as String?,
    slug: json['slug'] as String?,
    year: json['year'] as int?,
    rating: (json['rating'] as num?)?.toDouble(),
    runtime: json['runtime'] as int?,
    genres: json['genres'] as List<String>?,
    summary: json['summary'] as String?,
    descriptionFull: json['description_full'] as String?,
    synopsis: json['synopsis'] as String?,
    ytTrailerCode: json['yt_trailer_code'] as String?,
    language: json['language'] as String?,
    mpaRating: json['mpa_rating'] as String?,
    backgroundImage: json['background_image'] as String?,
    backgroundImageOriginal: json['background_image_original'] as String?,
    smallCoverImage: json['small_cover_image'] as String?,
    mediumCoverImage: json['medium_cover_image'] as String?,
    largeCoverImage: json['large_cover_image'] as String?,
    state: json['state'] as String?,
    torrents: (json['torrents'] as List<dynamic>?)
        ?.map((e) => RemoteTorrent.fromJson(e as Map<String, dynamic>))
        .toList(),
    dateUploaded: json['date_uploaded'] as String?,
    dateUploadedUnix: json['date_uploaded_unix'] as int?,
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
