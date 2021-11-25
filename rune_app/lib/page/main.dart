import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  CarouselController _carouselController = new CarouselController();
  int current = 0;

  List<dynamic> _runes = [
    {'title': 'Test title', 'image': '', 'description': 'Описание такое'}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
