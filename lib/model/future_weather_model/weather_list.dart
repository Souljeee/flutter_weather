import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/current_weather_model/weather_dto.dart';
import 'package:weather_app/model/future_weather_model/weather_future_dto.dart';

part 'weather_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherList {
  @JsonKey(name: "list")
  List<WeatherFutureDTO> weatherList;

  WeatherList(this.weatherList);

  factory WeatherList.fromJson(Map<String, dynamic> json) =>
      _$WeatherListFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherListToJson(this);
}
