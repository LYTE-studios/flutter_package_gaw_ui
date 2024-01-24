import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class GawDateRangePickerDialog extends StatelessWidget {
  final Function(DateTime, DateTime)? onRangeSelected;

  final DateTime? initialStart;

  final DateTime? initialEnd;

  const GawDateRangePickerDialog({
    super.key,
    this.onRangeSelected,
    this.initialStart,
    this.initialEnd,
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
          onRangeSelected: (DateTime start, DateTime end) {
            Navigator.pop(context);
            onRangeSelected?.call(start, end);
          },
          initialStart: initialStart,
          initialEnd: initialEnd,
        ),
      ),
    );
  }
}
