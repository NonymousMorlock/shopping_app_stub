import 'package:benaiah_okwukwe_anukem/core/common/errors/exceptions.dart';
import 'package:benaiah_okwukwe_anukem/core/common/errors/failure.dart';
import 'package:benaiah_okwukwe_anukem/core/common/views/app/providers/user_controller.dart';
import 'package:benaiah_okwukwe_anukem/core/utils/typedefs.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/models/user.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthController {
  const AuthController({
    required AuthRepository authRepository,
    required UserController userController,
  })  : _authRepository = authRepository,
        _userController = userController;

  final AuthRepository _authRepository;
  final UserController _userController;

  ResultFuture<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRepository.login(
        email: email,
        password: password,
      );
      _userController.user = user;
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
