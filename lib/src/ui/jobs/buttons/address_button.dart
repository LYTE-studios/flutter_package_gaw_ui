import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class AddressButton extends StatelessWidget {
  final String label;

  const AddressButton({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: PaddingSizes.extraSmallPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: GawTheme.mainTint,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.smallPadding,
            vertical: PaddingSizes.extraSmallPadding,
          ),
          child: MainText(
            label,
            color: GawTheme.clearText,
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
