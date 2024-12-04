import 'package:elamri_shop_users/models/viewed_products.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


class ViewedProdProvider with ChangeNotifier {
  final Map<String, ViewedProdModel> _viewedProdItems = {};

  Map<String, ViewedProdModel> get getViewedProds {
    return _viewedProdItems;
  }

  void addViewedProd({required String productId}) {
    _viewedProdItems.putIfAbsent(
      productId,
      () => ViewedProdModel(
          viewedProdId: const Uuid().v4(), productId: productId),
    );

    notifyListeners();
  }
}
