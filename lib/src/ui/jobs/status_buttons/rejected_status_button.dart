import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/base_state_block.dart';

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