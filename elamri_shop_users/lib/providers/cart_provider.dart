import 'package:elamri_shop_users/models/cart_model.dart';
import 'package:elamri_shop_users/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartitems {
    return _cartItems;
  }

  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(
          cartId: const Uuid().v4(), productId: productId, quantity: 1),
    );
    notifyListeners();
  }

  bool isProdinCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }

  double getTotal({required ProductsProvider productsProvider}) {
    double total = 0.0;

    _cartItems.forEach((key, value) {
      final getCurrProduct = productsProvider.findByProdId(value.productId);
      if (getCurrProduct == null) {
        total += 0;
      } else {
        total += double.parse(getCurrProduct.productPrice) * value.quantity;
      }
    });
    return total;
  }

  int getQty() {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }
}
