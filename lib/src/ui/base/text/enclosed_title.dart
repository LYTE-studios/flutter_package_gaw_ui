import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class EnclosedTitle extends StatelessWidget {
  final String label;

  const EnclosedTitle({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 128,
      decoration: BoxDecoration(
        color: GawTheme.mainTint,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: MainText(
          label,
          textStyleOverride: TextStyles.titleStyle.copyWith(
            color: GawTheme.mainTintText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
