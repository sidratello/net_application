import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/static.dart';

class HomeCitizenNotification extends StatelessWidget {
  const HomeCitizenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Static.getwidth(context, 40),
        height: Static.getheight(context, 40),
        decoration: BoxDecoration(
          color: Static.basiccolor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.notifications_none,
          color: Colors.white,
          size: Static.getwidth(context, 24),
        ),
      ),
    );
  }
}
