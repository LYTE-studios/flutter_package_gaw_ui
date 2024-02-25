import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/jobs/state_blocks/base_state_block.dart';

class PendingStateBlock extends StatelessWidget {
  const PendingStateBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateBlock(
      color: GawTheme.unselectedBackground.withOpacity(0.4),
      // TODO COPY
      label: 'Pending',
      textColor: GawTheme.text.withOpacity(
        0.6,
      ),
      hasBorder: true,
      iconName: PixelPerfectIcons.clockNormal,
      isLeadingIcon: true,
    );
  }
}
