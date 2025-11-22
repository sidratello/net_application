
import 'package:go_router/go_router.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/home.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/login.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/otp.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/signup.dart';
import 'package:net_aplecation/feature/Auth/presentation/views/sucsess_otp.dart';




abstract class AppRouter {
  static const kloginView = '/kloginView';
  static const ksignupView = '/';
  static const kOTPView = '/kOTPView';
   static const ksucessOTP = '/ksucessOTP';
    static const khome = '/khome';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SignUpscreen(),
      ),
          GoRoute(
        path: kloginView,
        builder: (context, state) => const loginscreen(),
      ),
                GoRoute(
        path: kOTPView,
        builder: (context, state) => const OTPscreen(),
      ),
                      GoRoute(
        path: ksucessOTP,
        builder: (context, state) => const SuccessView(),
      ),
                            GoRoute(
        path: khome,
        builder: (context, state) => const home(),
      ),
    ],
  );
}