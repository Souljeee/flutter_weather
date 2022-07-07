import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/current_weather_model/weather.dart';
import '../../data/current_weather_model/weather_dto.dart';
import '../../data/data_sources/repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final Repository repository;

  SearchCubit(this.repository) : super(SearchInitial());

  void getCityListByName(String name) async {
    emit(SearchLoading());
    var cityListResponse = await repository.getCityList(name);
    var list = cityListResponse.weatherList
        .map((element) => _convertToWeather(element))
        .toList();
    emit(SearchSuccess(list));
  }

  Weather _convertToWeather(WeatherDTO response) {
    return Weather(response.name, response.main.temp.round(),
        response.weatherInfo[0].description, response.country.country);
  }
}
