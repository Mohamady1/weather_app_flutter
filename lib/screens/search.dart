import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/provider/data_provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _city = TextEditingController();

  @override
  void initState() {
    _city.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _city.removeListener(() {});
    super.dispose();
  }

  Future<void> onSubmit(BuildContext context) async {
    if (_city.text.isEmpty) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text("Type City To Search")));
    } else {
      Provider.of<DataProvider>(context, listen: false).setCity(_city.text);
      Provider.of<DataProvider>(context, listen: false)
          .fetchWeatherDataWithCity()
          .then((value) {
        Navigator.pop(context);
      }).catchError((e) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text("retype City Name or Check your network, please try again"),
          backgroundColor: Color(0xff9DB8DF),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image.asset("assets/images/add.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              child: TextField(
                style:
                    const TextStyle(fontFamily: "Merriweather", fontSize: 20),
                decoration: InputDecoration(
                  labelText: "City Name",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blue)),
                ),
                controller: _city,
                onSubmitted: (_) => onSubmit(context),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => onSubmit(context),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.remove_red_eye),
          )),
    );
  }
}
