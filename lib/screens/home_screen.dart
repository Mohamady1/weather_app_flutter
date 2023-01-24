import 'package:flutter/material.dart';

import 'package:weather_app/widgets/home/home_container.dart';
import 'package:weather_app/widgets/home/images_status.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: Column(
        children: const [
          Expanded(child: ImageStatusGenerator()),
          Expanded(flex: 4, child: HomeContainer())
        ],
      ),
    );
  }
}
