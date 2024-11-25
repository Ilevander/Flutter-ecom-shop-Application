import 'package:elamri_shop_users/root_screen.dart';
import 'package:elamri_shop_users/screens/auth/login.dart';
import 'package:elamri_shop_users/screens/inner_screen/product_details.dart';
import 'package:elamri_shop_users/screens/inner_screen/viewed_recently.dart';
import 'package:elamri_shop_users/screens/inner_screen/wishlist.dart';
import 'package:elamri_shop_users/screens/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elamri_shop_users/providers/theme_provider.dart';

import 'consts/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Elamri-Shop MA',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          //home: const RootScreen(),
          home: const LoginScreen(),
          routes: {
            ProductDetailsScreen.routName: (context) =>
                const ProductDetailsScreen(),
            WishlistScreen.routName: (context) => const WishlistScreen(),
            ViewedRecentlyScreen.routName: (context) =>
                const ViewedRecentlyScreen(),
                RegisterScreen.routName: (context) => const RegisterScreen(),
          },
        );
      }),
    );
  }
}
