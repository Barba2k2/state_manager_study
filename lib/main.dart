import 'package:flutter/material.dart';

import 'presentation/controller/theme_controller.dart';
import 'presentation/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeController.value ? ThemeData.dark() : ThemeData.light(),
          home: const MyHomePage(),
        );
      },
    );
  }
}
