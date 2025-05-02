import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class InputMultiSelectionForm extends StatefulWidget {
  final List<String> selectedOptions;
  final Map<String, Widget?> options;
  final Function(String)? onUpdate;
  final String? label;

  final double maxSize;

  final bool isMulti;

  const InputMultiSelectionForm({
    super.key,
    required this.selectedOptions,
    required this.options,
    this.onUpdate,
    this.label,
    this.isMulti = true,
    this.maxSize = 150,
  });

  @override
  State<InputMultiSelectionForm> createState() =>
      _InputMultiSelectionFormState();
}

class _InputMultiSelectionFormState extends State<InputMultiSelectionForm> {
  bool expanded = false;

  String getSelectedText() {
    if (widget.selectedOptions.isEmpty) {
      return 'Select';
    }

    String text = '';

    for (String option in widget.selectedOptions) {
      text += option;
      if (widget.selectedOptions.indexOf(option) !=
          widget.selectedOptions.length - 1) {
        text += ', ';
      }
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: InputForm(
        label: widget.label,
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          height: expanded ? widget.maxSize : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.fromBorderSide(
              Borders.lightUnselectedInputSide.copyWith(
                color: GawTheme.unselectedBackground,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClearInkWell(
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: SizedBox(
                  height: 42,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PaddingSizes.mainPadding,
                      vertical: PaddingSizes.mainPadding,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MainText(
                            getSelectedText(),
                            color: widget.selectedOptions.isEmpty
                                ? GawTheme.unselectedText
                                : GawTheme.text,
                          ),
                        ),
                        AnimatedRotation(
                          duration: const Duration(milliseconds: 200),
                          turns: expanded ? .5 : 0,
                          child: const SvgIcon(
                            PixelPerfectIcons.arrowDown,
                            size: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: !expanded
                      ? const SizedBox()
                      : SizedBox(
                          height: widget.maxSize - 44,
                          child: ListView(
                            children: widget.options.keys
                                .map((e) => _ViewItem(
                                      item: e,
                                      icon: widget.options[e],
                                      selected: (String value) {
                                        if (!widget.isMulti) {
                                          setState(() {
                                            expanded = false;
                                          });
                                        }
                                        widget.onUpdate?.call(value);
                                      },
                                      itemSelected:
                                          widget.selectedOptions.contains(
                                        e,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ViewItem extends StatelessWidget {
  final String item;
  final bool itemSelected;
  final Function(String)? selected;

  final Widget? icon;

  const _ViewItem({
    required this.item,
    required this.itemSelected,
    required this.selected,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.mainPadding,
        vertical: PaddingSizes.smallPadding,
      ),
      child: InkWell(
        onTap: () => selected?.call(item),
        child: Row(
          children: [
            SizedBox(
              height: 21,
              width: 21,
              child: SmallCheckBox(
                value: itemSelected,
                onToggle: () => selected?.call(item),
              ),
            ),
            icon == null
                ? const SizedBox()
                : Row(
                    children: [
                      const SizedBox(
                        width: PaddingSizes.smallPadding,
                      ),
                      SizedBox(
                        height: 21,
                        width: 21,
                        child: icon!,
                      ),
                    ],
                  ),
            const SizedBox(
              width: PaddingSizes.smallPadding,
            ),
            MainText(
              item,
            ),
          ],
        ),
      ),
    );
  }
}
