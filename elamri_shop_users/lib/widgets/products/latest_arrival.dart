import 'dart:developer';

import 'package:elamri_shop_users/screens/inner_screen/product_details.dart';
import 'package:elamri_shop_users/widgets/products/heart_btn.dart';
import 'package:elamri_shop_users/widgets/subtitle_screen.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../consts/app_constants.dart';

class LatestArrivalProductsWidget extends StatelessWidget {
  const LatestArrivalProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async{
          //log("ToDo add the navigate to the product details screen");
          await Navigator.pushNamed(
            context,
            ProductDetailsScreen.routName,
          );
        },
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FancyShimmerImage(
                    imageUrl: AppConstants.imageUrl,
                    height: size.width * 0.24,
                    width: size.width * 0.32,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Title" * 15,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          const HeartButtonWidget(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_shopping_cart,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const FittedBox(
                      child: SubtitleTextWidget(
                        label: "1550.00 MAD",
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
