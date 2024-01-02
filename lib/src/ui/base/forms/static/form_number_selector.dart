import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class FormNumberSelector extends StatelessWidget {
  final String label;

  final bool active;

  const FormNumberSelector({
    super.key,
    required this.label,
    this.active = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: 21,
      decoration: BoxDecoration(
        color: active ? GawTheme.secondaryTint : GawTheme.unselectedMainTint,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: MainText(
          label,
          color: GawTheme.mainTintText,
        ),
      ),
    );
  }
}
