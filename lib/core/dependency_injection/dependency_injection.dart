import 'package:gem_app2/feature/trainer_and_manager/home_layout/data/home_layout_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void dependencyInjectionSetup() {
  /// services
  // getIt.registerSingleton<LocationService>(LocationService());
  // getIt.registerSingleton<MapController>(MapController());

  // /// repo
   getIt.registerSingleton<HomeLayoutRepoImpl>(HomeLayoutRepoImpl());
  // getIt.registerSingleton<SettingRepoImpl>(SettingRepoImpl());
  // getIt.registerSingleton<LocationRepoImpl>(LocationRepoImpl(
  //     locationService: getIt.get<LocationService>(),
  //     mapController: getIt.get<MapController>()));
  // getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
  // getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
}
