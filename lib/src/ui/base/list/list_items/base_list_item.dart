import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseListItem extends StatelessWidget {
  final Map<Widget, double> items;

  final bool selected;
  final Function(bool?)? onUpdate;
  final Function()? onSelected;

  const BaseListItem({
    super.key,
    required this.items,
    this.selected = false,
    this.onUpdate,
    this.onSelected,
  });

  static List<Widget> inflateRow(List<Widget> widgets) {
    widgets.insert(
      widgets.length - 1,
      const Spacer(),
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    items.forEach((widget, width) {
      widgets.add(
        SizedBox(
          width: width,
          child: widget,
        ),
      );
    });

    return ColorlessInkWell(
      onTap: onSelected,
      child: Container(
        height: 56,
        decoration: const BoxDecoration(
          border: Border(
            bottom: Borders.lightSide,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: onSelected == null
                ? PaddingSizes.bigPadding
                : PaddingSizes.mainPadding,
            right: PaddingSizes.bigPadding,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingSizes.smallPadding,
            ),
            child: Row(
              children: [
                Visibility(
                  visible: onUpdate != null,
                  child: ColorlessInkWell(
                    onTap: () => onUpdate?.call(!selected),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: PaddingSizes.mainPadding,
                        right: PaddingSizes.mainPadding,
                        bottom: PaddingSizes.mainPadding,
                      ),
                      child: Container(
                        width: 21,
                        height: 21,
                        decoration: BoxDecoration(
                          color:
                              selected ? GawTheme.mainTint : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: selected
                              ? null
                              : Border.all(
                                  width: 1,
                                  color: GawTheme.unselectedText,
                                ),
                        ),
                        child: selected
                            ? const SvgIcon(
                                PixelPerfectIcons.checkMedium,
                                color: GawTheme.mainTintText,
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: inflateRow(widgets),
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
