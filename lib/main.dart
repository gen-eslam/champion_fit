import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/dependency_injection/dependency_injection.dart';
import 'package:gem_app2/core/routes/app_router.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/theme_app.dart';

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
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.light(context),
          // darkTheme: ThemeApp.dark(context),
          initialRoute: Routes.splashScreen,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
