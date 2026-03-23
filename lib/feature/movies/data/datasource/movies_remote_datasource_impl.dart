import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_new/core/api_client/api_client.dart';
import 'package:flutter_application_new/feature/movies/data/datasource/movies_remote_datasource.dart';
import 'package:flutter_application_new/feature/movies/data/models/remote_movie_response.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final ApiClient _apiClient;
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  MoviesRemoteDataSourceImpl(
    this._apiClient,
    this._firestore,
    this._firebaseAuth,
  );

  String? get _userId => _firebaseAuth.currentUser?.uid;

  @override
  Future<RemoteMovieResponse> getMovieDetails(int movieId) {
    return _apiClient.getMovieDetails(movieId: movieId);
  }

  @override
  Future<RemoteMovieResponse> getMovies({
    String? genre,
    int? limit,
    String? sortBy,
    String? query,
  }) {
    return _apiClient.getMovies(
      genre: genre,
      limit: limit,
      sortBy: sortBy,
      query: query,
    );
  }

  @override
  Stream<List<Map<String, dynamic>>> getMoviesFromFirestore(
    String collectionName,
  ) {
    if (_userId == null) throw Exception("User not logged in");
    return _firestore
        .collection('users')
        .doc(_userId)
        .collection(collectionName)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Future<void> saveMovieToFirestore(MovieEntity movie, String collectionName) {
    if (_userId == null) throw Exception("User not logged in");
    return _firestore
        .collection('users')
        .doc(_userId)
        .collection(collectionName)
        .doc(movie.id.toString())
        .set(movie.toJson());
  }

  @override
  Future<Map<String, int>> getUserProfileStats() async {
    if (_userId == null) throw Exception("User not logged in");
    final watchlistSnapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('watchlist')
        .count()
        .get();
    final historySnapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('history')
        .count()
        .get();
    return {
      'watchlistCount': watchlistSnapshot.count ?? 0,
      'historyCount': historySnapshot.count ?? 0,
    };
  }
}
