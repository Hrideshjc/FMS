// ignore_for_file: unused_import

import 'package:VMS/module/font_page/splash_screen.dart';
import 'package:VMS/module/home_page/dashboard.dart';
import 'package:VMS/module/home_page/maindashboard.dart';

import '../module/authentication/login_view/forget_password_view.dart';
import '../module/authentication/login_view/login_page.dart';
import '../module/authentication/login_view/signup_verification_view.dart';
import '../module/authentication/login_view/signup_view.dart';
import 'app_route.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = {
    Routes.splash: (context) => const ViewSplashScreen(),

    /*-------------- Auth View Page ---------------------*/
    Routes.login: (context) => const LoginView(),
    Routes.forgetPassword: (context) => const ForgetPassword(),
    Routes.signUp: (context) => const SignUp(),
    Routes.signUpVerification: (context) => const SignupVerificationView(),

    /*-------------- Home View Page ---------------------*/
    // Routes.homePage: (context) => const HomePageView(),
    Routes.homePage: (context) => const MainDashboardPage(),
  };
}
