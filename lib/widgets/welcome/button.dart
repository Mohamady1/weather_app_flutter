import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/provider/data_provider.dart';

import 'package:location/location.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  var ready = true;
  Future<void> goToApp() async {
    await Location().getLocation().then((value) {
      setState(() {
        ready = false;
      });
      Provider.of<DataProvider>(context, listen: false)
          .setCoords(value.latitude!, value.longitude!);
      ready = true;
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ready == false
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          )
        : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff9DB8DF))),
                onPressed: goToApp,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "Skies Secret",
                        style: TextStyle(
                            fontSize: 32,
                            fontFamily: "Merriweather",
                            color: Colors.black,
                            fontWeight: FontWeight.w100),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: const Icon(
                            Icons.arrow_circle_right,
                            size: 40,
                            color: Colors.black,
                          ))
                    ],
                  ),
                )),
          ]);
  }
}
