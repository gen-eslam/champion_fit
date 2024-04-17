import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/core/utils/images_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String? userId = CacheService.getDataString(
        key: Keys.userId,
      );
      String? role = CacheService.getDataString(key: Keys.role);
      if (userId == null) {
        context.pushReplacementNamed(Routes.loginScreen);
      } else {
        if (role == "manager" || role == "trainer") {
          context.pushReplacementNamed(
            Routes.trainerAndManagerLayoutScreen,
          );
        } else {
          context.pushReplacementNamed(Routes.customerHomeLayoutScreen);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImagesManager.logo),
      ),
    );
  }
}
