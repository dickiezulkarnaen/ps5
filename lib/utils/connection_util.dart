import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ps5_dicky_iskandar_z/utils/logger_util.dart';

mixin Connection {

  // Only check for mobile device
  // Use static method because Connectivity is a singleton already
  static Future<bool> isConnectedToInternet() async {
    final conn = await Connectivity().checkConnectivity();
    Logging.debug('Connection: ${conn.name}');
    return conn == ConnectivityResult.wifi || conn == ConnectivityResult.mobile;
  }

}
