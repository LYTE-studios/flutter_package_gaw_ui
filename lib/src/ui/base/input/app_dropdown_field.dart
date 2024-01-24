import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class DropdownInputField extends StatelessWidget {
  final String? hint;

  // A map of <value, display_text>
  final Map<String, String> options;

  final Function(String?)? onChanged;
  final Function(String)? onSelected;

  final String? value;

  const DropdownInputField({
    super.key,
    this.hint,
    required this.options,
    this.onChanged,
    this.onSelected,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = [];

    for (var e in options.entries) {
      items.add(
        DropdownMenuItem(
          onTap: () => onSelected?.call(e.key),
          value: e.key,
          child: MainText(
            e.value,
            color: GawTheme.text,
          ),
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(
          Borders.lightUnselectedInputSide.copyWith(
            color: GawTheme.unselectedBackground,
          ),
        ),
      ),
      child: DropdownButton<String>(
        onChanged: onChanged,
        value: value,
        dropdownColor: GawTheme.clearText,
        focusColor: GawTheme.background,
        hint: hint == null ? const SizedBox() : MainText(hint!),
        underline: Container(),
        items: items,
        elevation: 1,
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSizes.smallPadding,
        ),
      ),
    );
  }
}
