import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class GawDivider extends StatelessWidget {
  const GawDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: GawTheme.text.withOpacity(
        0.2,
      ),
    );
  }
}
