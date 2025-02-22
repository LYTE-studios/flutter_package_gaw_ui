import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class CompletedStatusButton extends StatelessWidget {
  const CompletedStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStatusButton(
      label: LocaleKeys.completed.tr(),
      color: GawTheme.success,
    );
  }
}
