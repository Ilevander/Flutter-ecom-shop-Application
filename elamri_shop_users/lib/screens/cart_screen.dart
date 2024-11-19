import 'package:elamri_shop_users/services/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:elamri_shop_users/widgets/subtitle_screen.dart';
import 'package:elamri_shop_users/widgets/empty_bag.dart';

import '../widgets/title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EmptyBagWidget(
          imagePath: AssetsManager.shoppingBasket,
          title: "Your cart is empty",
          subtitle:
              "Looks like your cart is empty add something and make me happy",
          buttonText: "Shop now",
        ),
      ),
    );
  }
}
