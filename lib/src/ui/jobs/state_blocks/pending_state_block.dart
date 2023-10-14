import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/base_state_block.dart';

class PendingStateBlock extends StatelessWidget {
  const PendingStateBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateBlock(
      color: GawTheme.unselectedBackground.withOpacity(0.4),
      label: LocaleKeys.pending.tr(),
      textColor: GawTheme.text.withOpacity(
        0.6,
      ),
      hasBorder: true,
      iconName: PixelPerfectIcons.clockNormal,
      isLeadingIcon: true,
    );
  }
}
