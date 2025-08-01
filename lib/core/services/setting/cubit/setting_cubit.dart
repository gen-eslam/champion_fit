import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/services/setting/setting_repo/setting_repo.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({required this.settingRepo}) : super(SettingInitialState());
  SettingRepo settingRepo;

  static SettingCubit get(context) => BlocProvider.of<SettingCubit>(context);
  ThemeMode themeMode = ThemeMode.system;

  void getThemeMode() {
    themeMode = settingRepo.getThemeMode();
  }

  bool isDarkMode() {
    return settingRepo.isDarkMode();
  }

  void changeTheme() {
    themeMode = settingRepo.changeTheme();
    emit(ChangeTheme());
  }
}
