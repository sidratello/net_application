import 'package:flutter/material.dart';

abstract class styles {
    static const textStyle30 = TextStyle(
    fontSize: 30,
    // fontFamily: 'Sen', // ← تقدر تضيف اسم الخط هنا
    fontWeight: FontWeight.bold, 
color: Colors.black
  );

    static const textStyle16 = TextStyle(
    fontSize: 16,
    // fontFamily: 'Sen', // ← تقدر تضيف اسم الخط هنا
    fontWeight: FontWeight.w400, 
 color: Color.fromARGB(179, 62, 53, 53),
  );


  static const textStyle24 = TextStyle(
    fontSize: 24,           // 24 أقرب للتصميم
    fontWeight: FontWeight.bold,
    color: Color(0xFF222222),
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    // height: 1.4,
    color: Color(0xFF777777),
  );

    static const button16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

}
