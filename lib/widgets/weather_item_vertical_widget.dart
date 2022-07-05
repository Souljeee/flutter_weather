import 'package:flutter/material.dart';

import '../model/future_weather_model/future_weather.dart';

class WeatherItemVerticalWidget extends StatelessWidget {
  final FutureWeatherInfo weatherItem;

  const WeatherItemVerticalWidget({
    Key? key,
    required this.weatherItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            _getTime(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Image.network(
            "https://openweathermap.org/img/wn/${weatherItem.icon}@2x.png",
            width: 80,
            height: 80,
          ),
          Text(
            weatherItem.temperature.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  String _getTime() {
    return weatherItem.time.substring(11, 16);
  }
}
