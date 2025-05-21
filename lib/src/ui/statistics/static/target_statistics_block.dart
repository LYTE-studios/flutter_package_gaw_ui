import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/icons/icon_block.dart';
import 'package:gaw_ui/src/ui/statistics/static/base_overview_block.dart';
import 'package:gaw_ui/src/ui/statistics/static/increment_description.dart';

class TargetStatisticsBlock extends StatelessWidget {
  final int? jobsCount;

  final int? candidatesCount;

  final double increaseAmount;

  final bool loading;

  const TargetStatisticsBlock({
    super.key,
    this.jobsCount,
    this.candidatesCount,
    required this.increaseAmount,
    this.loading = false,
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
          child: LoadingSwitcher(
            loading: loading,
            child: Row(
              children: [
                if (jobsCount != null)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const IconBlock(
                          icon: PixelPerfectIcons.timeDiamondpNormal,
                        ),
                        const Spacer(),
                        MainText(
                          LocaleKeys.jobs.tr(),
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
                if (candidatesCount != null)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const IconBlock(
                          icon: PixelPerfectIcons.customUser,
                        ),
                        const Spacer(),
                        MainText(
                          'Shifts',
                          textStyleOverride: TextStyles.titleStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        MainText(
                          candidatesCount.toString(),
                          textStyleOverride: TextStyles.mainStyleTitle,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
