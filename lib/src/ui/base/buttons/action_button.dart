import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ActionButton extends StatelessWidget {
  final Function()? onTap;

  final String label;

  const ActionButton({
    super.key,
    this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ColorlessInkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(PaddingSizes.mainPadding),
        child: Container(
          height: 36,
          width: 120,
          decoration: BoxDecoration(
            color: GawTheme.clearBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: MainText(
              label,
              textStyleOverride: TextStyles.mainStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
