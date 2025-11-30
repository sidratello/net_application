import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:net_aplecation/core/units/app_Router.dart';
import 'package:net_aplecation/core/validation.dart';
import 'package:net_aplecation/feature/Auth/presentation/manager/otpcubit/otp_cubit.dart';
import 'package:net_aplecation/feature/Auth/presentation/manager/resendotpcubit/resendotp_cubit.dart';


import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_Butoom_for_auth.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/wedjet/custom_text_field.dart';
class BodySectionOtp extends StatefulWidget {
  const BodySectionOtp({super.key});

  @override
  State<BodySectionOtp> createState() => _BodySectionOtpState();
}

class _BodySectionOtpState extends State<BodySectionOtp> {
    final _formKey = GlobalKey<FormState>();
    String? _otpCode;
 final emailController = TextEditingController();
   @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
   
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child:
         Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
          child:    
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
          ),
          const SizedBox(height: 24),
                 OtpTextField(
                  numberOfFields: 6,
                  borderColor: const Color(0xFFE0E0E0), //هذا اللون يظهر عندما الخانة غير مفعّلة (غير مركّز عليها)
                  focusedBorderColor: const Color(0xFF68C78C), //اللون الذي يظهر عندما المستخدم يضغط على الخانة
                  fieldWidth: 50, //كل مربع أو دائرة سيكون عرضه 60
                  showFieldAsBox: true, //اجعل كل خانة تظهر داخل شكل مربع/مستطيل
                  borderRadius: BorderRadius.circular(30),
                  filled: true,
                  fillColor: Colors.white,
                  onSubmit: (value) {
                    setState(() {
                    _otpCode = value;     
                    });
                 
                    print("OTP: $value");

                  },
                ),
              
 BlocConsumer<OtpCubit, OtpcubitState>(
                  listener: (context, state) {
                    if (state is otpFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errMessage)),
                      );
                    }

                    if (state is otrpSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                   context.go(AppRouter.ksucessOTP);
                    }
                  },
                  builder: (context, state) {
                    if (state is otpLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  
 

 return       Padding(
          padding: const EdgeInsets.only(top: 40,right: 40,left: 40,bottom: 10),
          child: AppButton(
        onPressed: () {
  if (_formKey.currentState!.validate()) {
   

    context.read<OtpCubit>().fetchdataotp(
   code: _otpCode ?? "",
      email: emailController.text.trim(),
    );
  }
},

          text: 'تأكيد ',
       ),
    );
  },
),


BlocListener<ResendotpCubit, ResendotpState>(
  listener: (context, state) {
                     if (state is ResendotpFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errMessage)),
                      );
                    }

                    if (state is ResendotpSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                 
                    }
  },
  child:  Padding(
          padding: const EdgeInsets.only(top: 10,right: 40,left: 40,),
          child: AppButton(
        onPressed: () {
  if (_formKey.currentState!.validate()) {
   

    context.read<ResendotpCubit>().fetchdataresendotp(
  
      email: emailController.text.trim(),
    );
  }
},

          text: 'اعادة ارسال رمز التحقق ',
       ),
    ),
)

            ],
          ),
        ),
        ),
      
    );
  }
}
