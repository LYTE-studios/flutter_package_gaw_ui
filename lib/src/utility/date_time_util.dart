import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';

class DateTimeUtil {
  static String toHoursMinutes(DateTime time) {
    return '${GawDateUtil.formatTime(time.hour)}:${GawDateUtil.formatTime(time.minute)}';
  }

  static String toHoursMinutesInterval(DateTime start, DateTime end) {
    return '${toHoursMinutes(start)} - ${toHoursMinutes(end)}';
  }

  static String toMonthYear(DateTime date) {
    return '${date.month} / ${date.year}';
  }
}
