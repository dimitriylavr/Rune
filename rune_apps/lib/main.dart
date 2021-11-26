import 'package:flutter/material.dart';
import 'package:rune_apps/page/main.dart';
import 'package:rune_apps/page/splash.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RuneApp(),
    ));

class RuneApp extends StatelessWidget {
  const RuneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return const MainPage();
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Splash());
        } else {
          return MaterialApp(
            title: 'Runes App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MainPage(),
          );
        }
      },
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
