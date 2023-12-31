import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/statistics/static/statistics_legend_item.dart';

class StatisticsLegend extends StatelessWidget {
  const StatisticsLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8), // Add padding if needed
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StatisticsLegendItem(
            color: GawTheme.mainTint,
            text: 'Completed jobs',
          ),
          SizedBox(width: PaddingSizes.extraBigPadding),
          // Adjust the space as needed
          StatisticsLegendItem(
            color: GawTheme.secondaryTint,
            text: 'Scheduled jobs',
          ),
        ],
      ),
    );
  }
}
