import 'package:elamri_shop_users/root_screen.dart';
import 'package:elamri_shop_users/screens/inner_screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elamri_shop_users/providers/theme_provider.dart';

import 'consts/theme_data.dart';
import 'screens/home_screen.dart';

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
          home: const RootScreen(),
          routes: {
            ProductDetailsScreen.routName: (context) =>
                const ProductDetailsScreen(),
          },
        );
      }),
    );
  }
}
