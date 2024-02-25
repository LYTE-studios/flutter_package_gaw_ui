import 'package:gaw_ui/gaw_ui.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tuple/tuple.dart';

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
          DateTime(
            DateTime.now().year,
          ),
          DateTime(
            DateTime.now().year + 1,
          ),
        );
      case DateIntervalSelectable.lastYear:
        return PickerDateRange(
          DateTime(
            DateTime.now().year - 1,
          ),
          DateTime(
            DateTime.now().year,
          ),
        );
      case DateIntervalSelectable.thisMonth:
        return PickerDateRange(
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
          ),
          DateTime(
            DateTime.now().year,
            DateTime.now().month + 1,
          ),
        );
      case DateIntervalSelectable.lastMonth:
        return PickerDateRange(
          DateTime(
            DateTime.now().year,
            DateTime.now().month - 1,
          ),
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
          ),
        );
      case DateIntervalSelectable.thisWeek:
        {
          Tuple2<DateTime, DateTime> dateRange = GawDateUtil.getWeekRange();

          return PickerDateRange(
            dateRange.item1,
            dateRange.item2,
          );
        }

      case DateIntervalSelectable.lastWeek:
        {
          Tuple2<DateTime, DateTime> dateRange = GawDateUtil.getWeekRange();

          return PickerDateRange(
            dateRange.item1.subtract(
              const Duration(
                days: 7,
              ),
            ),
            dateRange.item2.subtract(
              const Duration(
                days: 7,
              ),
            ),
          );
        }
    }
  }

  String getLabel() {
    switch (this) {
      // TODO COPY
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
