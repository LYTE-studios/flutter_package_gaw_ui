import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/status_buttons/base_status_button.dart';

class ApplyStatusButton extends StatelessWidget {
  final Function()? onTap;

  const ApplyStatusButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const BaseStatusButton(
        label: 'Apply for job',
        color: GawTheme.mainTint,
      ),
    );
  }
}
