import 'package:flutter/material.dart';
import 'package:rune_second/page/main.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RuneApp(),
    ));

class RuneApp extends StatelessWidget {
  const RuneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }
}
