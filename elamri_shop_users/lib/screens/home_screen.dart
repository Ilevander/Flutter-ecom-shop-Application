import 'package:elamri_shop_users/widgets/subtitle_screen.dart';
import 'package:elamri_shop_users/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:elamri_shop_users/providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SubtitleTextWidget(
              label: "Hello world!!!!!",
            ),
            TitlesTextWidget(
              label: "Hello this is a title" * 10,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Hello world")),
            SwitchListTile(
              title: Text(
                  themeProvider.getIsDarkTheme ? "Dark Mode" : "Light Mode"),
              value: themeProvider.getIsDarkTheme,
              onChanged: (value) {
                themeProvider.setDarkTheme(themeValue: value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
