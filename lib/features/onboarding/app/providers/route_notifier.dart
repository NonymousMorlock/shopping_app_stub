import 'package:benaiah_okwukwe_anukem/features/auth/controller/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteNotifier extends ChangeNotifier {
  RouteNotifier({
    required SharedPreferences prefs,
    required AuthController authController,
  })  : _prefs = prefs,
        _authController = authController;

  bool? _login;

  bool? get login => _login;

  bool _isFirstTime = true;

  bool get isFirstTime => _isFirstTime;

  final SharedPreferences _prefs;
  final AuthController _authController;

  void initialize() {
    checkFirstTime();
    _authController
        .login(email: 'testmail@gmail.com', password: 'password')
        .then((value) {
      value.fold(
        (failure) => setLogin(shouldLogin: true),
        (_) => setLogin(shouldLogin: false),
      );
    });
  }

  void setFirstTime({required bool isFirstTime}) {
    _isFirstTime = isFirstTime;
    notifyListeners();
  }

  void checkFirstTime() {
    _isFirstTime = _prefs.getBool('firstTime') ?? true;
    notifyListeners();
  }

  void setLogin({required bool shouldLogin}) {
    _login = shouldLogin;
    notifyListeners();
  }
}
