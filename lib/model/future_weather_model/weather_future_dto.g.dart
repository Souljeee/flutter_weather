// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_future_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherFutureDTO _$WeatherFutureDTOFromJson(Map<String, dynamic> json) =>
    WeatherFutureDTO(
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      MainInfo.fromJson(json['main'] as Map<String, dynamic>),
      json['dt_txt'] as String,
    );

Map<String, dynamic> _$WeatherFutureDTOToJson(WeatherFutureDTO instance) =>
    <String, dynamic>{
      'weather': instance.weatherInfo,
      'main': instance.main,
      'dt_txt': instance.date,
    };
