import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class DropdownInputField extends StatelessWidget {
  final String hint;

  // A map of <value, display_text>
  final Map<String, String> options;

  final Function(String?) callback;

  final String? value;

  const DropdownInputField({
    super.key,
    required this.hint,
    required this.options,
    required this.callback,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = [];

    for (var e in options.entries) {
      items.add(DropdownMenuItem(
        value: e.key,
        child: MainText(
          e.value,
          color: GawTheme.text,
        ),
      ));
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: GawTheme.darkBackground),
      ),
      child: DropdownButton<String>(
        onChanged: callback,
        value: value,
        dropdownColor: GawTheme.clearText,
        focusColor: GawTheme.background,
        hint: MainText(hint),
        underline: Container(),
        items: items,
        elevation: 1,
        padding: const EdgeInsets.symmetric(horizontal: PaddingSizes.smallPadding),
      ),
    );
  }
}
