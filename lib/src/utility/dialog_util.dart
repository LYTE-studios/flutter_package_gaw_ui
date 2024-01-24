import 'package:flutter/material.dart';

class DialogUtil {
  static Future<void> show({
    required Widget dialog,
    required BuildContext context,
  }) async {
    await showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) {
        return dialog;
      },
    );
  }
}
