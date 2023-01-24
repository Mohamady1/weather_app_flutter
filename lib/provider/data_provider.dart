import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DataProvider with ChangeNotifier {
  static const apiKey = "4a29cf92778614560202a2847757e184";

  final Map<String, dynamic> result = {};
  final Map<String, double> coords = {};

  String? citySearch;

  void setCity(String city) {
    citySearch = city;
    notifyListeners();
  }

  void setCoords(double lat, double lon) {
    coords.addAll({"lat": lat, "lon": lon});
    notifyListeners();
  }

  checkCity() {
    if (result["lon"].toStringAsFixed(0) == coords["lon"]?.toStringAsFixed(0) &&
        result["lat"].toStringAsFixed(0) == coords["lat"]?.toStringAsFixed(0)) {
      return "Your Location Now";
    } else {
      return "Your Search Country";
    }
  }

  Future<void> fetchWeatherDataWithCoords() async {
    final http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${coords["lat"]}&lon=${coords["lon"]}&units=metric&appid=$apiKey"));

    try {
      final data = json.decode(response.body);
      result.addAll({
        "main": data["weather"][0]["main"],
        "icon": data["weather"][0]["icon"],
        "temp": data["main"]["temp"],
        "windSpeed": data["wind"]["speed"],
        "clouds": data["clouds"]["all"],
        "city": data["name"],
        "country": data["sys"]["country"],
        "lon": data["coord"]["lon"],
        "lat": data["coord"]["lat"],
      });
    } catch (e) {
      rethrow;
    }

    notifyListeners();
  }

  Future<void> fetchWeatherDataWithCity() async {
    final http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$citySearch&units=metric&appid=$apiKey"));

    try {
      final data = json.decode(response.body);
      result.addAll({
        "main": data["weather"][0]["main"],
        "icon": data["weather"][0]["icon"],
        "temp": data["main"]["temp"],
        "windSpeed": data["wind"]["speed"],
        "clouds": data["clouds"]["all"],
        "city": data["name"],
        "country": data["sys"]["country"],
        "lon": data["coord"]["lon"],
        "lat": data["coord"]["lat"],
      });
    } catch (e) {
      rethrow;
    }

    notifyListeners();
  }
}
