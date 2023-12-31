import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

// TODO: Check style

class StatisticsSummaryBlock extends StatelessWidget {
  final int averageHours;
  final int trendHours;
  final bool isPositiveTrend;

  const StatisticsSummaryBlock({
    Key? key,
    required this.averageHours,
    required this.trendHours,
    required this.isPositiveTrend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trendIcon =
        isPositiveTrend ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    final trendColor = isPositiveTrend ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: GawTheme.clearBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            '${averageHours}h',
            alignment: TextAlign.end,
            textStyleOverride: TextStyles.titleStyle.copyWith(
              fontSize: 32,
              height: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: PaddingSizes.extraMiniPadding,
              ),
              const MainText(
                'On average',
                textStyleOverride: TextStyle(
                  color: GawTheme.unselectedText,
                  fontSize: 12,
                ),
              ),
              Icon(
                trendIcon,
                size: 28,
                color: trendColor,
              ),
              MainText(
                '${trendHours}h',
                textStyleOverride: TextStyle(
                  color: trendColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          // Add more Text widgets for other summary data as needed
        ],
      ),
    );
  }
}
