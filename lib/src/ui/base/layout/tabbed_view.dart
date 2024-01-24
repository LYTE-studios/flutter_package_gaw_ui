import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class TabbedView extends StatefulWidget {
  final List<String> tabs;

  final int selectedIndex;

  final List<Widget> pages;

  final Function(int)? onPageIndexChange;

  final bool isScreenSheet;

  const TabbedView({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.pages,
    this.onPageIndexChange,
    this.isScreenSheet = false,
  });

  @override
  State<TabbedView> createState() => _TabbedViewState();
}

class _TabbedViewState extends State<TabbedView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: buildHeaders(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: GawTheme.unselectedBackground,
              ),
              boxShadow: const [
                Shadows.heavyShadow,
              ],
              borderRadius: widget.isScreenSheet
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )
                  : BorderRadius.circular(7),
              color: GawTheme.clearBackground,
            ),
            child: widget.pages[widget.selectedIndex],
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.smallPadding,
      ),
      child: ColorlessInkWell(
        onTap: onTap,
        child: Container(
          height: 36,
          width: 120,
          decoration: BoxDecoration(
            boxShadow: const [
              Shadows.mainShadow,
            ],
            color: selected
                ? GawTheme.unselectedMainTint
                : GawTheme.unselectedBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: MainText(
              label,
              textStyleOverride: TextStyle(
                color:
                    selected ? GawTheme.secondaryTint : GawTheme.unselectedText,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
