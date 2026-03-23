class RemoteMovie {
  final int? id;
  final String? title;
  final String? titleLong;
  final int? year;
  final double? rating;
  final String? summary;
  final String? descriptionFull;
  final String? mediumCoverImage;
  final String? largeCoverImage;

  // --- الحقول الجديدة لصور الشاشة ---
  final String? mediumScreenshotImage1;
  final String? mediumScreenshotImage2;
  final String? mediumScreenshotImage3;
  final String? backgroundImage; // أضف هذا
  final String? backgroundImageOriginal;
  // -------------------------------

  final List<String>? genres;
  final List<RemoteCast>? cast;
  final int? runtime;
  final String? url;

  RemoteMovie({
    this.id,
    this.title,
    this.titleLong,
    this.year,
    this.rating,
    this.summary,
    this.descriptionFull,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.genres,
    this.cast,
    this.runtime,
    this.url,
    this.backgroundImage,
    this.backgroundImageOriginal,
  });

  factory RemoteMovie.fromJson(Map<String, dynamic> json) {
    return RemoteMovie(
      id: json['id'],
      title: json['title'],
      titleLong: json['title_long'],
      year: json['year'],
      rating: (json['rating'] as num?)?.toDouble(),
      summary: json['summary'],
      descriptionFull: json['description_full'],
      mediumCoverImage: json['medium_cover_image'],
      largeCoverImage: json['large_cover_image'],

      mediumScreenshotImage1: json['medium_screenshot_image1'],
      mediumScreenshotImage2: json['medium_screenshot_image2'],
      mediumScreenshotImage3: json['medium_screenshot_image3'],

      runtime: json['runtime'],
      url: json['url'],

      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => RemoteCast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class RemoteCast {
  final String? name;
  final String? characterName;
  final String? urlSmallImage;

  RemoteCast({this.name, this.characterName, this.urlSmallImage});

  factory RemoteCast.fromJson(Map<String, dynamic> json) {
    return RemoteCast(
      name: json['name'],
      characterName: json['character_name'],
      urlSmallImage: json['url_small_image'],
    );
  }
}
