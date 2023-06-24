import 'dart:convert';
import 'dart:ui';

import 'package:benaiah_okwukwe_anukem/core/extensions/color_extensions.dart';
import 'package:benaiah_okwukwe_anukem/core/extensions/string_extensions.dart';
import 'package:benaiah_okwukwe_anukem/core/utils/typedefs.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.description,
    required this.category,
    required this.availableColors,
  });

  factory Product.fromJson(String source) =>
      Product.fromMap(jsonDecode(source) as DataMap);

  Product.fromMap(Map<String, dynamic> map)
      : this(
          id: map['id'] as String,
          name: map['name'] as String,
          price: (map['price'] as num).toDouble(),
          images: List<String>.from(map['images'] as List<dynamic>),
          description: map['description'] as String,
          category: map['category'] as String,
          availableColors:
              List<String>.from(map['availableColors'] as List<dynamic>)
                  .map((colorString) => colorString.toColour)
                  .toList(),
        );

  final String id;
  final String name;
  final double price;
  final List<String> images;
  final String description;
  final String category;
  final List<Color> availableColors;

  @override
  List<Object?> get props => [id];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'images': images,
      'description': description,
      'category': category,
      'availableColors': availableColors.map((color) => color.toARGB).toList(),
    };
  }

  String toJson() => jsonEncode(toMap());

  Product copyWith({
    String? id,
    String? name,
    double? price,
    List<String>? images,
    String? description,
    String? category,
    List<Color>? availableColors,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      images: images ?? this.images,
      description: description ?? this.description,
      category: category ?? this.category,
      availableColors: availableColors ?? this.availableColors,
    );
  }
}
