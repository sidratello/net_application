import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/presentation/views/wedjet/custom_Butoom_for_auth.dart';
import 'package:flutter_application_1/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AppButton(
        text: "تسجيل الدخول",
        onPressed: () {
          context.go(AppRouter.kloginView);
        },
      ),
    );
  }
}
