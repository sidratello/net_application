
import 'package:flutter/material.dart';

import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/wedjet_for_signup/custom_auth_body_signup.dart';

class SignUpscreen extends StatelessWidget {
  const SignUpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
  
           backgroundColor: Color(0xFFF5F5F5), 
        
      body:const customauthbodySignUp() ,
    );

  }
}