import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/data_sources/repository_local.dart';

import '../../data/current_weather_model/weather.dart';
import '../../data/current_weather_model/weather_dto.dart';
import '../../data/data_sources/repository_remote.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final RepositoryRemote _repositoryRemote;
  final RepositoryLocal _repositoryLocal;

  SearchCubit(this._repositoryRemote, this._repositoryLocal)
      : super(SearchInitial());

  void getCityListByName(String name) async {
    emit(SearchLoading());
    var cityListResponse = await _repositoryRemote.getCityList(name);
    var list = cityListResponse.weatherList
        .map((element) => _convertToWeather(element))
        .toList();
    emit(SearchSuccess(sortFavourite(list)));
  }

  List<Weather> getAllWeather() => _repositoryLocal.getAll();

  List<Weather> sortFavourite(List<Weather> weather) {
    final List<Weather> listFavourite =
        weather.where((element) => element.isFavourite).toList();
    final List<Weather> listNotFavourite =
        weather.where((element) => !element.isFavourite).toList();
    listFavourite.sort((a, b) => a.cityName.compareTo(b.cityName));
    listNotFavourite.sort((a, b) => a.cityName.compareTo(b.cityName));
    listFavourite.addAll(listNotFavourite);
    return listFavourite;
  }

  List<Weather> getAllSavedWeather() {
    return _repositoryLocal.getAll();
  }

  void removeWeather(int index) {
    return _repositoryLocal.remove(index);
  }

  void updateFavourite(Weather weather) {
    List<Weather> list = _repositoryLocal.getAll();
    int index = list.indexOf(weather);
    list[index].isFavourite = !list[index].isFavourite;
    list.sort((a, b) => a.cityName.compareTo(b.cityName));
    emit(SearchSuccess(sortFavourite(list)));
  }

  void updateCityList() {
    List<Weather> list = _repositoryLocal.getAll();
    list.sort((a, b) => a.cityName.compareTo(b.cityName));
    emit(SearchSuccess(sortFavourite(list)));
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
}
