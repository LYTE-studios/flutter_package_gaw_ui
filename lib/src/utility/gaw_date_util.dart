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

  static String formatTime(int time) {
    if (time < 10) {
      return '0$time';
    }
    return time.toString();
  }

  static String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}';
  }

  static String formatTimeInterval(DateTime startTime, DateTime endTime) {
    return '${formatTime(startTime.hour)}:${formatTime(startTime.minute)} - ${formatTime(endTime.hour)}:${formatTime(endTime.minute)}';
  }

  static formatDateInterval(DateTime? startDate, DateTime? endDate) {
    if (startDate == null && endDate == null) {
      return 'Anytime';
    }
    return '${startDate == null ? '...' : GawDateUtil.formatDate(startDate)} - ${endDate == null ? '...' : GawDateUtil.formatDate(endDate)}';
  }
}
