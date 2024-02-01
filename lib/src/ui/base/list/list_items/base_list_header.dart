import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseListHeader extends StatelessWidget {
  final Map<String, double> items;

  final bool selected;
  final Function(bool?)? onUpdate;
  final Function()? onSelected;

  const BaseListHeader({
    super.key,
    required this.items,
    this.selected = false,
    this.onUpdate,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    items.forEach(
      (label, width) {
        widgets.add(
          SizedBox(
            width: width,
            child: BaseHeaderItem(
              label: label,
            ),
          ),
        );
      },
    );

    widgets.add(
      const Spacer(),
    );

    return Container(
      height: 45,
      decoration: const BoxDecoration(
        color: GawTheme.clearBackground,
        border: Border(
          top: Borders.lightSide,
          bottom: Borders.lightSide,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSizes.smallPadding + PaddingSizes.bigPadding,
        ),
        child: Row(
          children: [
            Visibility(
              visible: onUpdate != null,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: PaddingSizes.smallPadding,
                ),
                child: SizedBox(
                  height: 21,
                  width: 21,
                  child: SmallCheckBox(
                    value: selected,
                    color: GawTheme.mainTint,
                    onToggle: () => onUpdate?.call(!selected),
                  ),
                ),
              ),
            ),
            ...widgets
          ],
        ),
      ),
    );
  }
}
