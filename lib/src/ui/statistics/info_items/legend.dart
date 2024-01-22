import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  final List<Widget> items;

  const Legend({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        left: 8,
      ), // Add padding if needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: items,
      ),
    );
  }
}
