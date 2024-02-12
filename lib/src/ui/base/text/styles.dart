import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle mainStyle = GoogleFonts.inter().copyWith(
    letterSpacing: 0,
  );

  static TextStyle mainStyleTitle = mainStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: 0,
  );

  static const TextStyle titleStyle = TextStyle(
    fontFamily: 'General Sans',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    letterSpacing: 0,
  );
}
