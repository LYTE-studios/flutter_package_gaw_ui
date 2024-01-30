import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/jobs/state_blocks/base_state_block.dart';

class ApprovedStateBlock extends StatelessWidget {
  const ApprovedStateBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateBlock(
      color: GawTheme.success,
      iconName: PixelPerfectIcons.checkMedium,
      label: LocaleKeys.approved.tr(),
      isLeadingIcon: true,
    );
  }
}
