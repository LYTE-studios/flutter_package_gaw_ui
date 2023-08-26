import 'package:flutter/material.dart';

mixin ScreenStateMixin<T extends StatefulWidget> on State<T> {
  bool loading = false;

  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }
}
