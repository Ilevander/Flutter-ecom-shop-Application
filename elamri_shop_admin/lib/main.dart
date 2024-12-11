import 'package:elamri_shop_admin/screens/edit_upload_product_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const/theme_data.dart';
import 'providers/products_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/inner_screen/orders/orders_screen.dart';
import 'screens/search_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "your-api-key", // Replace with your Firebase API key
      appId: "your-app-id", // Replace with your Firebase App ID
      messagingSenderId:
          "your-messaging-sender-id", // Replace with your Firebase Messaging Sender ID
      projectId: "your-project-id", // Replace with your Firebase Project ID
      storageBucket:
          "your-storage-bucket", // Replace with your Firebase Storage Bucket
      authDomain: "your-auth-domain", // Optional, for web projects
      databaseURL: "your-database-url", // Optional, for Realtime Database
    ),
  );

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
        }),
        ChangeNotifierProvider(create: (_) {
          return ProductsProvider();
        }),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EL AMRI Shop ADMIN',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const DashboardScreen(),
          routes: {
            OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
            SearchScreen.routeName: (context) => const SearchScreen(),
            EditOrUploadProductScreen.routeName: (context) =>
                const EditOrUploadProductScreen(),
          },
        );
      }),
    );
  }
}
