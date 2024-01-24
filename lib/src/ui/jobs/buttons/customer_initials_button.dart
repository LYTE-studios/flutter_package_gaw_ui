import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class CustomerInitialsButton extends StatelessWidget {
  final String initials;

  const CustomerInitialsButton({
    super.key,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: GawTheme.darkBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: MainText(
        initials,
        color: GawTheme.clearText,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
