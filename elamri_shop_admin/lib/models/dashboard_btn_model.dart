import 'package:elamri_shop_admin/screens/edit_upload_product_form.dart';
import 'package:elamri_shop_admin/screens/inner_screen/orders/orders_screen.dart';
import 'package:elamri_shop_admin/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../services/assets_manager.dart';

class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonsModel> dashboardBtnList(context) => [
        DashboardButtonsModel(
          text: "Add a new product",
          imagePath: AssetsManager.cloud,
          onPressed: () {
            Navigator.pushNamed(context, EditOrUploadProductScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "inspect all products",
          imagePath: AssetsManager.shoppingCart,
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "View Orders",
          imagePath: AssetsManager.order,
          onPressed: () {
            Navigator.pushNamed(context, OrdersScreenFree.routeName);
          },
        ),
      ];
}
