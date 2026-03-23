import 'package:flutter_application_1/Auth/presentation/views/login.dart';
import 'package:flutter_application_1/Auth/presentation/views/otp.dart';
import 'package:flutter_application_1/Auth/presentation/views/signup.dart';
import 'package:flutter_application_1/Auth/presentation/views/sucsess_otp.dart';
import 'package:flutter_application_1/citizen/Archive_complaints/view/archive_complaints_page.dart';
import 'package:flutter_application_1/citizen/Follow_complaint/view/follow_complaint_page.dart';
import 'package:flutter_application_1/citizen/Home_citizen/view/home_citizen_page.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/write_complaint_page.dart';
import 'package:flutter_application_1/main.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homePage = "/homePage";
  static const writeComplaint = "/writeComplaint";
  static const archiveComplaint = "/archiveComplaint";
  static const followComplaint = "/followComplaint";
  static const kloginView = '/kloginView';
  static const ksignupView = '/';
  static const kOTPView = '/kOTPView';
  static const ksucessOTP = '/ksucessOTP';

  static final router = GoRouter(
    initialLocation: (token.isNotEmpty) ? homePage : '/',
    routes: [
      GoRoute(
        path: homePage,
        builder: (context, state) => const HomeCitizenPage(),
      ),
      GoRoute(
        path: writeComplaint,
        builder: (context, state) => const WriteComplaintPage(),
      ),
      GoRoute(
        path: archiveComplaint,
        builder: (context, state) => const ArchiveComplaintsPage(),
      ),
      GoRoute(
        path: followComplaint,
        builder: (context, state) => const FollowComplaintPage(),
      ),
      GoRoute(path: '/', builder: (context, state) => const SignUpscreen()),
      GoRoute(
        path: kloginView,
        builder: (context, state) => const loginscreen(),
      ),
      GoRoute(path: kOTPView, builder: (context, state) => const OTPscreen()),
      GoRoute(
        path: ksucessOTP,
        builder: (context, state) => const SuccessView(),
      ),
    ],
  );
}
