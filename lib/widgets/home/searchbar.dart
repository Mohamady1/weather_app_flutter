import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  void goToSearch(BuildContext context) {
    Navigator.of(context).pushNamed("/search");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToSearch(context),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Row(children: const [
          Icon(Icons.search),
          Text(
            "New Country",
            style: TextStyle(fontSize: 20, fontFamily: "Merriweather"),
          )
        ])
      ]),
    );
  }
}
