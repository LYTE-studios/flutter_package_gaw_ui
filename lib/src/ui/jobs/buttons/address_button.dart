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
          border: Border.fromBorderSide(
            Borders.mainSide.copyWith(
              color: GawTheme.secondaryTint.withOpacity(0.6),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.smallPadding,
            vertical: PaddingSizes.extraSmallPadding,
          ),
          child: MainText(
            label,
            color: GawTheme.secondaryTint.withOpacity(0.4),
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
