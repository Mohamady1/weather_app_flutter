import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/provider/data_provider.dart';

class ImageStatusGenerator extends StatelessWidget {
  const ImageStatusGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    final icon = Provider.of<DataProvider>(context).result["icon"];

    var image = "";
    generateImage() {
      switch (icon) {
        case "01d":
          return image = "assets/images/day.png";
        case "01n":
          return image = "assets/images/night.jpg";
        case "02d":
          return image = "assets/images/day.png";
        case "02n":
          return image = "assets/images/night.jpg";
        case "03d":
          return image = "assets/images/clouds.jpg";
        case "03n":
          return image = "assets/images/clouds.jpg";
        case "04d":
          return image = "assets/images/clouds.jpg";
        case "04n":
          return image = "assets/images/clouds.jpg";
        case "09d":
          return image = "assets/images/clouds.jpg";
        case "09n":
          return image = "assets/images/clouds.jpg";
        case "10d":
          return image = "assets/images/rain.jpg";
        case "10n":
          return image = "assets/images/rain.jpg";
        case "011d":
          return image = "assets/images/rain.jpg";
        case "011n":
          return image = "assets/images/rain.jpg";
        case "13d":
          return image = "assets/images/rain.jpg";
        case "13n":
          return image = "assets/images/rain.jpg";
        case "50d":
          return image = "assets/images/clouds.jpg";
        case "50n":
          return image = "assets/images/clouds.jpg";
      }
    }

    generateImage();

    return SizedBox(
      width: double.infinity,
      child: icon == null
          ? Container()
          : ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: FadeInImage(
                placeholder: const AssetImage("assets/images/placeholder.jpg"),
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
    );
  }
}
