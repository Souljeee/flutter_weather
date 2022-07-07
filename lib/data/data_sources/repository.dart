import 'package:dio/dio.dart';
import 'package:weather_app/data/current_weather_model/weather_dto.dart';
import 'package:weather_app/data/future_weather_model/weather_list.dart';

import '../city_list_model/weather_city_list.dart';

abstract class Repository {
  Future<WeatherDTO> loadCurrentWeatherData();

  Future<WeatherList> loadFutureWeatherData();

  Future<WeatherCityList> getCityList(String name);
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

  @override
  Future<WeatherCityList> getCityList(String name) async {
    final response;
    final WeatherCityList exceptionList = WeatherCityList([], "200");
    try {
      response = await dio.get(
        "https://openweathermap.org/data/2.5/find",
        queryParameters: {
          "q": name,
          "type": "like",
          "sort": "population",
          "cnt": 30,
          "appid": "439d4b804bc8187953eb36d2a8c26a02"
        },
      );
    } catch (e) {
      return exceptionList;
    }
    print(response.data);
    var cityList = WeatherCityList.fromJson(response.data);
    return cityList;
  }

//"https://api.openweathermap.org/data/2.5/weather?q=London&appid=352f72427a922105287e644be8d9dadc&lang=ru&units=metric"

}
