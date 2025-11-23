import 'package:flutter/material.dart';
import 'package:net_aplecation/core/units/styles.dart';

class AppButton extends StatelessWidget {
  final String text;                 // نص الزر
  final VoidCallback? onPressed;      // حدث الضغط
  final Color color;                 // لون الخلفية
  final TextStyle? textStyle;        // ستايل النص
  final double height;               // ارتفاع الزر

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color.fromARGB(255, 103, 199, 140),
    this.textStyle = styles.textStyle16,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const StadiumBorder(),
          elevation: 2,
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
