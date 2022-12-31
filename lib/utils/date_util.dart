
import 'package:intl/intl.dart';
import 'package:ps5_dicky_iskandar_z/utils/logger_util.dart';

const String commonDateFormat = 'dd-MM-yyyy';

extension DateUtil on DateTime {

  String toFormattedString({String format = commonDateFormat}) {
    try {
      final formatter = DateFormat(format);
      return formatter.format(this);
    } catch (e) {
      Logging.error(e);
      final formatter = DateFormat(commonDateFormat);
      return formatter.format(this);
    }
  }

}