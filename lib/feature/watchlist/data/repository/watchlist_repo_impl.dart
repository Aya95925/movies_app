import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_new/model/movies_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchlistRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser?.uid ?? '';
  String get _userPath => 'users/$_userId/watchlist';

  Future<void> addToWatchlist(Movie movie) async {
    if (_userId.isEmpty) return;
    await _firestore
        .collection(_userPath)
        .doc(movie.id.toString())
        .set(movie.toJson());
  }

  Future<void> removeFromWatchlist(int movieId) async {
    if (_userId.isEmpty) return;
    await _firestore.collection(_userPath).doc(movieId.toString()).delete();
  }

  Future<List<Movie>> getWatchlist() async {
    if (_userId.isEmpty) return [];
    final snapshot = await _firestore.collection(_userPath).get();
    return snapshot.docs.map((doc) => Movie.fromJson(doc.data())).toList();
  }

  Stream<List<Movie>> getWatchlistStream() {
    return _firestore.collection(_userPath).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Movie.fromJson(doc.data())).toList();
    });
  }

  Stream<bool> isFavorite(int movieId) {
    return _firestore
        .collection(_userPath)
        .doc(movieId.toString())
        .snapshots()
        .map((doc) => doc.exists);
  }
}
