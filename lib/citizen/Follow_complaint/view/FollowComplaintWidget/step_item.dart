import 'package:flutter/material.dart';

Widget stepItem(
  String title,
  IconData icon,
  bool active,
  Color activeColor,
  Color inactiveColor,
) {
  return Column(
    children: [
      Icon(
        icon,
        color: active ? activeColor : inactiveColor,
        size: active ? 28 : 24,
      ),
      SizedBox(height: 6),
      Text(
        title,
        style: TextStyle(
          fontFamily: "Cairo",
          fontSize: 13,
          color: active ? activeColor : inactiveColor,
        ),
      ),
    ],
  );
}
