import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class TimeRangePickerDialog extends StatefulWidget {
  final Function(DateTime start, DateTime end)? onSubmit;

  final DateTime? initialStart;

  final DateTime? initialEnd;

  final String? title;

  const TimeRangePickerDialog({
    super.key,
    this.onSubmit,
    this.initialStart,
    this.initialEnd,
    this.title,
  });

  @override
  State<TimeRangePickerDialog> createState() => _TimeRangePickerState();
}

class _TimeRangePickerState extends State<TimeRangePickerDialog> {
  late int hourStart = widget.initialStart?.hour ?? 12;
  late int minuteStart = widget.initialStart?.minute ?? 0;

  late int hourEnd = widget.initialEnd?.hour ?? 12;
  late int minuteEnd = widget.initialEnd?.minute ?? 0;

  void _timeChanged(int hour, int minute) {
    setState(() {
      hourStart = hour;
      minuteStart = minute;
    });
  }

  void closeDialog() {
    Navigator.of(context).pop();
  }

  void _timeChangedFinished(int hour, int minute) {
    setState(() {
      hourEnd = hour;
      minuteEnd = minute;
      //isResetEnabled = (hourStart != hourInitial || minuteStart != minuteInitial);
    });
  }

  void _confirmTimesAndNavigate(BuildContext context) {
    DateTime startDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      hourStart,
      minuteStart,
    );
    DateTime endDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      hourEnd,
      minuteEnd,
    );

    Navigator.of(context).pop();

    widget.onSubmit?.call(startDate, endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 380,
        width: 320,
        decoration: BoxDecoration(
          color: GawTheme.clearBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8.0),
                // Adjust the padding as needed
                margin: const EdgeInsets.only(bottom: 4.0),
                // This adds space below the title
                decoration: const BoxDecoration(
                  color: GawTheme.shadow,
                  // Adjust the background color as needed
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: GawTheme.text,
                      width: 0.1,
                    ),
                  ),
                  boxShadow: [
                    Shadows.heavyShadow,
                  ],
                ),
                child: MainText(
                  // TODO COPY
                  widget.title ?? 'Select times',
                  textStyleOverride: TextStyles.mainStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14, // Adjust the font size as needed
                    color: GawTheme.text, // Adjust the text color as needed
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Create Time Picker or DropdownButton widgets here for hour and minute
                  Expanded(
                    child: CustomTimeRangePicker(
                      isStart: true,
                      hour: hourStart,
                      minute: minuteStart,
                      onTimeChanged: _timeChanged,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Text('I finished at:'),
                  // Create Time Picker or DropdownButton widgets here for hour and minute
                  Expanded(
                    child: CustomTimeRangePicker(
                      isStart: false,
                      hour: hourEnd,
                      minute: minuteEnd,
                      onTimeChanged: _timeChangedFinished,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //const SizedBox(width: 8), // Adjust as needed
                  ElevatedButton(
                    onPressed: () {
                      // Handle time confirmation logic here
                      _confirmTimesAndNavigate(context);
                      //closeDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GawTheme.secondaryTint,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: MainText(
                      // TODO COPY
                      'Confirm times',
                      textStyleOverride: TextStyles.mainStyle.copyWith(
                        color: GawTheme.clearText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

//for tweaking
class CustomTimeRangePicker extends StatefulWidget {
  final bool isStart;
  final Function(int, int) onTimeChanged;

  final int hour;

  final int minute;

  const CustomTimeRangePicker({
    super.key,
    required this.isStart,
    required this.onTimeChanged,
    required this.hour,
    required this.minute,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTimeRangePickerState createState() => _CustomTimeRangePickerState();
}

class _CustomTimeRangePickerState extends State<CustomTimeRangePicker> {
  late FixedExtentScrollController hourController;
  late FixedExtentScrollController minuteController;
  late int selectedHour = widget.hour;
  late int selectedMinute = widget.minute;

  @override
  void initState() {
    super.initState();
    hourController = FixedExtentScrollController(initialItem: selectedHour);
    minuteController = FixedExtentScrollController(initialItem: selectedMinute);
  }

  @override
  Widget build(BuildContext context) {
    // The intrinsic height of ListWheelScrollView is determined by the children's extent.
    // For instance, if itemExtent is 40 and you want to show 3 items, the height will be 120.
    double itemExtent = 40;
    int itemCount =
        3; // Adjust based on how many items you want to show at once
    double pickerHeight = itemExtent * itemCount * 0.9;

    return Stack(
      children: <Widget>[
        Positioned(
          top: itemExtent * (itemCount / 2) - (itemExtent / 2),
          // This ensures we are centering the selected item
          left: 0,
          right: 0,
          child: Container(
            height: itemExtent * 0.75,
            decoration: BoxDecoration(
              color: GawTheme.shadow,
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
                width: 0.1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: pickerHeight,
          // This ensures we are not giving it infinite height
          child: Row(
            children: <Widget>[
              const SizedBox(width: 32), // Adjust as needed
              Container(
                alignment: Alignment.center,
                child: MainText(
                  // TODO COPY
                  widget.isStart ? 'Start time:' : 'End time:',
                  alignment: TextAlign.center,
                  textStyleOverride: TextStyles.mainStyle.copyWith(
                    fontSize: 12,
                    color: GawTheme.text,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: ListWheelScrollView.useDelegate(
                  controller: hourController,
                  itemExtent: itemExtent,
                  physics: const FixedExtentScrollPhysics(),
                  overAndUnderCenterOpacity: 0.5,
                  perspective: 0.01,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedHour = index;
                      widget.onTimeChanged(selectedHour, selectedMinute);
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      return Center(
                        child: MainText(
                          // TODO COPY
                          '$index h',
                          textStyleOverride: TextStyles.mainStyle.copyWith(
                            color: GawTheme.text,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                    childCount: 24,
                  ),
                ),
              ),
              Expanded(
                child: ListWheelScrollView.useDelegate(
                  controller: minuteController,
                  itemExtent: itemExtent,
                  physics: const FixedExtentScrollPhysics(),
                  overAndUnderCenterOpacity: 0.5,
                  perspective: 0.01,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedMinute = index;
                      widget.onTimeChanged(selectedHour, selectedMinute);
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      return Center(
                        child: MainText(
                          // TODO COPY
                          '$index min',
                          textStyleOverride: TextStyles.mainStyle.copyWith(
                            color: GawTheme.text,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                    childCount: 60,
                  ),
                ),
              ),
              const SizedBox(width: 16), // Adjust as needed
            ],
          ),
        ),
      ],
    );
  }
}
