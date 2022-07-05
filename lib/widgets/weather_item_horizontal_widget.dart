import 'package:flutter/material.dart';
import 'package:weather_app/model/future_weather_model/future_weather.dart';

//Ссылка на иконку
//https://openweathermap.org/img/wn/04d@2x.png

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
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 16),
            Image.network(
              "https://openweathermap.org/img/wn/${weatherItem.icon}@2x.png",
              width: 80,
              height: 80,
            ),
            SizedBox(width: 16),
            Text(
              weatherItem.temperature.toString(),
              style: TextStyle(
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
