import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/presentation/views/wedjet/wedjet_for_otp/Custom_auth_body_otp.dart';

class OTPscreen extends StatelessWidget {
  const OTPscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: customauthbodyOtp(),
    );
  }
}
