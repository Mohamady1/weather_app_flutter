import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/provider/data_provider.dart';

import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search.dart';
import 'package:weather_app/screens/welcome_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DataProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      routes: {
        "/home": (context) => const HomeScreen(),
        "/search": (context) => const Search()
      },
    );
  }
}
