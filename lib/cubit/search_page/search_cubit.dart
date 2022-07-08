import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/data_sources/repository_local.dart';

import '../../data/current_weather_model/weather.dart';
import '../../data/current_weather_model/weather_dto.dart';
import '../../data/data_sources/repository_remote.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final RepositoryRemote repositoryRemote;
  final RepositoryLocal repositoryLocal;

  SearchCubit(this.repositoryRemote, this.repositoryLocal)
      : super(SearchInitial());

  void getCityListByName(String name) async {
    emit(SearchLoading());
    var cityListResponse = await repositoryRemote.getCityList(name);
    var list = cityListResponse.weatherList
        .map((element) => _convertToWeather(element))
        .toList();
    emit(SearchSuccess(list));
  }

  List<Weather> getAllSavedWeather() {
    return repositoryLocal.getAll();
  }

  void removeWeather(int index) {
    return repositoryLocal.remove(index);
  }

  void updateCityList(List<Weather> weather) {
    emit(SearchSuccess(weather));
  }

  void putWeatherIntoStorage(Weather weather) {}
  Weather _convertToWeather(WeatherDTO response) {
    return Weather(
      response.name,
      response.main.temp.round(),
      response.weatherInfo[0].description,
      response.country.country,
      response.coordinates.lat.toString(),
      response.coordinates.lon.toString(),
    );
  }
}
