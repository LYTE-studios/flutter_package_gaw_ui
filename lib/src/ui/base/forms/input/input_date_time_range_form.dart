import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/date/date_picker_dialog.dart';
import 'package:gaw_ui/src/ui/base/date/time_range_picker_dialog.dart';
import 'package:gaw_ui/src/ui/base/forms/input/input_form.dart';

class InputDateTimeRangeForm extends StatelessWidget {
  final String? label;

  final DateTime? startTime;
  final DateTime? endTime;

  final bool enabled;

  final Function(DateTime)? onSelectDate;
  final Function(DateTime start, DateTime end)? onSelectTimeRange;

  const InputDateTimeRangeForm({
    super.key,
    this.label,
    this.startTime,
    this.endTime,
    this.onSelectDate,
    this.enabled = true,
    this.onSelectTimeRange,
  });

  @override
  Widget build(BuildContext context) {
    return InputForm(
      label: label,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GawStandaloneDatePicker(
              date: startTime,
              endDate: endTime,
              onUpdateDate: onSelectDate,
            ),
          ),
          const SizedBox(
            width: PaddingSizes.mainPadding,
          ),
          Expanded(
            child: GawStandaloneTimeRangePicker(
              startTime: startTime,
              endTime: endTime,
              onUpdateTimes: onSelectTimeRange,
            ),
          ),
        ],
      ),
    );
  }
}

class GawStandaloneTimeRangePicker extends StatelessWidget {
  final DateTime? startTime;

  final DateTime? endTime;

  final bool enabled;

  final Function(DateTime start, DateTime end)? onUpdateTimes;

  const GawStandaloneTimeRangePicker({
    super.key,
    this.startTime,
    this.endTime,
    this.onUpdateTimes,
    this.enabled = true,
  });

  void showPicker(BuildContext context) {
    if (!enabled) {
      return;
    }
    DialogUtil.show(
      dialog: TimeRangePickerDialog(
        onSubmit: onUpdateTimes,
        initialStart: startTime,
        initialEnd: endTime,
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColorlessInkWell(
      onTap: () => showPicker(context),
      child: GawStandaloneTextField(
        enabled: false,
        icon: PixelPerfectIcons.clockNormal,
        hint: 'Job time',
        text: GawDateUtil.tryFormatTimeInterval(startTime, endTime),
      ),
    );
  }
}

class GawStandaloneDatePicker extends StatelessWidget {
  final Function(DateTime)? onUpdateDate;

  final DateTime? date;

  final DateTime? endDate;

  const GawStandaloneDatePicker({
    super.key,
    this.date,
    this.endDate,
    this.onUpdateDate,
  });

  void showPicker(BuildContext context) {
    DialogUtil.show(
      dialog: GawDatePickerDialog(
        initialDate: date,
        onDateSelected: onUpdateDate,
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    String? currentDateInterval;

    if (date != null && endDate != null) {
      if (date!.day != endDate!.day) {
        currentDateInterval = GawDateUtil.formatFullDateInterval(date, endDate);
      }
    }

    return ColorlessInkWell(
      onTap: () => showPicker(context),
      child: GawStandaloneTextField(
        enabled: false,
        hint: 'Job date',
        icon: PixelPerfectIcons.calendarMedium,
        text: currentDateInterval ?? GawDateUtil.tryFormatFullDate(date),
      ),
    );
  }
}
