import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle mainStyle = GoogleFonts.inter();

  static TextStyle mainStyleTitle = mainStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle titleStyle = TextStyle(
    fontFamily: 'General Sans',
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
}
