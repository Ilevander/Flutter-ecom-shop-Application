import 'package:elamri_shop_users/providers/cart_provider.dart';
import 'package:elamri_shop_users/providers/products_provider.dart';
import 'package:elamri_shop_users/providers/viewed_recently_provider.dart';
import 'package:elamri_shop_users/providers/wishlist_provider.dart';
import 'package:elamri_shop_users/root_screen.dart';
import 'package:elamri_shop_users/screens/auth/forgot_password.dart';
import 'package:elamri_shop_users/screens/auth/login.dart';
import 'package:elamri_shop_users/screens/inner_screen/orders/orders_screen.dart';
import 'package:elamri_shop_users/screens/inner_screen/product_details.dart';
import 'package:elamri_shop_users/screens/inner_screen/viewed_recently.dart';
import 'package:elamri_shop_users/screens/inner_screen/wishlist.dart';
import 'package:elamri_shop_users/screens/auth/register.dart';
import 'package:elamri_shop_users/screens/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elamri_shop_users/providers/theme_provider.dart';

import 'consts/theme_data.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "your-api-key",
//       appId: "your-app-id",
//       messagingSenderId:
//           "your-messaging-sender-id",
//       projectId: "your-project-id",
//       storageBucket:
//           "your-storage-bucket",
//       authDomain: "your-auth-domain",
//       databaseURL: "your-database-url", // Optional, for Realtime Database
//     )
//   );

//   runApp(const MyApp());
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: SelectableText(snapshot.error.toString()),
                ),
              ),
            );
          }

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return ThemeProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ProductsProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return CartProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return WishlistProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ViewedProdProvider();
              }),
            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Elamri-Shop MA',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                //home: const LoginScreen(),
                home: const RootScreen(),
                routes: {
                  LoginScreen.routeName: (context) => const LoginScreen(),
                  ProductDetailsScreen.routName: (context) =>
                      const ProductDetailsScreen(),
                  WishlistScreen.routName: (context) => const WishlistScreen(),
                  ViewedRecentlyScreen.routeName: (context) =>
                      const ViewedRecentlyScreen(),
                  RegisterScreen.routName: (context) => const RegisterScreen(),
                  RootScreen.routeName: (context) => const RootScreen(),
                  OrdersScreenFree.routeName: (context) =>
                      const OrdersScreenFree(),
                  ForgotPasswordScreen.routeName: (context) =>
                      const ForgotPasswordScreen(),
                  SearchScreen.routeName: (context) => const SearchScreen(),
                },
              );
            }),
          );
        });
  }
}
