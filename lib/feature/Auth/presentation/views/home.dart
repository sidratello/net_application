import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:net_aplecation/core/units/app_Router.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_Butoom_for_auth.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: AppButton(
                          
                                text: "تسجيل الدخول",
                            onPressed:(){
                          
                          
                             context.go(AppRouter.kloginView);
                            }
                          
                                      ),
                        );
          }
       }
