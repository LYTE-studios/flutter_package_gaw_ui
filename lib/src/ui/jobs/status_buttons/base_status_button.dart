import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class BaseStatusButton extends StatelessWidget {
  final String label;

  final Color color;

  final bool loading;

  const BaseStatusButton({
    super.key,
    required this.label,
    required this.color,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: loading
            ? const SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  color: GawTheme.mainTintText,
                ),
              )
            : MainText(
                label,
                textStyleOverride: TextStyles.titleStyle.copyWith(
                  color: GawTheme.clearText,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
      ),
    );
  }
}
