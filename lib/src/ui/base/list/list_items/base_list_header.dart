import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseListHeader extends StatelessWidget {
  final Map<Widget, double> items;

  final bool selected;
  final Function(bool?)? onUpdate;
  final Function()? onSelected;

  final List<int>? sortableIndexes;

  const BaseListHeader({
    super.key,
    required this.items,
    this.selected = false,
    this.onUpdate,
    this.onSelected,
    this.sortableIndexes,
  });

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
        padding: EdgeInsets.only(
          left: onUpdate == null
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
              ...widgets
            ],
          ),
        ),
      ),
    );
  }
}
