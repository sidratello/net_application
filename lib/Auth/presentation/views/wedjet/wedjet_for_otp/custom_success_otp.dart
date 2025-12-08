import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/presentation/views/wedjet/custom_Butoom_for_auth.dart';
import 'package:flutter_application_1/Auth/presentation/views/wedjet/custom_header.dart';
import 'package:flutter_application_1/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class customsuccessotp extends StatelessWidget {
  const customsuccessotp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 120),

            CustomHeader(
              title: " 🎉 تم التحقق بنجاح    ",
              subtitle:
                  "تم تأكيد بريدك الإلكتروني بنجاح يمكنك الآن تسجيل الدخول إلى حسابك.",
              topPadding: 30,
            ),
            const SizedBox(height: 10),
            AppButton(
              text: "اكمال ",
              onPressed: () {
                context.go(AppRouter.kloginView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
