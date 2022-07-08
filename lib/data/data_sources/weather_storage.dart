import '../current_weather_model/weather.dart';

class WeatherStorage {
  WeatherStorage? _instance;
  final List<Weather> _weatherList = [
    const Weather("Moscow", 30, "Sunny", "RU", "30.1", "30.1"),
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

  WeatherStorage getInstance() {
    _instance ??= WeatherStorage();
    return _instance!;
  }
}
