import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomAppBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child:      GestureDetector(
        onTap: () {
          if (context.canPop()) {
            // لو فيه صفحة قبل نقدر نرجع لها
            context.pop();
          } 
        },
        child: Container(
           margin: const EdgeInsets.only(top: 8, left: 12), // ↓ تقليل المساحة
          height: 25,          // ↓ كان 42 → الآن أصغر
          width: 25,
          decoration: BoxDecoration(
            color: const Color(0xFFEFEFEF), // اللون الرمادي اللي بالصورة
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
