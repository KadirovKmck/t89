import 'package:flutter/material.dart';
import 'package:t89/src/models/product_models/product_models.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(ProductModel updatedProduct) {
    final index =
        _products.indexWhere((product) => product.name == updatedProduct.name);
    if (index != -1) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }

  void deleteProduct(ProductModel product) {
    _products.remove(product);
    notifyListeners();
  }

  void clearProdct() {
    _products.clear();
    notifyListeners();
  }
}
