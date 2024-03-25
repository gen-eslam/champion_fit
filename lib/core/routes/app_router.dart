import 'package:flutter/material.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/feature/auth/forget_and_reset/view/forget_password_screen.dart';
import 'package:gem_app2/feature/auth/forget_and_reset/view/reset_password_screen.dart';
import 'package:gem_app2/feature/auth/forget_and_reset/view/otp_screen.dart';
import 'package:gem_app2/feature/auth/login/view/login_screen.dart';
import 'package:gem_app2/feature/auth/register/view/gender_screen.dart';
import 'package:gem_app2/feature/auth/register/view/hight_screen.dart';
import 'package:gem_app2/feature/auth/register/view/register_screen.dart';
import 'package:gem_app2/feature/splash/splash_screen.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.forgetScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );

      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(text: "romancawy12@gmail.com"),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case Routes.genderScreen:
        return MaterialPageRoute(
          builder: (_) => const GenderScreen(),
        );
      case Routes.hightScreen:
        return MaterialPageRoute(
          builder: (_) => const HightScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
