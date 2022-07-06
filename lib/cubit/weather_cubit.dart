import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/data_sources/repository.dart';

import '../data/current_weather_model/weather.dart';
import '../data/current_weather_model/weather_dto.dart';
import '../data/future_weather_model/future_weather.dart';
import '../data/future_weather_model/weather_future_dto.dart';
import '../data/future_weather_model/weather_list.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final Repository repository;

  WeatherCubit(this.repository) : super(WeatherInitial());

  void getWeather() async {
    var weather;
    var weatherList;
    emit(WeatherLoading());

    try {
      final List responses = await Future.wait([
        repository.loadCurrentWeatherData(),
        repository.loadFutureWeatherData()
      ]);

      final WeatherDTO currentResponse = responses.first;

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
    return Weather(response.name, response.main.temp.round(),
        response.weatherInfo[0].description);
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
