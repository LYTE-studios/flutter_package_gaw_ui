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
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Visibility(
          visible: showViewMore,
          child: InkWell(
            onTap: onViewMore,
            child: MainText(
              'View more +',
              textStyleOverride: TextStyles.mainStyle.copyWith(
                color: GawTheme.secondaryTint,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: PaddingSizes.mainPadding,
        ),
      ],
    );
  }
}
