import 'package:flutter/material.dart';

mixin ScreenStateMixin<T extends StatefulWidget> on State<T> {
  bool loading = false;

  void setData(void Function()? update) {
    if (!this.mounted) {
      return;
    }
    try {
      setState(() {
        update?.call();
      });
    } catch (error) {}
  }

  void setLoading(bool value) {
    if (!this.mounted) {
      return;
    }
    try {
      setState(() {
        loading = value;
      });
    } catch (eror) {}
  }
}
