class DateTimeUtil {
  static String toHoursMinutes(DateTime time) {
    return '${time.hour}:${time.minute}';
  }

  static String toHoursMinutesInterval(DateTime start, DateTime end) {
    return '${toHoursMinutes(start)} - ${toHoursMinutes(end)}';
  }

  static String toMonthYear(DateTime date) {
    return '${date.month} / ${date.year}';
  }
}
