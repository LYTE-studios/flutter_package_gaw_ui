import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class ListSubTitle extends StatelessWidget {
  final String label;

  final bool showViewMore;

  final Function()? onViewMore;

  const ListSubTitle({
    super.key,
    required this.label,
    this.showViewMore = false,
    this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: PaddingSizes.mainPadding,
        ),
        MainText(
          label,
          textStyleOverride: TextStyles.mainStyleTitle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        const Spacer(),
        Visibility(
          visible: showViewMore,
          child: InkWell(
            onTap: onViewMore,
            child: MainText(
              '${LocaleKeys.viewAll.tr()} +',
              textStyleOverride: TextStyles.mainStyle.copyWith(
                color: GawTheme.secondaryTint,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: PaddingSizes.bigPadding,
        ),
      ],
    );
  }
}