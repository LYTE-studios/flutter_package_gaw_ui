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

  final bool loading;

  const StatisticsOverviewBlock({
    super.key,
    required this.value,
    required this.description,
    this.paddingOverride,
    this.loading = false,
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
        child: LoadingSwitcher(
          loading: loading,
          child: Padding(
            padding: const EdgeInsets.only(
              top: PaddingSizes.mainPadding,
              left: PaddingSizes.mainPadding,
              bottom: PaddingSizes.mainPadding,
              right: PaddingSizes.mainPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainText(
                  value,
                  alignment: TextAlign.left,
                  textStyleOverride: TextStyles.titleStyle.copyWith(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: GawTheme.text,
                  ),
                ),
                MainText(
                  description,
                  alignment: TextAlign.left,
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
      ),
    );
  }
}
