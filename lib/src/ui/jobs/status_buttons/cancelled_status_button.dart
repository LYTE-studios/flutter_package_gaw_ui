import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class CancelledStatusButton extends StatelessWidget {
  const CancelledStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStatusButton(
      label: LocaleKeys.cancelled.tr(),
      color: GawTheme.error,
    );
  }
}
