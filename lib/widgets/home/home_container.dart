import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/provider/data_provider.dart';

import 'package:weather_app/widgets/home/box_info.dart';
import 'package:weather_app/widgets/home/icons.dart';
import 'package:weather_app/widgets/home/searchbar.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  var _isInit = true;
  var loaded = false;

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      await Provider.of<DataProvider>(context, listen: false)
          .fetchWeatherDataWithCoords()
          .catchError((e) {
        showDialog(
            context: context,
            builder: ((_) => AlertDialog(
                  title: const Text("Warning"),
                  content: const Text("Something wrong happen"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("/");
                        },
                        child: const Text("retry")),
                  ],
                )));
      }).then((_) => loaded = true);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> refresh(BuildContext context) async {
    await Provider.of<DataProvider>(context, listen: false)
        .fetchWeatherDataWithCoords();
  }

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<DataProvider>(context);
    return !loaded
        ? SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: const Center(child: CircularProgressIndicator()))
        : RefreshIndicator(
            onRefresh: () => refresh(context),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const CustomSearchBar(),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_city,
                          color: Color(0xff9D9B9B),
                        ),
                        Text(weather.checkCity(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "Merriweather",
                                fontWeight: FontWeight.bold,
                                color: Color(0xff9D9B9B))),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      child: Text(
                          weather.result["city"] +
                              ", " +
                              weather.result["country"],
                          style: const TextStyle(
                            fontSize: 24,
                            fontFamily: "Merriweather",
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInImage(
                      placeholder: const AssetImage("assets/images/flag.png"),
                      image: NetworkImage(
                          "https://flagcdn.com/48x36/${weather.result["country"].toLowerCase()}.png"),
                      width: double.infinity,
                      height: 87,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IconsGenerator(icon: weather.result["icon"]),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      weather.result["main"],
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w100,
                          fontFamily: "Merriweather"),
                    ),
                    Text(
                      weather.result["temp"].toStringAsFixed(0) + " C",
                      style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: "Merriweather"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Box(
                            icon: Icons.wind_power,
                            title:
                                weather.result["windSpeed"].toStringAsFixed(0) +
                                    " km/h"),
                        const SizedBox(
                          width: 10,
                        ),
                        Box(
                            icon: Icons.cloud_sharp,
                            title: "${weather.result["clouds"]} %")
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
