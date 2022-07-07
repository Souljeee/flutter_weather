part of 'search_cubit.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Weather> cityWeatherList;

  const SearchSuccess(this.cityWeatherList);
}

class SearchError extends SearchState {}

class SearchLoading extends SearchState {}
