import 'package:syncfusion_flutter_datepicker/datepicker.dart';

enum DateIntervalSelectable {
  thisYear,
  lastYear,
  thisMonth,
  lastMonth,
  thisWeek,
  lastWeek,
}

extension DateIntervalSelectableExtension on DateIntervalSelectable {
  PickerDateRange getDateRange() {
    switch (this) {
      case DateIntervalSelectable.thisYear:
        return PickerDateRange(
            DateTime(DateTime.now().year), DateTime(DateTime.now().year + 1));
      case DateIntervalSelectable.lastYear:
        return PickerDateRange(
            DateTime(DateTime.now().year - 1), DateTime(DateTime.now().year));
      case DateIntervalSelectable.thisMonth:
        return PickerDateRange(
            DateTime(DateTime.now().year, DateTime.now().month),
            DateTime(DateTime.now().year, DateTime.now().month + 1));
      case DateIntervalSelectable.lastMonth:
        return PickerDateRange(
            DateTime(DateTime.now().year, DateTime.now().month - 1),
            DateTime(DateTime.now().year, DateTime.now().month));
      case DateIntervalSelectable.thisWeek:
        return PickerDateRange(
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 7),
            DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day));
      case DateIntervalSelectable.lastWeek:
        return PickerDateRange(
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 14),
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 7));
    }
  }

  String getLabel() {
    switch (this) {
      case DateIntervalSelectable.thisYear:
        return 'This year';
      case DateIntervalSelectable.lastYear:
        return 'Last year';
      case DateIntervalSelectable.thisMonth:
        return 'This month';
      case DateIntervalSelectable.lastMonth:
        return 'Last month';
      case DateIntervalSelectable.thisWeek:
        return 'This week';
      case DateIntervalSelectable.lastWeek:
        return 'Last week';
    }
  }
}
