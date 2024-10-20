import 'package:flutter/material.dart';

import 'presentation/controller/theme_controller.dart';

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
          theme: themeController.isDarkTheme
              ? ThemeData.dark()
              : ThemeData.light(),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    themeController.addListener(callback);
    super.initState();
  }

  void callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Mudar tema do Aplicativo',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ListenableBuilder(
              listenable: themeController,
              builder: (context, child) {
                return Switch(
                  value: themeController.isDarkTheme,
                  onChanged: (value) {
                    themeController.changeTheme();
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    themeController.removeListener(callback);
    super.dispose();
  }
}
