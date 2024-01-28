import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ApplyStatusButton extends StatelessWidget {
  final String? label;

  final Function()? onTap;

  final Color? color;

  const ApplyStatusButton({
    super.key,
    this.label,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BaseStatusButton(
        label: label ?? LocaleKeys.applyForJob.tr(),
        color: color ?? GawTheme.mainTint,
      ),
    );
  }
}
