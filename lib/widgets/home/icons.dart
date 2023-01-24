import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconsGenerator extends StatelessWidget {
  final String icon;
  const IconsGenerator({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    generateIcon() {
      switch (this.icon) {
        case "01d":
          return icon = Container(
              width: 221,
              height: 221,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(110),
                  gradient: const LinearGradient(
                      colors: [Colors.red, Colors.orange, Colors.yellow])));
        case "01n":
          return icon = const Icon(FontAwesomeIcons.moon,
              size: 200, color: Color(0xff9DB8DF));
        case "02d":
          return icon = const Icon(FontAwesomeIcons.cloudSun,
              size: 200, color: Color(0xff9DB8DF));
        case "02n":
          return icon = const Icon(FontAwesomeIcons.cloudMoon,
              size: 200, color: Color(0xff9DB8DF));
        case "03d":
          return icon =
              const Icon(Icons.cloud, size: 200, color: Color(0xff9DB8DF));
        case "03n":
          return icon =
              const Icon(Icons.cloud, size: 200, color: Color(0xff9DB8DF));
        case "04d":
          return icon =
              const Icon(Icons.cloud, size: 200, color: Color(0xff9DB8DF));
        case "04n":
          return icon =
              const Icon(Icons.cloud, size: 200, color: Color(0xff9DB8DF));
        case "09d":
          return icon = const Icon(FontAwesomeIcons.cloudversify,
              size: 200, color: Color(0xff9DB8DF));
        case "09n":
          return icon = const Icon(FontAwesomeIcons.cloud,
              size: 200, color: Color(0xff9DB8DF));
        case "10d":
          return icon = const Icon(FontAwesomeIcons.cloudRain,
              size: 200, color: Color(0xff9DB8DF));
        case "10n":
          return icon = const Icon(FontAwesomeIcons.cloudRain,
              size: 200, color: Color(0xff9DB8DF));
        case "011d":
          return icon = const Icon(FontAwesomeIcons.cloudShowersHeavy,
              size: 200, color: Color(0xff9DB8DF));
        case "011n":
          return icon = const Icon(FontAwesomeIcons.cloudShowersHeavy,
              size: 200, color: Color(0xff9DB8DF));
        case "13d":
          return icon = const Icon(FontAwesomeIcons.snowflake,
              size: 200, color: Color(0xff9DB8DF));
        case "13n":
          return icon = const Icon(FontAwesomeIcons.snowflake,
              size: 200, color: Color(0xff9DB8DF));
        case "50d":
          return icon =
              const Icon(Icons.cloud, size: 200, color: Color(0xff9DB8DF));
        case "50n":
          return icon =
              const Icon(Icons.cloud, size: 200, color: Color(0xff9DB8DF));
        default:
          return icon = const Icon(FontAwesomeIcons.question,
              size: 200, color: Color(0xff9DB8DF));
      }
    }

    generateIcon();

    return ClipRRect(
      child: icon,
    );
  }
}
