import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/presentation/manager/logincubit/login_cubit.dart';
import 'package:flutter_application_1/Auth/presentation/views/wedjet/custom_Butoom_for_auth.dart';
import 'package:flutter_application_1/Auth/presentation/views/wedjet/custom_text_field.dart';
import 'package:flutter_application_1/Auth/presentation/views/wedjet/wedjet_for_signup/custom_disapear_and_apear_icon.dart';
import 'package:flutter_application_1/core/utils/app_router.dart';
import 'package:flutter_application_1/core/utils/function/counter_function_for_login.dart';
import 'package:flutter_application_1/core/utils/units/styles.dart';
import 'package:flutter_application_1/core/utils/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  final LoginCooldownController cooldown = LoginCooldownController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    cooldown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              hint: 'عنوان البريد الالكتروني',
              background: Colors.white,
              keyboardType: TextInputType.emailAddress,
              prefix: const Icon(
                Icons.mail_outline_rounded,
                color: Color.fromARGB(255, 13, 12, 12),
              ),
            ),

            const SizedBox(height: 16),

            AppTextField(
              hint: 'كلمة السر ',
              controller: passwordController,
              validator: validatePassword,
              background: Colors.white,
              obscure: !_passwordVisible,
              prefix: const Icon(
                Icons.lock_outline_rounded,
                color: Color.fromARGB(255, 13, 12, 12),
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
                  final msg = state.errMessage;

                  // حالة الإيميل غير مفعّل
                  if (msg.contains('Email not verified')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'البريد غير مفعّل، يرجى إدخال رمز التحقق',
                        ),
                      ),
                    );

                    // ننتقل لشاشة OTP ونرسل معها الإيميل
                    context.go(
                      AppRouter.kOTPView, // مسار شاشة OTP
                      extra: emailController.text.trim(),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errMessage),
                        backgroundColor: Colors.grey,
                      ),
                    );
                    cooldown.startCooldown(
                      duration: 2,
                      onTick: () {
                        setState(() {}); // عشان يحدث النص على الزر
                      },
                      onFinish: () {
                        setState(() {}); // لما يخلص العد
                      },
                    );
                  }
                }

                if (state is loginSuccess) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                  print('hiiiiiiii');
                  GoRouter.of(context).push(AppRouter.homePage);
                }
              },
              builder: (context, state) {
                if (state is loginLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return AppButton(
                  text: cooldown.isCooldown
                      ? "انتظر ${cooldown.seconds} ثانية"
                      : "تسجيل الدخول",
                  onPressed: cooldown.isCooldown
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().fetchdatalogin(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          }
                        },
                );
              },
            ),

            const SizedBox(height: 28),

            // Footer: Don't have an account? SIGN UP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ليس لديك حساب؟  ", style: styles.textStyle14),
                GestureDetector(
                  onTap: () {
                    context.go(AppRouter.ksignupView);
                  },
                  child: Text(
                    'قم بانشاء الحساب هنا ',
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
