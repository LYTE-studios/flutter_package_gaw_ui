import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/jobs/state_blocks/base_state_block.dart';

class ApprovedStateBlock extends StatelessWidget {
  const ApprovedStateBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseStateBlock(
      color: GawTheme.success,
      // TODO COPY
      label: 'Approved',
    );
  }
}
