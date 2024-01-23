import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/forms/input/input_form.dart';

class InputTextForm extends StatelessWidget {
  final String? label;
  final String? hint;
  final double? fontSize;
  final TextEditingController? controller;
  final Function(String)? callback;
  final bool enabled;
  final String? text;
  final bool number;
  final String? icon;

  const InputTextForm({
    super.key,
    this.label,
    this.hint,
    this.fontSize,
    this.controller,
    this.callback,
    this.enabled = true,
    this.text,
    this.number = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    controller?.text = text ?? '';

    return InputForm(
      label: label,
      child: TextField(
        keyboardType: number ? TextInputType.number : null,
        inputFormatters:
            number ? [FilteringTextInputFormatter.digitsOnly] : null,
        onChanged: callback,
        enabled: enabled,
        decoration: InputStyles.largeLightDecoration.copyWith(
          prefixIcon: icon == null
              ? null
              : Center(
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: SvgIcon(
                      icon!,
                      color: GawTheme.text,
                    ),
                  ),
                ),
          contentPadding: const EdgeInsets.all(
            PaddingSizes.smallPadding,
          ),
          hintStyle: TextStyles.mainStyle.copyWith(fontSize: fontSize ?? 14),
          labelStyle: TextStyles.mainStyle.copyWith(fontSize: fontSize ?? 14),
          hintText: hint,
        ),
        controller: controller,
      ),
    );
  }
}
