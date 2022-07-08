import 'package:weather_app/data/data_sources/weather_storage.dart';

import '../current_weather_model/weather.dart';

abstract class RepositoryLocal {
  void putWeather(Weather weather);
  List<Weather> getAll();
  void remove(int index);
}

class WeatherLocalRepository implements RepositoryLocal {
  WeatherStorage storage;
  WeatherLocalRepository(this.storage);

  @override
  void putWeather(Weather weather) {
    storage.addWeather(weather);
  }

  @override
  List<Weather> getAll() {
    return storage.getAll();
  }

  @override
  void remove(int index) {
    storage.removeWeather(index);
  }
}
