import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/static.dart';

class HomeCitizenAppbarTitle extends StatelessWidget {
  const HomeCitizenAppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'مرحبا بك محمد الحاج',
      style: TextStyle(
        fontFamily: Static.cairo,
        fontWeight: FontWeight.w400,
        fontSize: Static.getwidth(context, 19),
        color: Static.basiccolor,
      ),
    );
  }
}
