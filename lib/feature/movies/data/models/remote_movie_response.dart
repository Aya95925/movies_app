// هذا الكلاس يمثل الاستجابة الكاملة من API
import 'package:flutter_application_new/feature/movies/data/models/remote_movie.dart';

class RemoteMovieResponse {
  final ResponseData? data;
  RemoteMovieResponse({this.data});
  factory RemoteMovieResponse.fromJson(Map<String, dynamic> json) {
    return RemoteMovieResponse(
      data: json['data'] != null ? ResponseData.fromJson(json['data']) : null,
    );
  }
}

class ResponseData {
  final List<RemoteMovie>? movies;
  final RemoteMovie? movie; // لتفاصيل الفيلم
  ResponseData({this.movies, this.movie});
  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => RemoteMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
      movie: json['movie'] != null ? RemoteMovie.fromJson(json['movie']) : null,
    );
  }
}
