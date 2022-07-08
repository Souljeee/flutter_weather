import 'package:flutter/material.dart';

import '../../../data/future_weather_model/future_weather.dart';

class WeatherItemHorizontalWidgets extends StatelessWidget {
  final FutureWeatherInfo weatherItem;

  const WeatherItemHorizontalWidgets({
    Key? key,
    required this.weatherItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              weatherItem.time,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 16),
            Image.network(
              "https://openweathermap.org/img/wn/${weatherItem.icon}@2x.png",
              width: 80,
              height: 80,
            ),
            const SizedBox(width: 16),
            Text(
              weatherItem.temperature.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
