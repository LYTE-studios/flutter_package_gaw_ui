import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class InputTextForm extends StatelessWidget {
  final String? hint;

  const InputTextForm({
    super.key,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputStyles.largeDecoration.copyWith(
        contentPadding: const EdgeInsets.all(
          PaddingSizes.smallPadding,
        ),
        hintText: hint,
      ),
    );
  }
}
