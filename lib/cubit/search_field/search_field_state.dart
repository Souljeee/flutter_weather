part of 'search_field_cubit.dart';

@immutable
abstract class SearchWidgetState {
  const SearchWidgetState();
}

class SearchWidgetInitial extends SearchWidgetState {}

class SearchWidgetSuccess extends SearchWidgetState {
  final List<Weather> cityWeatherList;

  const SearchWidgetSuccess(this.cityWeatherList);
}

class SearchWidgetNothingFound extends SearchWidgetState {}

class SearchWidgetLoading extends SearchWidgetState {}

class SearchWidgetError extends SearchWidgetState {}
