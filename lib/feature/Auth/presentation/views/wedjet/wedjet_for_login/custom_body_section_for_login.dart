
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:net_aplecation/core/units/app_Router.dart';
import 'package:net_aplecation/core/units/server_locater.dart';
import 'package:net_aplecation/core/units/styles.dart';
import 'package:net_aplecation/core/validation.dart';
import 'package:net_aplecation/feature/Auth/presentation/manager/logincubit/login_cubit.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/custom_snack.dart';

import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_Butoom_for_auth.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_text_field.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/wedjet_for_signup/custom_disapear_and_apear_icon.dart';
import 'package:net_aplecation/singlr_servese.dart';
class bodysection extends StatefulWidget {
  const bodysection({super.key});

  @override
  State<bodysection> createState() => _bodysectionState();
}

class _bodysectionState extends State<bodysection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    bool _passwordVisible = false;
    final _formKey = GlobalKey<FormState>();

      @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
                key: _formKey,
        child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  
                              
                                    
                                  const SizedBox(height: 8),
                             
                                      AppTextField(
                                        controller: emailController,
                                        validator: validateEmail,
            hint: 'Email address',
            background: Colors.white,
            keyboardType: TextInputType.emailAddress,
            prefix: const Icon(Icons.mail_outline_rounded,
             color: Color.fromARGB(255, 13, 12, 12)
                ),
          ),
        
                                  
             
            
                                  const SizedBox(height: 16),
                                  
                            
                           
                                  AppTextField(
            hint: 'Password',
                    controller: passwordController,
                                        validator: validatePassword,
            background: Colors.white,
        obscure: !_passwordVisible, 
            prefix: const Icon(Icons.lock_outline_rounded,
                color: Color.fromARGB(255, 13, 12, 12)
                ),
           suffix: PasswordVisibilityIcon(
    visible: _passwordVisible,
    onPressed: () {
      setState(() {
        _passwordVisible = !_passwordVisible;
      });
    },
  ),
              
                ),
          
                              
                                         
                      
                             
                                                      
                                  
                                  const SizedBox(height: 40),

          
 BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) async {
                    if (state is loginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errMessage,
                        
                    ),
                 backgroundColor: Colors.grey,
     

                        ),
                        
                      );
//                       showBeautifulSnackBar(
//   context,
//   message: state.errMessage,
// );

                    }

                    if (state is loginSuccess) {
             
 
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                   context.go(AppRouter.khome);
                    }
                  },
                  builder: (context, state) {
                    if (state is loginLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return 

                                  AppButton(
          text: "LOG IN",
          onPressed: () {
               
                if (_formKey.currentState!.validate()) {
        context.read<LoginCubit>().fetchdatalogin(
      
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
         
        );
          };
          },);
        
                  },
 
 ),



        
                                  
                                  const SizedBox(height: 28),
                                  
                                  // Footer: Don't have an account? SIGN UP
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      Text(
                                        "Don't have an account?  ",
                                        style: styles.textStyle14,
                                      ),
        GestureDetector(
          onTap: () {
            context.go(AppRouter.ksignupView);
          },
          child: Text(
            'Sign UP here',
            style: styles.textStyle14.copyWith(
        color: Color.fromARGB(255, 88, 138, 106),
        fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
                                    ],
                              
                                  ),
                                                      
                                                    
                                        
                                   
                                ],
                              
                          
                          
            
                          
              ),
      ),
    );
  }
}