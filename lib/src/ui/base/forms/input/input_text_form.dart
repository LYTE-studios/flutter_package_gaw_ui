import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaw_ui/gaw_ui.dart';

class InputTextForm extends StatelessWidget {
  final String? hint;
  final double? fontSize;
  final Function(String)? callback;
  final bool enabled;
  final String? text;
  final bool number;

  const InputTextForm({
    super.key,
    this.hint,
    this.fontSize,
    this.callback,
    this.enabled = true,
    this.text,
    this.number = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: number ? TextInputType.number : null,
      inputFormatters: number ? [FilteringTextInputFormatter.digitsOnly] : null,
      onChanged: callback,
      enabled: enabled,
      decoration: InputStyles.largeDecoration.copyWith(
        contentPadding: const EdgeInsets.all(
          PaddingSizes.smallPadding,
        ),
        hintStyle: TextStyle(fontSize: fontSize),
        labelStyle: TextStyle(fontSize: fontSize),
        hintText: hint,
      ),
      controller: TextEditingController(text: text),
    );
  }
}
