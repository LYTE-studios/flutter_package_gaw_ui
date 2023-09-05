import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class InitialsAvatar extends StatelessWidget {
  final String initials;

  const InitialsAvatar({super.key, required this.initials});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: GawTheme.unselectedBackground,
      ),
      child: Center(
        child: MainText(
          initials,
          alignment: TextAlign.center,
          textStyleOverride: TextStyles.titleStyle.copyWith(
            fontSize: 14,
            color: GawTheme.unselectedText,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
