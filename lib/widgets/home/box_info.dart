import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final IconData icon;
  final String title;
  const Box({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 20,
      height: 75,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Icon(icon, color: const Color(0xff9D9B9B), size: 35),
        Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              fontFamily: "Merriweather",
              fontStyle: FontStyle.italic),
        )
      ]),
    );
  }
}
