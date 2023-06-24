import 'dart:math';

import 'package:benaiah_okwukwe_anukem/features/home/models/product.dart';
import 'package:flutter/material.dart';

const kSupportedLocales = [
  Locale('af'),
  Locale('am'),
  Locale('ar'),
  Locale('az'),
  Locale('be'),
  Locale('bg'),
  Locale('bn'),
  Locale('bs'),
  Locale('ca'),
  Locale('cs'),
  Locale('da'),
  Locale('de'),
  Locale('el'),
  Locale('et'),
  Locale('fa'),
  Locale('fi'),
  Locale('fr'),
  Locale('gl'),
  Locale('ha'),
  Locale('he'),
  Locale('hi'),
  Locale('hr'),
  Locale('hu'),
  Locale('hy'),
  Locale('id'),
  Locale('is'),
  Locale('it'),
  Locale('ja'),
  Locale('ka'),
  Locale('kk'),
  Locale('km'),
  Locale('ko'),
  Locale('ku'),
  Locale('ky'),
  Locale('lt'),
  Locale('lv'),
  Locale('mk'),
  Locale('ml'),
  Locale('mn'),
  Locale('ms'),
  Locale('nb'),
  Locale('nl'),
  Locale('nn'),
  Locale('no'),
  Locale('pl'),
  Locale('ps'),
  Locale('pt'),
  Locale('ro'),
  Locale('ru'),
  Locale('sd'),
  Locale('sk'),
  Locale('sl'),
  Locale('so'),
  Locale('sq'),
  Locale('sr'),
  Locale('sv'),
  Locale('ta'),
  Locale('tg'),
  Locale('th'),
  Locale('tk'),
  Locale('tr'),
  Locale('tt'),
  Locale('uk'),
  Locale('ug'),
  Locale('ur'),
  Locale('uz'),
  Locale('vi'),
  Locale('zh')
];

final kTempProducts = [
  Product(
    id: '1',
    name: 'Foam Padded Chair',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/61-nsjDPl-L._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/81yajMKUjlL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61wnmKRDmyL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/81DOwWuz+QL._AC_SL1500_.jpg',
    ],
    description: getRandomDescription('Foam Padded Chair'),
    category: 'chair',
    availableColors: getRandomColors(),
  ),
  Product(
    id: '2',
    name: 'Small Bookcase',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/51qNBrE0EpL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/814OQaImhqL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61l5tOIDbfL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61p1nMpgEuL._AC_SL1500_.jpg'
    ],
    description: getRandomDescription('Small Bookcase'),
    category: 'bookcase',
    availableColors: getRandomColors(),
  ),
  Product(
    id: '3',
    name: 'Glass Lamp',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/71h3yfP8W5L._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/71yfUU5k1XL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/71SBTDeyHDL._AC_SL1500_.jpg',
    ],
    description: getRandomDescription('Glass Lamp'),
    category: 'lamp',
    availableColors: getRandomColors(),
  ),
  Product(
    id: '4',
    name: 'Glass Package',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/51fgohi63fL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61WDuYaVtcL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61w18Yt+xuL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61P20OisojL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/71PNDoG6ZrL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/81GSBwjQ3JL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/81eG05ExirL._AC_SL1500_.jpg',
    ],
    description: getRandomDescription('Glass Package'),
    category: 'package',
    availableColors: getRandomColors(),
  ),
  Product(
    id: '5',
    name: 'Plastic Chair',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/715E4uGLhFL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/71lsZccxHlL._AC_SL1500_.jpg',
    ],
    description: getRandomDescription('Plastic Chair'),
    category: 'chair',
    availableColors: getRandomColors(),
  ),
  Product(
    id: '6',
    name: 'Wooden Chair',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/71PXs+z0INL._AC_SL1500_.jpg',
    ],
    description: getRandomDescription('Wooden Chair'),
    category: 'chair',
    availableColors: getRandomColors(),
  ),
  Product(
    id: '7',
    name: 'Wooden Table',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/71JTITSl0xL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/71dWk56LQDL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/71qlO4EZ8QL._AC_SL1500_.jpg',
    ],
    description: getRandomDescription('Wooden Table'),
    category: 'table',
    availableColors: getRandomColors(),
  ),
  Product(
    id: '8',
    name: 'Wooden Bookcase',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/81+pT5sZMwL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/6150Uzx9SNL._AC_SL1200_.jpg',
      'https://m.media-amazon.com/images/I/61NScl1A-AL._AC_SL1000_.jpg'
    ],
    description: getRandomDescription('Wooden Bookcase'),
    category: 'bookcase',
    availableColors: getRandomColors(),
  ),
  Product(
    id: '9',
    name: 'Wooden Lamp',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/81VFftAaHhL._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61uYExQMKSL._AC_SL1200_.jpg',
      'https://m.media-amazon.com/images/I/71vUoAWPqcL._AC_SL1200_.jpg',
    ],
    description: getRandomDescription('Wooden Lamp'),
    category: 'lamp',
    availableColors: getRandomColors(),
  ),
  Product(
    id: '10',
    name: 'Wooden Cupboard',
    price: getRandomPrice(),
    images: const [
      'https://m.media-amazon.com/images/I/51apHkZkvXS._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61bppjHE8JS._AC_SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61Oh3k-WQ4S._AC_SL1500_.jpg',
    ],
    description: getRandomDescription('Wooden Cupboard'),
    category: 'cupboard',
    availableColors: getRandomColors(),
  ),
];

String getRandomDescription(String productName) {
  final descriptions = [
    'Elegant $productName with a modern design',
    'Comfortable $productName for your living room',
    'Stylish $productName that complements any decor',
    'Durable $productName built to last',
    'Functional $productName with multiple storage options',
  ];

  final randomIndex = Random().nextInt(descriptions.length);
  return descriptions[randomIndex];
}

List<Color> getRandomColors() {
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];
  final randomNumberOfColours = Random().nextInt(7) + 1;
  final randomColors = List<Color>.generate(randomNumberOfColours, (index) {
    final randomIndex = Random().nextInt(colors.length);
    return colors[randomIndex];
  });

  return randomColors;
}

double getRandomPrice() {
  final random = Random();
  return (random.nextInt(100) + 50).toDouble();
}
