class GawDateUtil {
  static String monthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
    }
    return '';
  }

  static String formatReadableDate(DateTime dateTime) {
    return '${GawDateUtil.monthName(dateTime.month)} ${dateTime.day}, ${dateTime.year}';
  }

  static DateTime fromApi(int dateTime) {
    return DateTime.fromMillisecondsSinceEpoch(dateTime * 1000);
  }

  static DateTime? tryFromApi(int? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(dateTime * 1000);
  }

  static int toApi(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch ~/ 1000;
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

  static String formatTimeInterval(DateTime startTime, DateTime endTime) {
    return '${formatTime(startTime.hour)}:${formatTime(startTime.minute)} - ${formatTime(endTime.hour)}:${formatTime(endTime.minute)}';
  }

  static String formatDateInterval(DateTime? startDate, DateTime? endDate) {
    if (startDate == null && endDate == null) {
      return 'Anytime';
    }
    return '${startDate == null ? '...' : GawDateUtil.formatDate(startDate)} - ${endDate == null ? '...' : GawDateUtil.formatDate(endDate)}';
  }

  static String formatFullDateInterval(DateTime? startDate, DateTime? endDate) {
    if (startDate == null && endDate == null) {
      return 'Anytime';
    }
    return '${startDate == null ? '...' : GawDateUtil.formatFullDate(startDate)} - ${endDate == null ? '...' : GawDateUtil.formatFullDate(endDate)}';
  }
}
