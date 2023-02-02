import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionChecker {
  /// Checking if the device has an internet connection.
  Future<bool> get hasConnection async {
    return await InternetConnectionCheckerPlus().hasConnection;
  }
}
