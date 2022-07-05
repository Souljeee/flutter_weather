import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/current_weather_model/weather_info.dart';

import '../current_weather_model/main_info.dart';

part 'weather_future_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherFutureDTO {
  @JsonKey(name: "weather")
  List<WeatherInfo> weatherInfo;

  MainInfo main;

  @JsonKey(name: "dt_txt")
  String date;

  WeatherFutureDTO(this.weatherInfo, this.main, this.date);

  factory WeatherFutureDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherFutureDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherFutureDTOToJson(this);
}
