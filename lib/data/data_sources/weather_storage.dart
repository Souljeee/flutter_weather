import '../current_weather_model/weather.dart';

class WeatherStorage {
  WeatherStorage._();
  static WeatherStorage? _instance;
  final List<Weather> _weatherList = [
    Weather("Краснодар", 20, "солнечно", "ru", "34.1", "26.2", false),
    Weather("Калуга", 20, "солнечно", "ru", "34.1", "26.2", false),
    Weather("Воронеж", 20, "солнечно", "ru", "34.1", "26.2", true),
    Weather("Гремячинск", 20, "солнечно", "ru", "34.1", "26.2", false),
    Weather("Абакан", 20, "солнечно", "ru", "34.1", "26.2", false),
    Weather("Бирск", 20, "солнечно", "ru", "34.1", "26.2", false),
    Weather("Казань", 20, "солнечно", "ru", "34.1", "26.2", true),
    Weather("Жигулевск", 20, "солнечно", "ru", "34.1", "26.2", false),
    Weather("Елабуга", 20, "солнечно", "ru", "34.1", "26.2", true),
    Weather("Барнаул", 20, "солнечно", "ru", "34.1", "26.2", true),
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
