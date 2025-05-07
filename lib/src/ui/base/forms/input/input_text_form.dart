import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaw_ui/gaw_ui.dart';

class InputTextForm extends StatelessWidget {
  final String? label;
  final String? hint;
  final double? fontSize;
  final TextEditingController? controller;
  final Function(String)? callback;
  final bool enabled;
  final bool frozen;
  final String? text;
  final bool number;
  final String? icon;
  final int? lines;

  const InputTextForm({
    super.key,
    this.label,
    this.hint,
    this.fontSize,
    this.controller,
    this.callback,
    this.enabled = true,
    this.frozen = false,
    this.text,
    this.number = false,
    this.icon,
    this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return InputForm(
      label: label,
      child: GawStandaloneTextField(
        hint: hint,
        fontSize: fontSize,
        controller: controller,
        callback: callback,
        enabled: enabled,
        text: text,
        number: number,
        icon: icon,
        frozen: frozen,
        lines: lines,
      ),
    );
  }
}

class GawStandaloneTextField extends StatefulWidget {
  final String? hint;
  final double? fontSize;
  final TextEditingController? controller;
  final Function(String)? callback;
  final bool enabled;
  final bool frozen;
  final String? text;
  final bool number;
  final String? icon;
  final int? lines;

  const GawStandaloneTextField({
    super.key,
    this.hint,
    this.fontSize,
    this.controller,
    this.callback,
    this.enabled = true,
    this.frozen = false,
    this.text,
    this.number = false,
    this.icon,
    this.lines,
  });

  @override
  State<GawStandaloneTextField> createState() => _GawStandaloneTextFieldState();
}

class _GawStandaloneTextFieldState extends State<GawStandaloneTextField> {
  late final TextEditingController _controller = widget.controller ??
      TextEditingController(
        text: widget.text,
      );

  @override
  Widget build(BuildContext context) {
    if (widget.text != null) {
      _controller.text = widget.text ?? '';
    }

    return widget.frozen
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: GawTheme.specialBackground,
              border: const Border.fromBorderSide(
                Borders.lightSide,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: PaddingSizes.mainPadding + 2,
              horizontal: PaddingSizes.mainPadding,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: MainText(
                _controller.text,
                textStyleOverride: TextStyles.mainStyle.copyWith(
                  fontSize: widget.fontSize ?? 14,
                  color: GawTheme.text,
                ),
              ),
            ),
          )
        : TextField(
            maxLines: widget.lines ?? 1,
            keyboardType: widget.number ? TextInputType.number : null,
            inputFormatters:
                widget.number ? [FilteringTextInputFormatter.digitsOnly] : null,
            onChanged: widget.callback,
            enabled: widget.enabled,
            decoration: InputStyles.largeLightDecoration.copyWith(
              suffixIcon: widget.icon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.all(
                        PaddingSizes.mainPadding,
                      ),
                      child: SizedBox(
                        height: 21,
                        width: 21,
                        child: SvgIcon(
                          widget.icon!,
                          color: GawTheme.text,
                        ),
                      ),
                    ),
              contentPadding: const EdgeInsets.all(
                PaddingSizes.mainPadding,
              ),
              hintStyle: TextStyles.mainStyle
                  .copyWith(fontSize: widget.fontSize ?? 14),
              labelStyle: TextStyles.mainStyle
                  .copyWith(fontSize: widget.fontSize ?? 14),
              hintText: widget.hint,
            ),
            style: TextStyles.mainStyle.copyWith(
              fontSize: widget.fontSize ?? 14,
              color: GawTheme.text,
              fontWeight: FontWeight.w500,
            ),
            controller: _controller,
          );
  }
}
