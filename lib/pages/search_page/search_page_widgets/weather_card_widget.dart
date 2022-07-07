import 'package:flutter/material.dart';

import '../../../data/current_weather_model/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather item;

  const WeatherCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text(
                    item.cityName,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 4),
                  child: Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _calculateCelsius(item.temperature).toString(),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  int _calculateCelsius(int temperature) {
    return (temperature - 273.15).round();
  }
}
