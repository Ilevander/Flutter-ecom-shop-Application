import 'package:card_swiper/card_swiper.dart';
import 'package:elamri_shop_users/consts/app_constants.dart';
import 'package:elamri_shop_users/widgets/subtitle_screen.dart';
import 'package:elamri_shop_users/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:elamri_shop_users/providers/theme_provider.dart';

import '../services/assets_manager.dart';
import '../widgets/app_name_text.dart';
import '../widgets/subtitle_text.dart';
import '../widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: size.height * 0.25,
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(50),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      AppConstants.bannersImages[index],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: AppConstants.bannersImages.length,
                  pagination: const SwiperPagination(
                    // alignment: Alignment.center,
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.red, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const TitlesTextWidget(label: "Latest arrival"),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              height: size.height * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    //return LatestArrivalProductsWidget();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
