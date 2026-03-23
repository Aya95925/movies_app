import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityExtension on Connectivity {
  Future<bool> get isConnected async {
    final result = await checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }
}
