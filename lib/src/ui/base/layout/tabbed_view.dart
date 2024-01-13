import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class TabbedView extends StatefulWidget {
  final List<String> tabs;

  final int selectedIndex;

  final List<Widget> pages;

  final Function(int)? onPageIndexChange;

  const TabbedView({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.pages,
    this.onPageIndexChange,
  });

  @override
  State<TabbedView> createState() => _TabbedViewState();
}

class _TabbedViewState extends State<TabbedView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: buildHeaders(),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: GawTheme.unselectedBackground,
            ),
            borderRadius: BorderRadius.circular(7),
            color: GawTheme.clearText,
          ),
          child: widget.pages[widget.selectedIndex],
        ),
      ],
    );
  }

  List<Widget> buildHeaders() {
    List<Widget> widgets = [];

    for (String label in widget.tabs) {
      int index = widget.tabs.indexOf(label);
      widgets.add(
        _TabHeader(
          label: label,
          selected: widget.selectedIndex == index,
          onTap: () {
            widget.onPageIndexChange?.call(index);
          },
        ),
      );
    }

    return widgets;
  }
}

class _TabHeader extends StatelessWidget {
  final String label;

  final bool selected;

  final Function()? onTap;

  const _TabHeader({
    required this.label,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: const EdgeInsets.only(left: PaddingSizes.smallPadding),
          padding: const EdgeInsets.only(
            top: PaddingSizes.mainPadding,
            left: PaddingSizes.bigPadding,
            right: PaddingSizes.bigPadding,
            bottom: PaddingSizes.smallPadding,
          ),
          decoration: BoxDecoration(
            boxShadow: selected
                ? const [
                    BoxShadow(
                      offset: Offset(0, 1.2),
                      blurRadius: 4.8,
                      spreadRadius: 0,
                      color: GawTheme.shadow,
                    ),
                  ]
                : [],
            color: selected
                ? GawTheme.mainTint
                : GawTheme.pickerBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: MainText(
            label,
            textStyleOverride: TextStyle(
              color: selected
                  ? GawTheme.secondaryTint
                  : GawTheme.unselectedText,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
