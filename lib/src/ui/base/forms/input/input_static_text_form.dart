import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/forms/input/input_form.dart';

class InputStaticTextForm extends StatelessWidget {
  final String? label;

  final String? hint;
  final String? text;

  final bool frozen;

  final Function()? onTap;

  final String? icon;

  const InputStaticTextForm({
    super.key,
    this.label,
    this.hint,
    this.text,
    this.onTap,
    this.frozen = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InputForm(
      label: label,
      child: ColorlessInkWell(
        onTap: onTap,
        child: GawStandaloneTextField(
          hint: hint,
          text: text,
          icon: icon,
          frozen: frozen,
          enabled: false,
        ),
      ),
    );
  }
}
