import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle mainStyle = GoogleFonts.sourceSans3();

  static TextStyle mainStyleTitle = mainStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle titleStyle = TextStyle(fontFamily: 'General Sans');
}
