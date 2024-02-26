import 'package:flutter/cupertino.dart';

class SizeUtil {
  static bool isBigSize(BuildContext context) {
    return MediaQuery.of(context).size.height > 720;
  }
}
