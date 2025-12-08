import 'package:flutter/material.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textStyle20italic = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w200, fontStyle: FontStyle.italic);
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyleblack = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const textStylewhite = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w200,
  );

    static const basicColor = Color.fromARGB(255, 0, 106, 113);

}

const TextStyle textStyle = TextStyle();
