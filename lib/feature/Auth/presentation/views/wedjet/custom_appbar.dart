import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomAppBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
         alignment: Alignment.centerRight, 
      child:      GestureDetector(
        onTap: onTap ?? () {
          // السلوك الافتراضي لو ما تم تمرير onTap من برّة
          if (context.canPop()) {
            context.pop();
          }},
        child: Container(
           margin: const EdgeInsets.only(top: 8, left: 12), // ↓ تقليل المساحة
          height: 25,          // ↓ كان 42 → الآن أصغر
          width: 25,
          decoration: BoxDecoration(
            color: const Color(0xFFEFEFEF), // اللون الرمادي اللي بالصورة
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
