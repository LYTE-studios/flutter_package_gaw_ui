import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/statistics/charts/progress_chart.dart';
import 'package:gaw_ui/src/ui/statistics/static/base_overview_block.dart';

class CircularProgressOverviewBlock extends StatelessWidget {
  final Color? color;

  final int value;

  final int maxValue;

  final String title;

  final String description;

  final bool isLoading;

  const CircularProgressOverviewBlock({
    super.key,
    this.color,
    required this.value,
    required this.maxValue,
    required this.title,
    required this.description,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        PaddingSizes.smallPadding,
      ),
      child: BaseOverviewBlock(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                PaddingSizes.mainPadding,
              ),
              child: ProgressChart(
                value: value,
                maxValue: maxValue,
                color: color,
                isLoading: isLoading,
              ),
            ),
            Center(
              child: MainText(
                title,
                alignment: TextAlign.center,
                textStyleOverride: TextStyles.mainStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: PaddingSizes.mainPadding,
                ),
                child: MainText(
                  description,
                  textStyleOverride: TextStyles.mainStyle.copyWith(
                    color: GawTheme.unselectedText,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
