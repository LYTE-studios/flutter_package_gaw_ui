import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ShelfOverviewBlock extends StatelessWidget {
  const ShelfOverviewBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        PaddingSizes.smallPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: GawTheme.mainTint,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 180,
              child: StatisticsOverviewBlock(
                value: '5',
                description: 'Jobs scheduled',
                paddingOverride: EdgeInsets.symmetric(
                  vertical: PaddingSizes.bigPadding,
                ),
              ),
            ),
            SizedBox(
              width: 180,
              child: StatisticsOverviewBlock(
                value: '5',
                description: 'Jobs done',
                paddingOverride: EdgeInsets.symmetric(
                  vertical: PaddingSizes.bigPadding,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
