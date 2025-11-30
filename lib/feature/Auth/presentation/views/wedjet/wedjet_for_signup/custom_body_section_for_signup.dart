
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:net_aplecation/core/units/app_Router.dart';
import 'package:net_aplecation/core/units/styles.dart';
import 'package:net_aplecation/core/validation.dart';
import 'package:net_aplecation/feature/Auth/presentation/manager/signupcubit/signup_cubit.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_Butoom_for_auth.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/wedjet_for_signup/custom_disapear_and_apear_icon.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_text_field.dart';
class BodySectionSignup extends StatefulWidget {
  const BodySectionSignup({super.key});

  @override
  State<BodySectionSignup> createState() => _BodySectionSignupState();
}

class _BodySectionSignupState extends State<BodySectionSignup> {
  bool _passwordVisible = false;
bool _confirmPasswordVisible = false;

    final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // 👈 تنظيف الذاكرة
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                                         controller: nameController, 
                                         validator: validateUsername,
            hint: 'الاسم كامل',
            background: Colors.white,
            keyboardType: TextInputType.emailAddress,
            prefix: const Icon(Icons.person_2_outlined,
             color: Color.fromARGB(255, 13, 12, 12)
                ),
          ),
                                  const SizedBox(height: 16),
                                  
                            
                           
                                  AppTextField(
                                     keyboardType: TextInputType.emailAddress,
                                       controller: emailController,
                                       validator: validateEmail,
            hint: 'عنوان البريد الالكتروني',
            background: Colors.white,
          
            prefix: const Icon(Icons.email_outlined,
                color: Color.fromARGB(255, 13, 12, 12)
                ),
         
           
          ),
                               const SizedBox(height: 16),
                                     
                                  AppTextField(
                                    controller: passwordController, 
                                    validator:validatePassword ,
            hint: 'كلمة السر',
            background: Colors.white,
                   keyboardType: TextInputType.emailAddress,
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
                        const SizedBox(height: 16),            
                                  AppTextField(
                                          controller: confirmPasswordController,
                                          validator: (value) =>
                  validateConfirmPassword(value, passwordController.text),
            hint: 'تأكيد كلمة السر ',
            background: Colors.white,
                   keyboardType: TextInputType.emailAddress,
             obscure: !_confirmPasswordVisible,
      prefix: const Icon(Icons.lock_outline_rounded,
                color: Color.fromARGB(255, 13, 12, 12)
                ),
  suffix: PasswordVisibilityIcon(
    visible: _confirmPasswordVisible,
    onPressed: () {
      setState(() {
        _confirmPasswordVisible = !_confirmPasswordVisible;
      });
    },
  ),
          ),                      
                             
                                                      
                                  
                                  const SizedBox(height: 40),
        BlocListener<SignupCubit, signupState>(
          listener: (context, state) {
            if (state is signupSuccess) {
        context.go(AppRouter.kOTPView);
            }
 if (state is signupFailure) {

   ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errMessage)),
                      );

}

          },
          child: AppButton(
            text: "انشاء جساب",
            onPressed: () {
                if (_formKey.currentState!.validate()) {
        context.read<SignupCubit>().fetchDataSignup(
          fullName: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          confirmPassword: confirmPasswordController.text.trim(),
        );
          
                }
            }
          ),



        ),
        
        
                                  
                                  const SizedBox(height: 28),
                                  
                                  // Footer: Don't have an account? SIGN UP
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [

                            Text(
                              "لديك حساب بالفعل",
                                        style: styles.textStyle14,
                                      ), 
                                      SizedBox(width: 10,),           
        GestureDetector(
          onTap: () {
            context.go(AppRouter.kloginView);
          },
          child: Text(
            'سجل دخول هنا  ',
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