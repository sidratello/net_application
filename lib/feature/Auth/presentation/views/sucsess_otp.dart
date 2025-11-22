import 'package:flutter/material.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/wedjet_for_otp/custom_success_otp.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {

        return const Scaffold(
  
           backgroundColor: Color(0xFFF5F5F5), 
        
      body:const customsuccessotp() ,
    );
  }
  }