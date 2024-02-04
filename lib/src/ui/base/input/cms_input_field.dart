import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class CmsInputField extends StatefulWidget {
  final TextEditingController controller;

  final String? label;

  final String? hint;

  final bool isPasswordField;

  final Function()? onSubmitted;

  final bool enabled;

  const CmsInputField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.isPasswordField = false,
    this.enabled = true,
    this.onSubmitted,
  });

  @override
  State<CmsInputField> createState() => _CmsInputFieldState();
}

class _CmsInputFieldState extends State<CmsInputField> {
  late bool showValues = !widget.isPasswordField;

  late final FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(
        () {},
      );
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      enabled: widget.enabled,
      obscureText: !showValues,
      enableSuggestions: !widget.isPasswordField,
      autocorrect: !widget.isPasswordField,
      controller: widget.controller,
      cursorColor: GawTheme.mainTint,
      onSubmitted: (_) => widget.onSubmitted?.call(),
      decoration: InputStyles.mainDecoration.copyWith(
        floatingLabelStyle: TextStyles.mainStyle.copyWith(
          color:
              focusNode.hasFocus ? GawTheme.mainTint : GawTheme.unselectedText,
        ),
        hintText: widget.hint,
        hintStyle: TextStyles.mainStyle.copyWith(
          color: GawTheme.unselectedText,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: Borders.lightSelectedInputSide,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: Borders.lightUnselectedInputSide,
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: Borders.lightUnselectedInputSide,
          borderRadius: BorderRadius.circular(8),
        ),
        label: MainText(
          widget.label ?? '',
        ),
        suffixIcon: !widget.isPasswordField
            ? const SizedBox()
            : ColorlessInkWell(
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
                        !showValues
                            ? PixelPerfectIcons.eyeHideNormal
                            : PixelPerfectIcons.eyeNormal,
                        color: showValues
                            ? GawTheme.mainTint
                            : GawTheme.unselectedText,
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
