
import 'dart:ui';

import 'package:equatable/equatable.dart';

class CartProduct extends Equatable {
  const CartProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    this.chosenColour,
  });

  final String id;
  final String name;
  final double price;
  final String image;
  final int quantity;
  final Color? chosenColour;
  double get totalPrice => price * quantity;

  @override
  List<Object?> get props => [id];
}
