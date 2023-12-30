import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ApprovedStatusButton extends StatelessWidget {
  const ApprovedStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStatusButton(
      label: LocaleKeys.approved.tr(),
      color: GawTheme.success,
    );
  }
}
