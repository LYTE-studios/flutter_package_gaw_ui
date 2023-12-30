import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class RejectedStatusButton extends StatelessWidget {
  const RejectedStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStatusButton(
      color: GawTheme.error,
      label: LocaleKeys.rejected.tr(),
    );
  }
}
