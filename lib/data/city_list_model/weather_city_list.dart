import 'package:json_annotation/json_annotation.dart';

import '../current_weather_model/weather_dto.dart';

part 'weather_city_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherCityList {
  @JsonKey(name: "cod")
  String cod;
  @JsonKey(name: "list")
  List<WeatherDTO> weatherList;

  WeatherCityList(this.weatherList, this.cod);

  factory WeatherCityList.fromJson(Map<String, dynamic> json) =>
      _$WeatherCityListFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCityListToJson(this);
}
