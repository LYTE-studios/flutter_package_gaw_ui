import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/statistics/static/base_overview_block.dart';

/// Overview block to display count statistics
class StatisticsOverviewBlock extends StatelessWidget {
  /// The count/value to display
  final String value;

  /// Description to the block
  final String description;

  final EdgeInsets? paddingOverride;

  const StatisticsOverviewBlock({
    super.key,
    required this.value,
    required this.description,
    this.paddingOverride,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingOverride ??
          const EdgeInsets.symmetric(
            vertical: PaddingSizes.extraBigPadding,
            horizontal: PaddingSizes.smallPadding,
          ),
      child: BaseOverviewBlock(
        child: Padding(
          padding: const EdgeInsets.only(
            top: PaddingSizes.bigPadding,
            left: PaddingSizes.bigPadding,
            bottom: PaddingSizes.bigPadding,
            right: PaddingSizes.smallPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainText(
                value,
                textStyleOverride: TextStyles.titleStyle.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              MainText(
                description,
                textStyleOverride: TextStyles.mainStyle.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: GawTheme.statsText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
