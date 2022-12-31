
import 'package:intl/intl.dart';
import 'package:ps5_dicky_iskandar_z/utils/logger_util.dart';

extension DateUtil on DateTime {

  String toFormattedString({String format = 'dd/MM/yyyy'}) {
    try {
      final formatter = DateFormat(format);
      return formatter.format(this);
    } catch (e) {
      Logging.error(e);
      return '';
    }
  }

}