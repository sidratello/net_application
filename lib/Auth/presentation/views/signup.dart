import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/presentation/views/wedjet/wedjet_for_signup/custom_auth_body_signup.dart';

class SignUpscreen extends StatelessWidget {
  const SignUpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),

      body: customauthbodySignUp(),
    );
  }
}
