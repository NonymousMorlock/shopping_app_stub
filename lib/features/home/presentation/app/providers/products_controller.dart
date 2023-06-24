import 'package:benaiah_okwukwe_anukem/core/utils/constants.dart';
import 'package:benaiah_okwukwe_anukem/features/home/models/product.dart';
import 'package:flutter/foundation.dart';

class ProductsController extends ChangeNotifier {
  List<String> get categories =>
      kTempProducts.map((product) => product.category).toSet().toList()
        ..insert(0, 'All');

  String _selectedCategory = 'All';

  List<Product> get products {
    if (_selectedCategory == 'All') {
      return kTempProducts;
    }
    return kTempProducts
        .where((product) => product.category == _selectedCategory)
        .toList();
  }

  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
    if(category == _selectedCategory) return;
    _selectedCategory = category;
    notifyListeners();
  }

}
