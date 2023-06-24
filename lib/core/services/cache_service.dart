import 'package:benaiah_okwukwe_anukem/core/services/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static final cacheClient = sl<SharedPreferences>();

  static Future<void> setFirstTime() async {
    await cacheClient.setBool('firstTime', false);
  }

  static Future<void> setTheme({required bool isDark}) async {
    await cacheClient.setBool('isDarkTheme', isDark);
  }

  static bool get isFirstTime => cacheClient.getBool('firstTime') ?? true;

  static bool get theme => cacheClient.getBool('isDarkTheme') ?? false;
}
