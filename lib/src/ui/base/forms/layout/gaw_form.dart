import 'package:flutter/material.dart';

class GawForm extends StatelessWidget {
  final List<Widget> rows;

  const GawForm({
    super.key,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: rows,
      ),
    );
  }
}
