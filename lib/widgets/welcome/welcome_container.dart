import 'package:flutter/material.dart';

import 'package:weather_app/widgets/welcome/button.dart';
import 'package:weather_app/widgets/welcome/intro_text.dart';
import 'package:weather_app/widgets/welcome/logo.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Logo(),
        IntroText(),
        SizedBox(
          height: 80,
        ),
        Button()
      ],
    );
  }
}
