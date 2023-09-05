import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class BaseStateBlock extends StatelessWidget {
  final Color color;

  final Color? textColor;

  final String label;

  final String? iconName;

  const BaseStateBlock({
    super.key,
    required this.color,
    this.textColor,
    required this.label,
    this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 112,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainText(
            label,
            color: textColor ?? GawTheme.mainTintText,
          ),
          SizedBox(
            width: iconName == null ? 0 : PaddingSizes.smallPadding,
          ),
          iconName == null
              ? const SizedBox.shrink()
              : SvgIcon(
                  iconName!,
                  color: textColor ?? GawTheme.mainTintText,
                ),
        ],
      ),
    );
  }
}
