import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class IconBlock extends StatelessWidget {
  final String icon;

  const IconBlock({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: GawTheme.secondaryTint,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 16,
        width: 16,
        child: Center(
          child: SvgIcon(
            icon,
            color: GawTheme.clearBackground,
          ),
        ),
      ),
    );
  }
}
