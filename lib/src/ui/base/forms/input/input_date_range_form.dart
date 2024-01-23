import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/date/date_range_picker_dialog.dart';
import 'package:gaw_ui/src/ui/base/forms/input/input_form.dart';

class InputDateRangeForm extends StatelessWidget {
  final String? label;

  final String? hint;

  final DateTime? start;

  final DateTime? end;

  final Function(DateTime start, DateTime end)? onUpdateDates;

  const InputDateRangeForm({
    super.key,
    this.label,
    this.hint,
    this.start,
    this.end,
    this.onUpdateDates,
  });

  void showPicker(BuildContext context) {
    DialogUtil.show(
      dialog: GawDateRangePickerDialog(
        initialStart: start,
        initialEnd: end,
        onRangeSelected: onUpdateDates,
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InputForm(
      label: label,
      child: ColorlessInkWell(
        onTap: () => showPicker(context),
        child: GawStandaloneTextField(
          hint: hint,
          text: GawDateUtil.formatFullDateInterval(
            start,
            end,
          ),
          icon: PixelPerfectIcons.calendarMedium,
          enabled: false,
        ),
      ),
    );
  }
}
