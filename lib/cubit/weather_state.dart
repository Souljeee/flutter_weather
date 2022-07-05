part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final Weather weather;
  final List<FutureWeatherInfo> weatherByThreeHourList;
  final List<FutureWeatherInfo> weatherByDateList;

  const WeatherSuccess(
    this.weather,
    this.weatherByThreeHourList,
    this.weatherByDateList,
  );
}

class WeatherError extends WeatherState {}

class WeatherLoading extends WeatherState {}
