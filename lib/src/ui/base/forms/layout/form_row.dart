import 'package:flutter/material.dart';

class FormRow extends StatelessWidget {
  final List<Widget> formItems;

  const FormRow({
    super.key,
    required this.formItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: formItems,
    );
  }
}
