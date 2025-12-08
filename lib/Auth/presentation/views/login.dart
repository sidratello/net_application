import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/presentation/views/wedjet/wedjet_for_login/custom_auth_body_login.dart'
    show customauthbodyLogin;

// ignore: camel_case_types
class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: customauthbodyLogin(),
    );
  }
}
