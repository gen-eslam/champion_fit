import 'package:flutter/material.dart';
import 'package:gem_app2/core/services/cache/cache_key.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';

abstract class SettingRepo {
  ThemeMode getThemeMode();
  ThemeMode changeTheme();
  Future<String> loadMapStyle({required BuildContext context});
  bool isDarkMode();
}

class SettingRepoImpl implements SettingRepo {
  @override
  ThemeMode getThemeMode() {
    return isDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  ThemeMode changeTheme() {
    if (isDarkMode()) {
      CacheService.put(key: CacheKey.isDarkMode, value: false);
      return ThemeMode.light;
    } else {
      CacheService.put(key: CacheKey.isDarkMode, value: true);
      return ThemeMode.dark;
    }
  }

  @override
  bool isDarkMode() {
    return CacheService.getDataBool(key: CacheKey.isDarkMode) ?? false;
  }

  @override
  Future<String> loadMapStyle({required BuildContext context}) async {
    return await DefaultAssetBundle.of(context)
        .loadString("assets/google_map_style/night_google_map.json");
  }
}
