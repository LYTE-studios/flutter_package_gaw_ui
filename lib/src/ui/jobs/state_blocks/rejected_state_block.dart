import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/base_state_block.dart';

class RejectedStateBlock extends StatelessWidget {
  const RejectedStateBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseStateBlock(
      color: GawTheme.error,
      label: 'Rejected X',
    );
  }
}
