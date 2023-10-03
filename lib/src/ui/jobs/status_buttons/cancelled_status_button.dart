import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/status_buttons/base_status_button.dart';

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
