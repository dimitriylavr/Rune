import 'package:flutter/material.dart';

class BottomColor extends StatelessWidget {
  const BottomColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
