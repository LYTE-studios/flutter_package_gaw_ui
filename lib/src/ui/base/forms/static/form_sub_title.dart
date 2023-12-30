import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class FormSubTitle extends StatelessWidget {
  final String label;

  const FormSubTitle({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return MainText(
      label,
      textStyleOverride: TextStyles.titleStyle.copyWith(
        color: GawTheme.unselectedText,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
