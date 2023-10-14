import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class FormTitle extends StatelessWidget {
  final String label;

  const FormTitle({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return MainText(
      label,
      textStyleOverride: TextStyles.titleStyle.copyWith(
        color: GawTheme.text,
        fontSize: 21,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
