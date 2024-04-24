import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/dependency_injection/dependency_injection.dart';
import 'package:gem_app2/core/routes/app_router.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/services/bloc_observer.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/core/theme/theme_app.dart';
import 'package:gem_app2/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:gem_app2/feature/customer/customer_home/cubit/workout_and_diet_cubit.dart';

import 'package:gem_app2/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  CacheService.init();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("FCMToken $fcmToken");

  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  dependencyInjectionSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 1024),
      minTextAdapt: true,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => WorkoutAndDiteCubit()..getDietData(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeApp.light(context),
            initialRoute: Routes.splashScreen,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
