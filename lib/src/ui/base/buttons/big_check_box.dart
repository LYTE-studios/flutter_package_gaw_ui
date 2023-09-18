import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class BigCheckBox extends StatelessWidget {
  final Function(bool value)? onTap;

  final bool value;

  const BigCheckBox({
    super.key,
    this.onTap,
    this.value = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(!value);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: value ? GawTheme.mainTint : GawTheme.text,
          ),
        ),
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
