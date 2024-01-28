import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class GawDivider extends StatelessWidget {
  const GawDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 2,
      color: GawTheme.unselectedText.withOpacity(
        0.1,
      ),
    );
  }
}
