import 'package:flutter/material.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/feature/forget_and_reset/view/forget_password_screen.dart';
import 'package:gem_app2/feature/forget_and_reset/view/otp_screen.dart';
import 'package:gem_app2/feature/login/view/login_screen.dart';
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
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<SignupCubit>(),
      //       child: const SignupScreen(),
      //     ),
      //   );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );
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
