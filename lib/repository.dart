import 'package:dio/dio.dart';

import 'model/current_weather_model/weather_dto.dart';
import 'model/future_weather_model/weather_list.dart';

abstract class Repository {
  Future<WeatherDTO> loadCurrentWeatherData();
  Future<WeatherList> loadFutureWeatherData();
}

class WeatherRepository implements Repository {
  var dio = Dio();
  @override
  Future<WeatherDTO> loadCurrentWeatherData() async {
    final response = await dio.get(
      "https://api.openweathermap.org/data/2.5/weather",
      queryParameters: {
        "q": "Krasnodar",
        "appid": "352f72427a922105287e644be8d9dadc",
        "lang": "ru",
        "units": "metric"
      },
    );
    var weather = WeatherDTO.fromJson(response.data);
    return weather;
  }

  @override
  Future<WeatherList> loadFutureWeatherData() async {
    final response = await dio.get(
        "https://api.openweathermap.org/data/2.5/forecast",
        queryParameters: {
          "q": "Krasnodar",
          "appid": "352f72427a922105287e644be8d9dadc",
          "lang": "ru",
          "units": "metric",
          "cnt": "40"
        });
    var weatherList = WeatherList.fromJson(response.data);
    return weatherList;
  }

  //"https://api.openweathermap.org/data/2.5/weather?q=London&appid=352f72427a922105287e644be8d9dadc&lang=ru&units=metric"

}
