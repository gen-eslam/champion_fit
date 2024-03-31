import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/dependency_injection/dependency_injection.dart';
import 'package:gem_app2/core/routes/app_router.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/theme_app.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/logic/customer_home_layout_cubit.dart';

import 'package:gem_app2/feature/trainer_and_manager/home_layout/cubit/home_layout_cubit.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/data/home_layout_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
              create: (context) => TrainerAndMnanagerHomeLayoutCubit(
                  homeLayoutRepo: getIt.get<HomeLayoutRepoImpl>()),
            ),
            //CustomerHomeLayoutCubit
            BlocProvider(
              create: (context) => CustomerHomeLayoutCubit(
                  homeLayoutRepo: getIt.get<HomeLayoutRepoImpl>()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeApp.light(context),
            // darkTheme: ThemeApp.dark(context),
            initialRoute: Routes.splashScreen,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
