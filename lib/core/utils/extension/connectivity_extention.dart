import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityExtention on Connectivity {
  Future<bool> get isConnected async {
    var result = await checkConnectivity();
    return result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);
  }
}
