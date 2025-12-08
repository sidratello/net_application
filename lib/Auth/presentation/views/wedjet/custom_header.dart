import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/units/styles.dart';

class CustomHeader extends StatelessWidget {
  final String title; // العنوان (مثل Log In)
  final String subtitle; // الوصف تحت العنوان
  final double topPadding;
  final double bottomPadding;

  const CustomHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.topPadding = 50,
    this.bottomPadding = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: 20,
        right: 20,
        bottom: bottomPadding,
      ),
      child: Column(
        children: [
          Text(title, textAlign: TextAlign.center, style: styles.textStyle30),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: styles.textStyle16,
          ),
        ],
      ),
    );
  }
}
