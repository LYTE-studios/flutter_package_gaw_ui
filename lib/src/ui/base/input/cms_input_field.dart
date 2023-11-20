import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class CmsInputField extends StatefulWidget {
  final TextEditingController controller;

  final String? label;

  final String? hint;

  final bool isPasswordField;

  const CmsInputField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.isPasswordField = false,
  });

  @override
  State<CmsInputField> createState() => _CmsInputFieldState();
}

class _CmsInputFieldState extends State<CmsInputField> {
  late bool showValues = !widget.isPasswordField;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !showValues,
      enableSuggestions: !widget.isPasswordField,
      autocorrect: !widget.isPasswordField,
      controller: widget.controller,
      cursorColor: GawTheme.mainTint,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyles.mainStyle.copyWith(
          color: GawTheme.unselectedText,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: Borders.mainTintLightSide,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: Borders.lightSide,
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: Borders.lightSide,
          borderRadius: BorderRadius.circular(8),
        ),
        label: MainText(
          widget.label ?? '',
          color: GawTheme.unselectedText,
        ),
        suffixIcon: !widget.isPasswordField
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  setState(() {
                    showValues = !showValues;
                  });
                },
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: Center(
                    child: SizedBox(
                      height: 28,
                      width: 28,
                      child: SvgIcon(
                        showValues
                            ? PixelPerfectIcons.eyeHideNormal
                            : PixelPerfectIcons.eyeNormal,
                        color: GawTheme.unselectedText,
                      ),
                    ),
                  ),
                ),
              ),
        contentPadding: const EdgeInsets.all(
          PaddingSizes.smallPadding,
        ),
      ),
    );
  }
}
