import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class ApplyStatusButton extends StatelessWidget {

  final String? label;

  final Function()? onTap;

  const ApplyStatusButton({
    super.key,
    this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BaseStatusButton(
        label: label ?? LocaleKeys.applyForJob.tr(),
        color: GawTheme.mainTint,
      ),
    );
  }
}
