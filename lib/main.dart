import 'package:firebase_core/firebase_core.dart';
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
import 'package:gem_app2/feature/customer/customer_feadback/cubit/fead_back_cubit.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/logic/customer_home_layout_cubit.dart';
import 'package:gem_app2/feature/customer/customer_personal/cubit/coustomer_personal_cubit.dart';

import 'package:gem_app2/feature/trainer_and_manager/home_layout/cubit/home_layout_cubit.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/data/home_layout_repo.dart';
import 'package:gem_app2/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  CacheService.init();
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
              lazy: false,
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => TrainerAndMnanagerHomeLayoutCubit(
                  homeLayoutRepo: getIt.get<HomeLayoutRepoImpl>()),
            ),
            //CustomerHomeLayoutCubit
            BlocProvider(
              create: (context) => CustomerHomeLayoutCubit(
                  homeLayoutRepo: getIt.get<HomeLayoutRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => FeadBackCubit(),
            ),
            BlocProvider(
              create: (context) => CoustomerPersonalCubit()..getUserData(),
            )
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
