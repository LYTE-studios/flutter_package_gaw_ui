import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/forms/input/input_form.dart';

class InputMultiSelectionForm extends StatefulWidget {
  final List<String> selectedOptions;
  final Map<String, Widget?> options;
  final Function(String)? onUpdate;
  final String? label;

  final bool isMulti;

  const InputMultiSelectionForm({
    super.key,
    required this.selectedOptions,
    required this.options,
    this.onUpdate,
    this.label,
    this.isMulti = true,
  });

  @override
  State<InputMultiSelectionForm> createState() =>
      _InputMultiSelectionFormState();
}

class _InputMultiSelectionFormState extends State<InputMultiSelectionForm> {
  final ExpansionTileController controller = ExpansionTileController();

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
    return InputForm(
      label: widget.label,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.fromBorderSide(
            Borders.lightUnselectedInputSide.copyWith(
              color: GawTheme.unselectedBackground,
            ),
          ),
        ),
        child: ExpansionTile(
          controller: controller,
          title: MainText(
            getSelectedText(),
            color: widget.selectedOptions.isEmpty
                ? GawTheme.unselectedText
                : GawTheme.text,
          ),
          collapsedTextColor: GawTheme.text,
          textColor: GawTheme.text,
          iconColor: GawTheme.text,
          collapsedShape: const RoundedRectangleBorder(),
          shape: const RoundedRectangleBorder(),
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.options.length,
              itemBuilder: (BuildContext context, int index) {
                return _ViewItem(
                  item: widget.options.keys.toList()[index],
                  icon: widget.options.values.toList()[index],
                  selected: (String value) {
                    if (!widget.isMulti) {
                      setState(() {
                        controller.collapse();
                      });
                    }
                    widget.onUpdate?.call(value);
                  },
                  itemSelected: widget.selectedOptions.contains(
                    widget.options.keys.toList()[index],
                  ),
                );
              },
            ),
          ],
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
