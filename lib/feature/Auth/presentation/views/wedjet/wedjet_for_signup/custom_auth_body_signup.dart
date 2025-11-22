
import 'package:flutter/material.dart';




import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/wedjet_for_signup/custom_body_section_for_signup.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_header.dart';

class customauthbodySignUp extends StatefulWidget {
  const customauthbodySignUp({super.key});

  @override
  State<customauthbodySignUp> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<customauthbodySignUp> {


  @override
  Widget build(BuildContext context) {
     // الخلفية الداكنة أعلى الشاشة
 

    return  SafeArea(
        child: SingleChildScrollView(
          
          child:Column(
          
            children: [

          CustomHeader(
  title: 'Create Account',
  subtitle: 'Enter your information to create a new account and get started.',
),

     
               
BodySectionSignup(),
                
           
            ],
          ),

    
    ),
    );
              
            
          
        
      
    
  }
}
