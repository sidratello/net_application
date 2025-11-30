
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:net_aplecation/core/units/app_Router.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_appbar.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/wedjet_for_otp/custom_body_section_for_OTP.dart';



import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_header.dart';

class customauthbodyOtp extends StatefulWidget {
  const customauthbodyOtp({super.key});

  @override
  State<customauthbodyOtp> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<customauthbodyOtp> {


  @override
  Widget build(BuildContext context) {
     // الخلفية الداكنة أعلى الشاشة
 

    return  SafeArea(
        child: SingleChildScrollView(
          
          child:Column(
          
            children: [
                       CustomAppBar(
                onTap:() {
  context.go(AppRouter.kloginView);
                },
              ),
            CustomHeader(
  title: "التحقق من البريد الإلكتروني",
  subtitle: 'لقد أرسلنا رمز التحقق إلى بريدك الإلكتروني. أدخل الرمز المكون من 6 أرقام للمتابعة.',
),        
BodySectionOtp(),
                
                    
            ],
          ),

    
    ),
    );
              
            
          
        
      
    
  }
}
