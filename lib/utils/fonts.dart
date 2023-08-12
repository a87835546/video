import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle title() {
    return GoogleFonts.zenKakuGothicNew(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.2000000477,
      color: Color(0xff000000),
    );
  }

  static TextStyle subTitle() {
    return GoogleFonts.zenKakuGothicNew(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.2000000477,
      color: Color(0xff757575),
    );
  }

  static TextStyle sub(double size, Color? c) {
    return GoogleFonts.zenKakuGothicNew(
      fontSize: size,
      fontWeight: FontWeight.w400,
      height: 1.2000000477,
      color: c ?? Color(0xff757575),
    );
  }
}
