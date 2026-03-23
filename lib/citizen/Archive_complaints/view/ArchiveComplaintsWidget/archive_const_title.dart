import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/static.dart';

class ArchiveConstTitle extends StatelessWidget {
  const ArchiveConstTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'تقديم شكوى رسمية ',
      style: TextStyle(
        fontFamily: Static.cairo,
        fontWeight: FontWeight.w400,
        fontSize: Static.getwidth(context, 20),
        color: Static.basiccolor,
      ),
    );
  }
}
