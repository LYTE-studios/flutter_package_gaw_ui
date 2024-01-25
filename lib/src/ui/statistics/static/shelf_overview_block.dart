import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ShelfOverviewBlock extends StatelessWidget {
  final int? scheduledCount;

  final int? doneCount;

  const ShelfOverviewBlock({
    super.key,
    required this.scheduledCount,
    required this.doneCount,
  });

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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.mainPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StatisticsOverviewBlock(
                value: scheduledCount?.toString() ?? '',
                description: 'Jobs scheduled',
                paddingOverride: const EdgeInsets.symmetric(
                  vertical: PaddingSizes.bigPadding,
                ),
              ),
              StatisticsOverviewBlock(
                value: doneCount?.toString() ?? '',
                description: 'Jobs done',
                paddingOverride: const EdgeInsets.symmetric(
                  vertical: PaddingSizes.bigPadding,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
