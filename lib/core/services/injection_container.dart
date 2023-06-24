import 'package:benaiah_okwukwe_anukem/core/common/views/app/providers/user_controller.dart';
import 'package:benaiah_okwukwe_anukem/core/services/cache_service.dart';
import 'package:benaiah_okwukwe_anukem/core/settings/cubit/settings_cubit.dart';
import 'package:benaiah_okwukwe_anukem/core/theme/cubit/theme_cubit.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/controller/auth_controller.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/repository/auth_repository.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/app/providers/route_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton<SharedPreferences>(() => prefs)
    ..registerFactory(() => RouteNotifier(prefs: sl(), authController: sl()))
    ..registerLazySingleton(
      () => AuthController(
        authRepository: sl(),
        userController: sl(),
      ),
    )
    ..registerLazySingleton(AuthRepository.new)
    ..registerLazySingleton(UserController.new);
  await themeInit();
}

Future<void> themeInit() async {
  sl
    ..registerFactory(() => ThemeCubit(Future.value(CacheService.theme)))
    ..registerFactory(() => SettingsCubit(sl()));
}
