import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class GawDatePickerDialog extends StatelessWidget {
  final Function(DateTime)? onDateSelected;

  final DateTime? initialDate;

  const GawDatePickerDialog({
    super.key,
    this.onDateSelected,
    this.initialDate,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 420,
        width: 320,
        decoration: BoxDecoration(
          boxShadow: const [
            Shadows.heavyShadow,
          ],
          color: GawTheme.clearBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DateRangePicker(
          isSheet: false,
          singleDatePicker: true,
          onDateSelected: (DateTime date) {
            Navigator.pop(context);
            onDateSelected?.call(date);
          },
          initialStart: initialDate,
        ),
      ),
    );
  }
}
