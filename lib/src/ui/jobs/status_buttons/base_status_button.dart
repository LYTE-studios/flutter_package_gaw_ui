import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class BaseStatusButton extends StatelessWidget {
  final String label;

  final Color color;

  const BaseStatusButton({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: MainText(
          label,
          textStyleOverride: TextStyles.titleStyle.copyWith(
            color: GawTheme.clearText,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
