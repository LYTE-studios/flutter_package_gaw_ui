import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

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
