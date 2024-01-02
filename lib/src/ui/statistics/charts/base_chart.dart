import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseChart extends StatelessWidget {
  final Function()? onChangeView;

  final Function()? onTap;

  const BaseChart({
    super.key,
    this.onChangeView,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 340,
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
            Borders.mainSide,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            Shadows.mainShadow,
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
