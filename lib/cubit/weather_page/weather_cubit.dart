import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/data_sources/repository_remote.dart';

import '../../data/current_weather_model/weather.dart';
import '../../data/current_weather_model/weather_dto.dart';
import '../../data/future_weather_model/future_weather.dart';
import '../../data/future_weather_model/weather_future_dto.dart';
import '../../data/future_weather_model/weather_list.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final RepositoryRemote repository;

  WeatherCubit(this.repository) : super(WeatherInitial());

  void getWeather(String lat, String lon) async {
    var weather;
    var weatherList;
    emit(WeatherLoading());

    try {
      final List responses = await Future.wait([
        repository.loadCurrentWeatherData(lat, lon),
        repository.loadFutureWeatherData(lat, lon)
      ]);

      weather = _convertToWeather(responses[0] as WeatherDTO);

      weatherList = (responses[1] as WeatherList)
          .weatherList
          .map((element) => _convertToFutureWeather(element))
          .toList();

      var weatherByDate = _getWeatherByDate(weatherList);

      emit(WeatherSuccess(weather, weatherList, weatherByDate));
    } catch (e) {
      emit(WeatherError());
    }
  }

  Weather _convertToWeather(WeatherDTO response) {
    return Weather(
        response.name,
        response.main.temp.round(),
        response.weatherInfo[0].description,
        response.country.country,
        response.coordinates.lat.toString(),
        response.coordinates.lon.toString(),
        false);
  }

  FutureWeatherInfo _convertToFutureWeather(WeatherFutureDTO response) {
    return FutureWeatherInfo(
      response.weatherInfo[0].icon,
      response.main.temp.round(),
      response.date,
    );
  }

  List<FutureWeatherInfo> _getWeatherByDate(List<FutureWeatherInfo> list) {
    return list
        .where((element) => element.time.substring(11, 16) == "12:00")
        .toList();
  }
}
