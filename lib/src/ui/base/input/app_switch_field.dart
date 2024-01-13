import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class SwitchInputField extends StatelessWidget {
  final bool value;
  final Function(bool) callback;

  const SwitchInputField({
    required this.value,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          value: value,
          onChanged: callback,
          activeColor: GawTheme.mainTint,
          inactiveThumbColor: GawTheme.clearText,
          inactiveTrackColor: GawTheme.toolBarItem,
        ),
      ),
    );
  }
}
