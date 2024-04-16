import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/feature/auth/forget_and_reset/cubit/forget_password_cubit.dart';
import 'package:gem_app2/feature/auth/forget_and_reset/view/forget_password_screen.dart';
import 'package:gem_app2/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:gem_app2/feature/auth/login/view/login_screen.dart';
import 'package:gem_app2/feature/auth/register/view/age_screen.dart';
import 'package:gem_app2/feature/auth/register/view/bundle_screen.dart';
import 'package:gem_app2/feature/auth/register/view/gender_screen.dart';
import 'package:gem_app2/feature/auth/register/view/hight_screen.dart';
import 'package:gem_app2/feature/auth/register/view/profile_photo_screen.dart';
import 'package:gem_app2/feature/auth/register/view/register_screen.dart';
import 'package:gem_app2/feature/auth/register/view/weight_screen.dart';
import 'package:gem_app2/feature/contact_us_screen.dart';
import 'package:gem_app2/feature/customer/customer_custom_workout_and_diet/custom_workout_screen.dart';
import 'package:gem_app2/feature/customer/customer_feadback/customer_feedback_replies.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/view/customer_home_layout_screen.dart';
import 'package:gem_app2/feature/customer/customer_like/customer_like_screen.dart';
import 'package:gem_app2/feature/customer/food_details/food_details_screen.dart';
import 'package:gem_app2/feature/customer/notification/notification_screen.dart';
import 'package:gem_app2/feature/customer/search/search_screen.dart';
import 'package:gem_app2/feature/customer/workout/model/workout_model.dart';
import 'package:gem_app2/feature/customer/workout/workout_screen.dart';
import 'package:gem_app2/feature/customer/workout/workout_start_screen.dart';

import 'package:gem_app2/feature/paymeny/view/payment_options_screen.dart';
import 'package:gem_app2/feature/personal/view/personal_data_screen.dart';
import 'package:gem_app2/feature/splash/splash_screen.dart';

import 'package:gem_app2/feature/trainer_and_manager/feedback/view/feedback_replies_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/feedback/view/feedback_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/view/trainer_and_manager_layout_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/manager/reports_and_lnsights/reports_and_insights_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/manager/updates/updates_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/nutrition_plan%E2%80%A8/nutrition_Plan_requests_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/nutrition_plan%E2%80%A8/nutrition_plan_replies_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/workout/view/workout_replies_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/workout/view/workout_requests_screen.dart';
import 'package:gem_app2/models/user_model.dart';

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
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.forgetScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ForgetpasswordCubit(),
            child: const ForgetPasswordScreen(),
          ),
        );

      // case Routes.otpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OtpScreen(text: "romancawy12@gmail.com"),
      //   );
      // case Routes.resetPasswordScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const ResetPasswordScreen(),
      //   );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      //ageScreen
      case Routes.ageScreen:
        return MaterialPageRoute(
          builder: (_) => const AgeScreen(),
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
          builder: (_) => const ProfilePhotoScreen(),
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
      case Routes.nutritionRepliesScreen:
        return MaterialPageRoute(
          builder: (_) => const NutritionRepliesScreen(),
        );
      case Routes.nutritionPlanRequestsScreen:
        return MaterialPageRoute(
          builder: (_) => const NutritionPlanRequestsScreen(),
        );
      //personalDataScreen
      case Routes.personalDataScreen:
        return MaterialPageRoute(
          builder: (_) => const PersonalDataScreen(),
        );
      //reportsAndInsightsScreen
      case Routes.reportsAndInsightsScreen:
        return MaterialPageRoute(
          builder: (_) => const ReportsAndInsightsScreen(),
        );
      //updatesScreen
      case Routes.updatesScreen:
        return MaterialPageRoute(
          builder: (_) => const UpdatesScreen(),
        );
      //CustomerHomeLayoutScreen
      case Routes.customerHomeLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => const CustomerHomeLayoutScreen(),
        );
      //notificationScreen
      case Routes.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      //searchScreen
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      //customWorkoutScreen
      case Routes.customWorkoutScreen:
        return MaterialPageRoute(
          builder: (_) => const CustomWorkoutScreen(),
        );
      //foodDetailsScreen
      case Routes.foodDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const FoodDetailsScreen(),
        );
      case Routes.workoutScreen:
        return MaterialPageRoute(
          builder: (_) => WorkoutScreen(item: arguments as WorkOutModel),
        );
      case Routes.workoutStartScreen:
        return MaterialPageRoute(
          builder: (_) => WorkoutStartScreen(item: arguments as WorkOutModel),
        );
      //customerFeedBackRepliesScreen
      case Routes.customerFeedBackRepliesScreen:
        return MaterialPageRoute(
          builder: (_) =>
              CustomerFeedBackRepliesScreen(user: arguments as UserModel),
        );
      //customerLikeScreen
      case Routes.customerLikeScreen:
        return MaterialPageRoute(
          builder: (_) => const CustomerLikeScreen(),
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
