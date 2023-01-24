import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
            child: Image.asset(
          "assets/images/rainbow.png",
          width: MediaQuery.of(context).size.width / 1.3,
        ))
      ],
    );
  }
}
