import 'package:flutter/material.dart';

import '../../main.dart';

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
            ValueListenableBuilder(
              valueListenable: themeController,
              builder: (context, value, child) {
                return Switch(
                  value: themeController.value,
                  onChanged: (value) {
                    themeController.changeTheme();
                  },
                );
              },
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
