import 'dart:developer';

import 'package:elamri_shop_users/models/cart_model.dart';
import 'package:elamri_shop_users/providers/cart_provider.dart';
import 'package:elamri_shop_users/widgets/subtitle_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key, required this.cartModel});
  final CartModel cartModel;

  //const QuantityBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: 25,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    cartProvider.updateQty(
                        productId: cartModel.productId, qty: index + 1);
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SubtitleTextWidget(label: "${index + 1}"),
                  )),
                );
              }),
        ),
      ],
    );
  }
}
