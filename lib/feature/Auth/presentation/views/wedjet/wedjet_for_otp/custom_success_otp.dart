import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:net_aplecation/core/units/app_Router.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_Butoom_for_auth.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_header.dart';

class customsuccessotp extends StatelessWidget {
  const customsuccessotp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
           padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 100),
           child: SingleChildScrollView(
             child: Column(
             
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   
               children: [
             
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFF4CAF50),
                  size: 120,
                ),
             
               
             CustomHeader(
               title: "Verification Successful!",
               subtitle: "Your email has been verified successfully." ,
               topPadding: 30,
             
             ),
             const SizedBox(height: 10),
             AppButton(text:     "Continue", onPressed: () {
                     context.go(AppRouter.kloginView);
               },
             
             ),
               ],
             ),
           ),
  
     );
  }
}

  