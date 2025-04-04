import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class PendingStatusButton extends StatelessWidget {
  const PendingStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStatusButton(
      color: GawTheme.unselectedBackground,
      label: LocaleKeys.pending.tr(),
    );
  }
}
