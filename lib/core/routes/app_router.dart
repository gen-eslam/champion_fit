import 'package:flutter/material.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/feature/auth/forget_and_reset/view/forget_password_screen.dart';
import 'package:gem_app2/feature/auth/forget_and_reset/view/reset_password_screen.dart';
import 'package:gem_app2/feature/auth/forget_and_reset/view/otp_screen.dart';
import 'package:gem_app2/feature/auth/login/view/login_screen.dart';
import 'package:gem_app2/feature/auth/register/view/bundle_screen.dart';
import 'package:gem_app2/feature/auth/register/view/gender_screen.dart';
import 'package:gem_app2/feature/auth/register/view/hight_screen.dart';
import 'package:gem_app2/feature/auth/register/view/profile_photo.dart';
import 'package:gem_app2/feature/auth/register/view/register_screen.dart';
import 'package:gem_app2/feature/auth/register/view/weight_screen.dart';
import 'package:gem_app2/feature/contact_us_screen.dart';
import 'package:gem_app2/feature/paymeny/view/payment_options_screen.dart';
import 'package:gem_app2/feature/splash/splash_screen.dart';

import 'package:gem_app2/feature/trainer_and_manager/feedback/view/feedback_replies_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/feedback/view/feedback_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/view/trainer_and_manager_layout.dart';
import 'package:gem_app2/feature/trainer_and_manager/workout/view/workout_replies_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/workout/view/workout_requests_screen.dart';

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
      case Routes.weightScreen:
        return MaterialPageRoute(
          builder: (_) => const WeightScreen(),
        );
      case Routes.profilePhoto:
        return MaterialPageRoute(
          builder: (_) => const ProfilePhoto(),
        );
      case Routes.bundleScreen:
        return MaterialPageRoute(
          builder: (_) => const BundleScreen(),
        );
      case Routes.paymentOptionsScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentOptionsScreen(),
        );
      case Routes.contactUsScreen:
        return MaterialPageRoute(
          builder: (_) => const ContactUsScreen(),
        );
      //trainerAndManagerLayoutScreen
      case Routes.trainerAndManagerLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => const TrainerAndManagerLayoutScreen(),
        );
      //feedBackScreen
      case Routes.feedBackScreen:
        return MaterialPageRoute(
          builder: (_) => const FeedBackScreen(),
        );
      //feedBackReplies
      case Routes.feedBackRepliesScreen:
        return MaterialPageRoute(
          builder: (_) => const FeadBackRepliesScreen(),
        );
      case Routes.workoutRequestsScreen:
        return MaterialPageRoute(
          builder: (_) => const WorkoutRequestsScreen(),
        );
      case Routes.workoutRepliesScreen:
        return MaterialPageRoute(
          builder: (_) => const WorkoutRepliesScreen(),
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
