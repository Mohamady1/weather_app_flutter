import 'package:flutter/material.dart';

import 'package:weather_app/widgets/welcome/cloud.dart';
import 'package:weather_app/widgets/welcome/welcome_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 120),
            padding: const EdgeInsets.only(left: 10),
            child: const WelcomeContainer()),
        const Positioned(top: -50, right: -45, child: Cloud(turn: 20)),
        const Positioned(bottom: -55, left: -60, child: Cloud(turn: 23)),
      ]),
    );
  }
}
