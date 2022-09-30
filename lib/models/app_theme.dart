import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color ndsnPink = Color.fromARGB(255, 248, 73, 186);
  static const Color palePink = Color.fromARGB(255, 247, 122, 203);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black =Color.fromARGB(255, 0, 0, 0);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color lime = Color.fromRGBO(240, 203, 148, 1);
  static const Color orange = Color.fromRGBO(255, 158, 107, 1);
  static const Color primaryLight = Color.fromRGBO(240, 234, 248, 1);
  static const Color imgBG = Color.fromRGBO(230, 230, 254, 1);
   static const Color lightGrey=Color.fromARGB(255, 235, 233, 233);

  static const String fontName = 'lato';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );


  static const TextStyle display1 = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontSize: 25,
    letterSpacing: 0.3,
    fontWeight:FontWeight.w300,
    height: 0.9,
    color: white,
  );

    static const TextStyle menu = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontSize: 20,
    fontWeight: FontWeight.w200,
    color: white,
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: black,
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: black,
  );

  static const TextStyle title2 = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    letterSpacing: 0.30,
    color: black,
  );
  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: black,
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: black,
  );
  static const TextStyle monthStyle = TextStyle(
    color: orange,
    fontSize: 16,
    fontWeight: FontWeight.w500
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: black,
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: black,
  );

    static const TextStyle caption2 = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: ndsnPink,
  );

  static const TextStyle username = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    letterSpacing: 0.2,
    color: black,
  );

}
