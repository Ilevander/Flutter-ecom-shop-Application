import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:elamri_shop_users/models/product_model.dart';
import 'package:elamri_shop_users/providers/products_provider.dart';
import 'package:elamri_shop_users/screens/inner_screen/product_details.dart';
import 'package:elamri_shop_users/widgets/products/heart_btn.dart';
import 'package:elamri_shop_users/widgets/subtitle_screen.dart';
import 'package:elamri_shop_users/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../consts/app_constants.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    //final productsModelProvider = Provider.of<ProductModel>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);
    final getCurrProduct = productsProvider.findByProdId(widget.productId);
    Size size = MediaQuery.of(context).size;
    return getCurrProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(0.0),
            child: GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(
                    context, 
                    ProductDetailsScreen.routName,arguments: getCurrProduct.productId,);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl: getCurrProduct.productImage,
                      height: size.height * 0.22,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: TitlesTextWidget(
                            label: getCurrProduct.productTitle,
                            fontSize: 18,
                            maxLines: 2,
                          ),
                        ),
                        const Flexible(
                          flex: 2,
                          child: HeartButtonWidget(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SubtitleTextWidget(
                            label: "${getCurrProduct.productPrice} \MAD",
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                        Flexible(
                          child: Material(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.lightBlue,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12.0),
                              onTap: () {},
                              splashColor: Colors.red,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
          );
  }
}
