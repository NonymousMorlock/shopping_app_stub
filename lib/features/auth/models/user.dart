import 'package:benaiah_okwukwe_anukem/features/home/models/cart_product.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.accessToken,
    required this.savedItemIds,
    required this.cartProducts,
  });

  final String id;
  final String name;
  final String email;
  final String image;
  final List<String> savedItemIds;
  final List<CartProduct> cartProducts;
  final String accessToken;

  @override
  List<Object?> get props => [id];

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? image,
    List<String>? savedItemIds,
    List<CartProduct>? cartProducts,
    String? accessToken,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      savedItemIds: savedItemIds ?? this.savedItemIds,
      cartProducts: cartProducts ?? this.cartProducts,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
