import 'package:flutter/material.dart';

class FollowImage extends StatelessWidget {
  const FollowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/images/complaint.png",
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
