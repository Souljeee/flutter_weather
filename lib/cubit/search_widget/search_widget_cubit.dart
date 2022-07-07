import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/current_weather_model/weather.dart';
import '../../data/current_weather_model/weather_dto.dart';
import '../../data/data_sources/repository.dart';

part 'search_widget_state.dart';

class SearchWidgetCubit extends Cubit<SearchWidgetState> {
  Timer? _debounce;
  final Repository repository;
  SearchWidgetCubit(this.repository) : super(SearchWidgetInitial());

  void onSearchChanged(String text) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      getCityListByName(text);
    });
  }

  void getCityListByName(String name) async {
    emit(SearchWidgetLoading());
    if (name == "") {
      emit(SearchWidgetInitial());
      return;
    }
    var cityListResponse = await repository.getCityList(name);
    if (cityListResponse.weatherList.isEmpty) {
      emit(SearchWidgetNothingFound());
    } else {
      var list = cityListResponse.weatherList
          .map((element) => _convertToWeather(element))
          .toList();
      emit(SearchWidgetSuccess(list));
    }
  }

  Weather _convertToWeather(WeatherDTO response) {
    return Weather(response.name, response.main.temp.round(),
        response.weatherInfo[0].description, response.country.country);
  }
}
