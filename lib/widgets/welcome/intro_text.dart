import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Keep track of all your local forecasts.",
      style: TextStyle(
          fontSize: 32,
          fontFamily: "Merriweather",
          fontWeight: FontWeight.bold),
    );
  }
}
