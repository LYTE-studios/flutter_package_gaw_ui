import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/jobs/state_blocks/base_state_block.dart';

class ApplyStateBlock extends StatelessWidget {
  const ApplyStateBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseStateBlock(
      color: GawTheme.mainTint,
      // TODO COPY
      label: 'Apply',
      iconName: PixelPerfectIcons.arrowRightCircleMedium,
    );
  }
}
