import 'dart:math' as math;

import 'package:flutter/material.dart';

class Cloud extends StatelessWidget {
  final int turn;

  const Cloud({super.key, required this.turn});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: math.pi + turn,
        child: const Icon(Icons.cloud, color: Color(0xff9DB8DF), size: 224));
  }
}
