import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/shadow/shadows.dart';

class JobListItem extends StatelessWidget {
  final Job job;

  const JobListItem({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: GawTheme.clearBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          Shadows.mainShadow,
        ],
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
