import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class AppInputField extends StatefulWidget {
  final TextEditingController controller;

  final String? hint;

  final bool isPasswordField;

  const AppInputField({
    super.key,
    required this.controller,
    this.hint,
    this.isPasswordField = false,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
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
        label: MainText(widget.hint ?? ''),
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
