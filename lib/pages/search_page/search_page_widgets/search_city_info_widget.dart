import 'package:flutter/material.dart';

import '../../../data/current_weather_model/weather.dart';

class SearchCityInfo extends StatelessWidget {
  final Weather item;

  const SearchCityInfo({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "${item.cityName}, ${item.country}",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
