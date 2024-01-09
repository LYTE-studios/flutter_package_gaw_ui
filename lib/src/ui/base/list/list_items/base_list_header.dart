import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseListHeader extends StatelessWidget {
  final Map<String, double> items;

  const BaseListHeader({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    items.forEach((label, width) {
      widgets.add(
        SizedBox(
          width: width,
          child: MainText(
            label,
            textStyleOverride: TextStyles.mainStyleTitle.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    });

    widgets.add(
      const Spacer(),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.bigPadding,
      ),
      child: Container(
        height: 48,
        decoration: const BoxDecoration(
          border: Border(
            bottom: Borders.mainSide,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.smallPadding,
          ),
          child: Row(
            children: widgets,
          ),
        ),
      ),
    );
  }
}
