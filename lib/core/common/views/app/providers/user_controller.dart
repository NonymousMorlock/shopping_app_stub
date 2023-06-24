import 'package:benaiah_okwukwe_anukem/features/auth/models/user.dart';
import 'package:flutter/foundation.dart';

class UserController extends ChangeNotifier {
  factory UserController() => _instance;

  UserController._internal();

  static final UserController _instance = UserController._internal();

  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
    if (user == null || this.user != user) {
      _user = user;
    }
    notifyListeners();
  }
}
