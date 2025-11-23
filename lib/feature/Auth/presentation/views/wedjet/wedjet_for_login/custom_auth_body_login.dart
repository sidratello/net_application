
import 'package:flutter/material.dart';


import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/wedjet_for_login/custom_body_section_for_login.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_header.dart';

class customauthbodyLogin extends StatefulWidget {
  const customauthbodyLogin({super.key});

  @override
  State<customauthbodyLogin> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<customauthbodyLogin> {


  @override
  Widget build(BuildContext context) {
     // الخلفية الداكنة أعلى الشاشة
 

    return  SafeArea(
        child: SingleChildScrollView(
          
          child:Column(
          
            children: [
            CustomHeader(
              topPadding: 100,
  title: 'تسجيل دخول',
  subtitle: 'قم بادخال كلمة السر وبريدك الالكتروني لضمان سرية بياناتك والدخول بأمان ',
),        
bodysection(),
                
                    
            ],
          ),

    
    ),
    );
              
            
          
        
      
    
  }
}
