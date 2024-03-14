import 'package:easy_localization/easy_localization.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:tuple/tuple.dart';

class GawDateUtil {
  static String monthName(int month) {
    switch (month) {
      case 1:
        return LocaleKeys.january.tr();
      case 2:
        return LocaleKeys.february.tr();
      case 3:
        return LocaleKeys.march.tr();
      case 4:
        return LocaleKeys.april.tr();
      case 5:
        return LocaleKeys.may.tr();
      case 6:
        return LocaleKeys.june.tr();
      case 7:
        return LocaleKeys.july.tr();
      case 8:
        return LocaleKeys.august.tr();
      case 9:
        return LocaleKeys.september.tr();
      case 10:
        return LocaleKeys.october.tr();
      case 11:
        return LocaleKeys.november.tr();
      case 12:
        return LocaleKeys.december.tr();
    }
    return '';
  }

  static Tuple2<DateTime, DateTime> getWeekRange() {
    DateTime now = DateTime.now();
    DateTime today = DateTime(
      now.year,
      now.month,
      now.day,
    );

    int weekday = now.weekday;

    DateTime begin = today.subtract(
      Duration(
        days: weekday - 1,
      ),
    );

    DateTime end = today.add(
      Duration(
        days: 7 - weekday,
      ),
    );

    return Tuple2(begin, end);
  }

  static String formatReadableDate(DateTime dateTime) {
    return '${GawDateUtil.monthName(dateTime.month)} ${dateTime.day}, ${dateTime.year}';
  }

  static String? tryFormatReadableDate(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return '${GawDateUtil.monthName(dateTime.month)} ${dateTime.day} ${dateTime.year}';
  }

  static DateTime fromApi(int dateTime) {
    return DateTime.fromMillisecondsSinceEpoch(dateTime * 1000).toLocal();
  }

  static DateTime? tryFromApi(int? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return fromApi(dateTime);
  }

  static int toApi(DateTime dateTime, {bool toEndOfDay = false}) {
    if (toEndOfDay) {
      dateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        23,
        59,
      );
    }

    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }

  static int? tryToApi(DateTime? dateTime, {bool toEndOfDay = false}) {
    if (dateTime == null) {
      return null;
    }

    return toApi(
      dateTime,
      toEndOfDay: toEndOfDay,
    );
  }

  static String formatTime(int time) {
    if (time < 10) {
      return '0$time';
    }
    return time.toString();
  }

  static String formatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return '${dateTime.day}/${dateTime.month}';
  }

  static String? tryFormatFullDate(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String formatFullDate(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String? tryFormatTimeInterval(DateTime? startTime, DateTime? endTime) {
    if (startTime == null || endTime == null) {
      return null;
    }

    return '${formatTime(startTime.hour)}:${formatTime(startTime.minute)} - ${formatTime(endTime.hour)}:${formatTime(endTime.minute)}';
  }

  static String formatTimeString(DateTime dateTime) {
    return '${formatTime(dateTime.hour)}:${formatTime(dateTime.minute)}';
  }

  static String formatTimeInterval(DateTime startTime, DateTime endTime) {
    return '${formatTime(startTime.hour)}:${formatTime(startTime.minute)} - ${formatTime(endTime.hour)}:${formatTime(endTime.minute)}';
  }

  static String formatDateInterval(DateTime? startDate, DateTime? endDate) {
    if (startDate == null && endDate == null) {
      return LocaleKeys.anytime.tr();
    }
    return '${startDate == null ? '...' : GawDateUtil.formatDate(startDate)} - ${endDate == null ? '...' : GawDateUtil.formatDate(endDate)}';
  }

  static String formatFullDateInterval(DateTime? startDate, DateTime? endDate) {
    if (startDate == null && endDate == null) {
      return LocaleKeys.anytime.tr();
    }
    return '${startDate == null ? '...' : GawDateUtil.formatFullDate(startDate)} - ${endDate == null ? '...' : GawDateUtil.formatFullDate(endDate)}';
  }
}
