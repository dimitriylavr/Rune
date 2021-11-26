import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rune_apps/config.dart';
import 'package:rune_apps/data/rune_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  final _runes = runeList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              _runes[_current]['image'],
              fit: BoxFit.cover,
            ),
            bottomColor(context),
            titleName(context),
            Positioned(
              bottom: 20,
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 550,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                carouselController: _carouselController,
                items: _runes.map((rune) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: scrollView(rune));
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned bottomColor(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 0, 0, 0).withOpacity(1),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(1),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(1),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(1),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(0.0),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(0.0),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(0.0),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(0.0),
            ],
          ),
        ),
      ),
    );
  }

  Positioned titleName(BuildContext context) {
    return Positioned(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          _runes[_current]['title'],
          style: const TextStyle(
            fontSize: 60,
            color: Colors.black,
            fontFamily: messiriFonts,
          ),
        ),
      ),
    );
  }

  SingleChildScrollView scrollView(rune) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 250,
            margin: const EdgeInsets.only(top: 15),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.asset(rune['image'], fit: BoxFit.cover),
          ),
          // rating
          const SizedBox(height: 10),
          Text(
            rune['description'],
            style: const TextStyle(
                fontSize: 16.0, fontFamily: messiriFonts, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _current == _runes.indexOf(rune) ? 1.0 : 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonPractic(rune),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton buttonPractic(rune) {
    return ElevatedButton(
      onPressed: () {
        print("${rune['title']} - $_current");
      },
      style: ElevatedButton.styleFrom(primary: Colors.black),
      child: const Text(
        'Практика',
        style: TextStyle(
            fontSize: 18.0, fontFamily: seconFonts, color: Colors.white),
      ),
    );
  }
}
