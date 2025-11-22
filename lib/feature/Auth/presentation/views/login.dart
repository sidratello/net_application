
import 'package:flutter/material.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/wedjet_for_login/custom_auth_body_login.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
           backgroundColor: Color(0xFFF5F5F5), 
      body:const customauthbodyLogin() ,
    );

  }
}