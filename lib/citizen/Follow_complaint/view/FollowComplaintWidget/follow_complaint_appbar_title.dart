import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/static.dart';

class FollowComplaintAppbarTitle extends StatelessWidget {
  const FollowComplaintAppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'متابعة الشكوى الحالية',
      style: TextStyle(
        fontFamily: Static.cairo,
        fontWeight: FontWeight.w400,
        fontSize: Static.getwidth(context, 19),
        color: Static.basiccolor,
      ),
    );
  }
}
