import 'package:flutter/material.dart';
import 'package:rune_apps/config.dart';
import 'package:rune_apps/data/rune_class.dart';
import 'package:rune_apps/widget/bottom_color.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  _DescriptionPage createState() => _DescriptionPage();
}

class _DescriptionPage extends State<DescriptionPage> {
  late final Rune rune;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    rune = settings.arguments as Rune;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height / 3,
              child: Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      colors: [mainColor, Colors.black]),
                ),
                child: Image.asset(
                  rune.image,
                  fit: BoxFit.fitHeight,
                ),
              )),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height / 1.4,
            child: Container(
              padding: const EdgeInsets.all(25.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      rune.title,
                      style: const TextStyle(
                          color: Color.fromRGBO(97, 90, 90, 1),
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      rune.description,
                      style: const TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 0.54),
                        height: 1.4,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}