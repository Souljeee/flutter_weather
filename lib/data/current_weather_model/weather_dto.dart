import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/current_weather_model/weather_info.dart';

import 'coord.dart';
import 'country_information.dart';
import 'main_info.dart';

part 'weather_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherDTO {
  @JsonKey(name: "weather")
  List<WeatherInfo> weatherInfo;

  MainInfo main;

  String name;

  @JsonKey(name: "sys")
  CountryInformation country;

  @JsonKey(name: "coord")
  Coordinates coordinates;

  WeatherDTO(
      this.weatherInfo, this.main, this.name, this.country, this.coordinates);

  factory WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDTOToJson(this);
}
