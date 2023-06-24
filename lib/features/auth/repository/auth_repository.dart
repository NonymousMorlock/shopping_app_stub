import 'package:benaiah_okwukwe_anukem/features/auth/models/user.dart';

class AuthRepository {
  Future<UserModel> login(
      {required String email, required String password}) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    // throw const ServerException(
    //   message: 'User does not exist',
    //   statusCode: 404,
    // );
    return UserModel(
      id: '1',
      name: 'Benaiah',
      email: email,
      image: 'https://picsum.photos/200',
      accessToken: '1234567890',
      savedItemIds: const ['1', '4', '7', '9'],
      cartProducts: const [],
    );
  }
}
