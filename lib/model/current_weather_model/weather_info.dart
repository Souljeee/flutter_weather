import 'package:json_annotation/json_annotation.dart';

part 'weather_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherInfo{
  final String description;
  final String icon;

  const WeatherInfo(this.description, this.icon);

  factory WeatherInfo.fromJson(Map<String, dynamic> json) => _$WeatherInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);

}