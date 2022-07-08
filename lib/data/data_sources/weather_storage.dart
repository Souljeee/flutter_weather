import '../current_weather_model/weather.dart';

class WeatherStorage {
  WeatherStorage._();
  static WeatherStorage? _instance;
  final List<Weather> _weatherList = [
    Weather("Moscow", 30, "Sunny", "RU", "30.1", "30.1", false),
  ];

  void addWeather(Weather weather) {
    _weatherList.add(weather);
  }

  void removeWeather(int index) {
    _weatherList.removeAt(index);
  }

  Weather getWeather(int index) {
    return _weatherList[index];
  }

  List<Weather> getAll() {
    return _weatherList;
  }

  static WeatherStorage getInstance() {
    _instance ??= WeatherStorage._();
    return _instance!;
  }
}
