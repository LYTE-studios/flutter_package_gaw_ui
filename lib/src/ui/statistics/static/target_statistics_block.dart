import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/icons/icon_block.dart';
import 'package:gaw_ui/src/ui/statistics/static/base_overview_block.dart';
import 'package:gaw_ui/src/ui/statistics/static/increment_description.dart';

class TargetStatisticsBlock extends StatelessWidget {
  final int jobsCount;

  final double increaseAmount;

  const TargetStatisticsBlock({
    super.key,
    required this.jobsCount,
    required this.increaseAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingSizes.smallPadding),
      child: BaseOverviewBlock(
        child: Padding(
          padding: const EdgeInsets.all(
            PaddingSizes.mainPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IconBlock(
                icon: PixelPerfectIcons.customUser,
              ),
              const Spacer(),
              MainText(
                'Jobs',
                textStyleOverride: TextStyles.titleStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  MainText(
                    jobsCount.toString(),
                    textStyleOverride: TextStyles.mainStyleTitle,
                  ),
                  const SizedBox(
                    width: PaddingSizes.smallPadding,
                  ),
                  IncrementDescription(
                    increment: increaseAmount,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}